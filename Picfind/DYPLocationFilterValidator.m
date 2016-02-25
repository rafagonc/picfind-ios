//
//  DYPLocationFilterValidator.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLocationFilterValidator.h"
#import "DYPLocationFilter.h"

@implementation DYPLocationFilterValidator

-(BOOL)validate:(id)obj error:(NSError *__autoreleasing *)error {
    id<DYPLocationFilter> locationFilter = (id<DYPLocationFilter>)obj;
    if ([locationFilter location] == nil) {
        if (error) *error = [NSError errorWithDomain:@"DYPErrorDomain" code:101 userInfo:@{NSLocalizedDescriptionKey : @"Tap the map to set a location"}];
        return NO;
    }
    if ([locationFilter range] < 300 || [locationFilter range] > 50000) {
        if (error) *error = [NSError errorWithDomain:@"DYPErrorDomain" code:101 userInfo:@{NSLocalizedDescriptionKey : @"The range is not correct"}];

        return NO;
    }
    
    return YES;
}

@end
