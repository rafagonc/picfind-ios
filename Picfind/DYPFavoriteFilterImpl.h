//
//  DYPFavoriteFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFavoriteFilter.h"

@interface DYPFavoriteFilterImpl : NSObject

<DYPFavoriteFilter>

#pragma mark - constructor
-(instancetype)initWithType:(DYPFavoriteFilterType)type;

#pragma mark - properties
@property (nonatomic,assign) DYPFavoriteFilterType type;

@end
