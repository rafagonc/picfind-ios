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

@interface DYPLocationFilterViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPLocationManager> locationManager;

@end

@implementation DYPLocationFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    //map vieew
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setCenterCoordinate:[self.locationManager userLocation].coordinate animated:YES];
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance([self.locationManager userLocation].coordinate, 40000, 40000)];
    
    //search bar
    [self.searchBar addToolbar];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
