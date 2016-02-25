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
-(BOOL)analyze:(id<DYPAssetProtocol>)asset {
    return NO;
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
