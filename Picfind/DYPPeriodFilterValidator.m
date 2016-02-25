//
//  DYPPeriodFilterValidator.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPeriodFilterValidator.h"
#import "DYPPeriodFilter.h"

@implementation DYPPeriodFilterValidator

-(BOOL)validate:(id)obj error:(NSError *__autoreleasing *)error {
    id<DYPPeriodFilter> period = (id<DYPPeriodFilter>)obj;
    if ([period from] == nil || period.to == nil) {
        if (error) *error = [NSError errorWithDomain:@"DYPErrorDomain" code:101 userInfo:@{NSLocalizedDescriptionKey : @"Fill all the blank fields!"}];
        return NO;
    }
    
    if ([[[period from] laterDate:period.to] isEqualToDate:[period from]]) {
        if (error) *error = [NSError errorWithDomain:@"DYPErrorDomain" code:101 userInfo:@{NSLocalizedDescriptionKey : @"The end date must be later than the begin date"}];
        return NO;
    }
    
    return YES;
}

@end
