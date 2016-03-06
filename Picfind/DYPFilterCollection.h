//
//  DYPFilterCollection.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/26/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSCollection.h"
#import "DYPFilter.h"

@interface DYPFilterCollection : NSObject

<NSCollection>

#pragma mark - constructor
-(instancetype)init;
-(instancetype)initWithFilters:(id<NSCollection>)filters;

#pragma mark - adding
-(void)addFilter:(id<DYPFilter>)filter;
-(void)removeFilter:(id<DYPFilter>)filter;
-(id<DYPFilter>)filterWithProtocol:(Protocol *)protocol;
-(void)clean;

@end
