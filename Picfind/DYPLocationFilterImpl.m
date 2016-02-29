//
//  DYPLocationFilter.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLocationFilterImpl.h"

@implementation DYPLocationFilterImpl

#pragma mark - constructor
-(instancetype)initWithLocation:(CLLocation *)location andRange:(NSInteger)range {
    if (self = [super init]) {
        _location = location;
        _range = range;
    } return self;
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegibleCallback {
    if ([asset location] == nil) return;
    CGFloat distanceFromPointToAsset = [[self location] distanceFromLocation:[asset location]];
    if (self.range >= distanceFromPointToAsset) isElegibleCallback();
}


#pragma mark - explain
-(NSString *)explain {
    MKDistanceFormatter *distanceFormatter = [[MKDistanceFormatter alloc] init];
    [distanceFormatter setUnits:MKDistanceFormatterUnitsMetric];
    return [NSString stringWithFormat:@"%.2f, %.2f; range: %@", self.location.coordinate.latitude, self.location.coordinate.longitude, [distanceFormatter stringFromDistance:self.range]];
}

#pragma mark - annontation
-(NSString *)title {
    return @"Location";
}
-(NSString *)subtitle {
    return @"Search for photos nearby";
}
-(CLLocationCoordinate2D)coordinate {
    return self.location.coordinate;
}

@end
