//
//  DYPMapCell.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPMapCell.h"
#import <MapKit/MapKit.h>
#import "DYPLocationManager.h"
#import "DYPLocation.h"
#import "DYPMapViewDatasource.h"

@interface DYPMapCell () <MKMapViewDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

#pragma mark - properties
@property (nonatomic,strong) DYPLocation *annon;

#pragma mark - injected
@property (setter=injected:)id<DYPLocationManager> locationManager;
@property (setter=injected:)id<DYPMapViewDatasource> mapDatasource;

@end

@implementation DYPMapCell

#pragma mark - constructor
-(instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
    } return self;
}

#pragma mark - overrides
-(void)awakeFromNib {
    //setup map
    [self.mapView setDelegate:self.mapDatasource];
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance([self.locationManager userLocation].coordinate, 40000, 40000) animated:NO];

}

#pragma mark - setters
-(void)setLocationFilter:(id<DYPLocationFilter>)locationFilter {
    _locationFilter = locationFilter;
    if (locationFilter) {
        [self setRange:[_locationFilter range]];
        [self.mapView setCenterCoordinate:[locationFilter location].coordinate animated:YES];
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance([locationFilter location].coordinate, 40000, 40000)];
        [self addAnnonForCoordinate:[locationFilter location].coordinate];
    } else {
        [self setRange:300];
        [self.mapView setCenterCoordinate:[self.locationManager userLocation].coordinate animated:YES];
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance([self.locationManager userLocation].coordinate, 40000, 40000)];
    }
}
-(void)setRange:(NSInteger)range {
    _range = range;
    [self addAnnonForCoordinate:self.annon.coordinate];
}
-(void)setSearchedLocation:(CLLocation *)searchedLocation {
    _searchedLocation = searchedLocation;
    [self addAnnonForCoordinate:searchedLocation.coordinate];
    [self.mapView setCenterCoordinate:searchedLocation.coordinate animated:YES];
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(searchedLocation.coordinate, 40000, 40000) animated:YES];
}

#pragma mark - getters
-(CLLocation *)finalLocation {
    return [[CLLocation alloc] initWithLatitude:self.annon.coordinate.latitude longitude:self.annon.coordinate.longitude];
}

#pragma mark - touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.contentView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:location toCoordinateFromView:self.contentView];
    [self addAnnonForCoordinate:coordinate];
}

#pragma mark - methods
-(void)addAnnonForCoordinate:(CLLocationCoordinate2D)coordinate {
    self.annon = [[DYPLocation alloc] init];
    self.annon.location = coordinate;
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:coordinate radius:self.range > 0 ? self.range : 300];
    
    //reset overlays
    [self.mapView removeOverlays:self.mapView.overlays];
    [self.mapView addOverlay:circle];
    
    //reset annontations
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:self.annon];
}



@end
