//
//  DYPPeriodFilter.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPeriodFilter.h"

@implementation DYPPeriodFilter

#pragma mark - constructor
-(instancetype)initWithFirstDate:(NSDate *)date andLastDate:(NSDate *)lastDate {
    if (self = [super init]) {
        _from = date;
        _to = lastDate;
    } return self;
}

#pragma mark - analyze
-(BOOL)analyze:(id<DYPAssetProtocol>)asset {
    return NO;
}

@end
