//
//  DYPPeriodFilter.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPeriodFilterImpl.h"
#import "NSDate+Escort.h"

@implementation DYPPeriodFilterImpl

#pragma mark - constructor
-(instancetype)initWithFirstDate:(NSDate *)date andLastDate:(NSDate *)lastDate {
    if (self = [super init]) {
        _from = date;
        _to = lastDate;
    } return self;
}

#pragma mark - analyze
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    if ([self.from isEarlierThanOrEqualDate:[asset creationDate]] && [self.to isLaterThanOrEqualDate:[asset creationDate]]) isElegible();
}

#pragma mark - represent
-(NSString *)explain {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    return [NSString stringWithFormat:@"%@ to %@", [dateFormatter stringFromDate:self.from], [dateFormatter stringFromDate:self.to]];
}

@end
