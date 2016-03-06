//
//  DYPFilterCollection.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/26/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilterCollection.h"

@interface DYPFilterCollection ()

@property (nonatomic,strong) NSMutableArray *backingArray;

@end

@implementation DYPFilterCollection

#pragma mark - constructor
-(instancetype)init {
    if (self = [super init]) {
        self.backingArray = [[NSMutableArray alloc] init];
    } return self;
}
-(instancetype)initWithFilters:(id<NSCollection>)filters {
    if (self = [super init]) {
        self.backingArray = [[NSMutableArray alloc] init];
        [self.backingArray addObjectsFromArray:(NSArray *)filters];
    } return self;
}

#pragma mark - copying
-(id)copyWithZone:(NSZone *)zone {
    return [[DYPFilterCollection alloc] initWithFilters:(id<NSCollection>)self.backingArray];
}

#pragma mark - adding adn removing
-(void)addFilter:(id<DYPFilter>)filter {
    [self removeFilterOfClass:[filter class]];
    [self.backingArray addObject:filter];
}
-(void)removeFilter:(id<DYPFilter>)filter {
    [self removeFilterOfClass:[filter class]];
}
-(void)removeFilterOfClass:(Class)class {
    id toDelete;
    for (id<DYPFilter> filter in self.backingArray) {
        if ([filter isKindOfClass:class]) {
            toDelete = filter;
        }
    }
    [self.backingArray removeObject:toDelete];
}
-(void)clean {
    [self.backingArray removeAllObjects];
}

#pragma mark - find
-(id<DYPFilter>)filterWithProtocol:(Protocol *)protocol {
    for (id<DYPFilter> filter in self.backingArray) {
        if ([filter conformsToProtocol:protocol]) {
            return filter;
        }
    }
    return nil;
}

#pragma mark - fast enumeration 
-(NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nonnull *)buffer count:(NSUInteger)len {
    return [self.backingArray countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark - fowarding
-(void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([self respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self];
    } else {
        [anInvocation invokeWithTarget:self.backingArray];
    }
}

@end
