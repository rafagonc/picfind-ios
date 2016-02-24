//
//  DYPLocationManagerImpl.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLocationManagerImpl.h"
#import <CoreLocation/CoreLocation.h>

@interface DYPLocationManagerImpl () <CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;
}

@property BOOL available;

@end

@implementation DYPLocationManagerImpl

#pragma mark - Constructor
-(instancetype)init {
    if (self = [super init]) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [locationManager requestWhenInUseAuthorization];
        }
        [locationManager setDelegate:self];
        [locationManager startUpdatingLocation];
        [locationManager startMonitoringSignificantLocationChanges];
        self.available = NO;
    } return self;
}
+(DYPLocationManagerImpl *)sharedManager {
    static DYPLocationManagerImpl *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

#pragma mark -  Location Manager Delegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status ==  kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusNotDetermined) {
        self.available = YES;
    } else {
        self.available = NO;
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.available = YES;
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.available = NO;
}

#pragma mark -  Getters
-(CLLocation *)userLocation {
    return locationManager.location;
}

#pragma mark -  Dealloc
-(void)dealloc {
}

@end
