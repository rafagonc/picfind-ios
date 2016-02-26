//
//  DYPPeriodFilter.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPeriodFilterImpl.h"

@implementation DYPPeriodFilterImpl

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

#pragma mark - represent
-(NSString *)explain {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    return [NSString stringWithFormat:@"%@ to %@", [dateFormatter stringFromDate:self.from], [dateFormatter stringFromDate:self.to]];
}

@end
