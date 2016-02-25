//
//  DYPPeriodFilter.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPPeriodFilter.h"

@interface DYPPeriodFilterImpl : NSObject

<DYPPeriodFilter>

#pragma mark - constructor
-(instancetype)initWithFirstDate:(NSDate *)date andLastDate:(NSDate *)lastDate;

#pragma mark - properties
@property (nonatomic,readonly) NSDate * from;
@property (nonatomic,readonly) NSDate * to;

@end
