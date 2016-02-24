//
//  DYPPhotosViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPhotosViewController.h"
#import "DYPAssetDataAccessObject.h"
#import "DYPAssetCell.h"
#import "DYPCollectionViewDatasourceProtocol.h"
#import "UISearchBar+Toolbar.h"
#import "RFQuiltLayout.h"
#import "DYPAssetDatasourceDelegate.h"
#import "UIStaticTableView.h"
#import "DYPFilterCell.h"
#import "UIFont+DYP.h"
#import "UIColor+DYP.h"
#import "DYPPhotoCollectionCell.h"
#import "DYPLocationFilterViewController.h"
#import "DYPPeriodFilterViewController.h"
#import "DYPStartFaceRecognitionViewController.h"
#import "DYPCustomizer.h"
#import "DYPFilterCreatorDelegate.h"

@interface DYPPhotosViewController () <UICollectionViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, DYPFilterCreatorDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;

#pragma mark - properties
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSMutableArray <id<DYPFilter>> * appliedFilters;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPAssetDataAccessObject> assetDataAccessObject;
@property (setter=injected_nav:,readonly) id<DYPCustomizer> navigationBarCustomizer;

@end

@implementation DYPPhotosViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    //setups
    self.appliedFilters = [@[] mutableCopy];
    [self setupTableView];
    [self setupSearchController];
    [self setDefinesPresentationContext:YES];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationBarCustomizer customize:self.navigationController.navigationBar];
}

#pragma mark - setup
-(void)setupTableView {
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"Filters"];
    
    DYPFilterCell *periodFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Period Filter"];
    [periodFilter addTarget:self selector:@selector(periodFilterWasSelected:)];
    [self.tableView addCell:periodFilter onSection:section];
    
    DYPFilterCell *locationFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Location Filter"];
    [locationFilter addTarget:self selector:@selector(locationFilterWasSelected:)];
    [self.tableView addCell:locationFilter onSection:section];
    
    DYPFilterCell *faceFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Face Recognition"];
    [faceFilter addTarget:self selector:@selector(faceFilterWasSelected:)];
    [self.tableView addCell:faceFilter onSection:section];
    
    UIStaticTableViewSection *recentsSection = [[UIStaticTableViewSection alloc] init];
    [recentsSection setHeaderName:@"Recents"];
    
    DYPPhotoCollectionCell *photosCell = [[DYPPhotoCollectionCell alloc] init];
    [photosCell setAssets:[self.assetDataAccessObject recents]];
    [self.tableView addCell:photosCell onSection:recentsSection];
    
    [self.tableView addSection:section];
    [self.tableView addSection:recentsSection];
}
-(void)setupSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"Quick search photos by location";
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.searchBar.tintColor = [UIColor dyp_redColor];
    [self.searchController.searchBar addToolbar];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
}

#pragma mark - actions
-(void)periodFilterWasSelected:(DYPFilterCell *)cell {
    DYPPeriodFilterViewController *period = [[DYPPeriodFilterViewController alloc] init];
    [self.navigationController pushViewController:period animated:YES];
}
-(void)locationFilterWasSelected:(DYPFilterCell *)cell {
    DYPLocationFilterViewController *location = [[DYPLocationFilterViewController alloc] init];
    [self.navigationController pushViewController:location animated:YES];
}
-(void)faceFilterWasSelected:(DYPFilterCell *)cell {
    DYPStartFaceRecognitionViewController *start = [[DYPStartFaceRecognitionViewController alloc] init];
    [self.navigationController pushViewController:start animated:YES];
}

#pragma mark - delegates
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}
-(void)source:(id)source didCreateFilter:(id<DYPFilter>)filter {
    [self.appliedFilters addObject:filter];
}

#pragma mark - dealloc
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
