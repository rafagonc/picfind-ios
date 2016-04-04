//
//  PHFetchResult+Sort.m
//  Picfind
//
//  Created by Rafael Gonzalves on 4/2/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "PHFetchResult+Sort.h"

@implementation PHFetchResult (Sort)

-(id<NSCollection>)sortedArrayUsingDescriptors:(NSArray <NSSortDescriptor *> *)sortDescriptors {
    NSMutableArray * assets = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [assets addObject:obj];
    }];
    return (id<NSCollection>)[assets sortedArrayUsingDescriptors:sortDescriptors];
}

@end
