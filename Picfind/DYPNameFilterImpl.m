//
//  DYPNameFilterImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/5/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPNameFilterImpl.h"

@implementation DYPNameFilterImpl

#pragma mark - constructor
-(instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    } return self;
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_filename BEGINSWITH[cd] %@", _name];
    if ([predicate evaluateWithObject:asset]) {
        isElegible();
    }
}
-(NSString *)explain {
    return @"";
}

@end
