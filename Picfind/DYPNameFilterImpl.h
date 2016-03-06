//
//  DYPNameFilterImpl.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/5/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPNameFilter.h"

@interface DYPNameFilterImpl : NSObject

<DYPNameFilter>

#pragma mark - constructor
-(instancetype)initWithName:(NSString *)name;

#pragma mark - properties
@property (nonatomic,readonly) NSString *name;

@end
