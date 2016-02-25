//
//  DYPLocationFilter.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "DYPLocationFilter.h"

@interface DYPLocationFilterImpl : NSObject

<DYPLocationFilter>

#pragma mark - constructor
-(instancetype)init __attribute__ ((unavailable("use designated initializer")));
-(instancetype)initWithLocation:(CLLocation *)location andRange:(NSInteger)range;

#pragma mark - properties
@property (nonatomic,readonly) CLLocation * location;
@property (nonatomic,readonly) NSInteger    range;

@end
