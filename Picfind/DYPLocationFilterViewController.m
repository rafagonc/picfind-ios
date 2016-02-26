//
//  DYPLocationFilterViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLocationFilterViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DYPLocationManager.h"
#import "MKMapView+Zoom.h"
#import "UISearchBar+Toolbar.h"
#import "UIStaticTableView.h"
#import "DYPMapCell.h"
#import "DYPMapSearchCell.h"
#import "DYPRangeCell.h"
#import "DYPFilterFactory.h"
#import "DYPValidation.h"
#import "UIViewController+NotificationShow.h"
#import "DYPQuote.h"

@interface DYPLocationFilterViewController () <DYPRangeCellDelegate, DYPMapSearchCellDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;
@property (weak, nonatomic) DYPMapCell * mapCell;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

#pragma mark - properties
@property (nonatomic,strong) id<DYPLocationFilter> locationFilter;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPQuote> quote;
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;
@property (setter=injected_location:,readonly) id<DYPValidation> locationValidator;

@end

@implementation DYPLocationFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}
-(instancetype)initWithLocationFilter:(id<DYPLocationFilter>)locationFilter {
    self = [self init];
    _locationFilter = locationFilter;
    return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Location Filter"];
    [self.quoteLabel setText:[self.quote random]];
    [self createTableView];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *applyItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyAction:)];
    [self.navigationItem setRightBarButtonItem:applyItem];
}

#pragma mark - table view
-(void)createTableView {
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"search a placemark or tap the map to set a location"];
    
    DYPMapSearchCell *mapSearchCell = [[DYPMapSearchCell alloc] init];
    [mapSearchCell setLocationFilter:self.locationFilter];
    [mapSearchCell setDelegate:self];
    [self.tableView addCell:mapSearchCell onSection:section];
    
    DYPMapCell *mapCell = [[DYPMapCell alloc] init];
    [mapCell setLocationFilter:self.locationFilter];
    [self.tableView addCell:mapCell onSection:section];
    [self setMapCell:mapCell];
    
    DYPRangeCell *rangeCell = [[DYPRangeCell alloc] init];
    [rangeCell setLocationFilter:self.locationFilter];
    [rangeCell setDelegate:self];
    [self.tableView addCell:rangeCell onSection:section];
    
    [self.tableView addSection:section];
}

#pragma mark - cell delegate
-(void)rangeCell:(DYPRangeCell *)rangeCell didChangeRangeSlider:(NSInteger)range {
    [self.mapCell setRange:range];
}
-(void)mapSearchCell:(DYPMapSearchCell *)mapSearchCell didSearchForLocation:(CLLocation *)location {
    [self.mapCell setSearchedLocation:location];
}

#pragma mark - create
-(id<DYPFilter>)createLocationFilterWithError:(NSError **)error {
    id<DYPFilter> locationFilter = [self.filterFactory locationFilterWith:[self.mapCell finalLocation] range:[self.mapCell range]];
    if (![self.locationValidator validate:locationFilter error:error]) {
        return nil;
    }
    return locationFilter;
}

#pragma mark - actions
-(void)applyAction:(UIBarButtonItem *)item {
    NSError *error;
    id<DYPFilter> filter = [self createLocationFilterWithError:&error];
    if (error) {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:[error localizedDescription]];
    } else {
        [self.delegate source:self didCreateFilter:filter];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
