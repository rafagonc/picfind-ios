
//
//  DYPLocation.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLocation.h"

@implementation DYPLocation

#pragma mark - annontation
-(NSString *)title {
    return @"Location";
}
-(NSString *)subtitle {
    return @"Search for photos nearby";
}
-(CLLocationCoordinate2D)coordinate {
    return self.location;
}


@end
