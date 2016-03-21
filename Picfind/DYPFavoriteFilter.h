//
//  DYPFavoriteFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilter.h"

typedef NS_ENUM(NSUInteger, DYPFavoriteFilterType) {
    DYPFavoriteFilterTypeAllFavs = 1,
    DYPFavoriteFilterTypeYesFavs = 2,
    DYPFavoriteFilterTypeNoFavs = 3,
};

@protocol DYPFavoriteFilter <DYPFilter>

-(void)setType:(DYPFavoriteFilterType)type;
-(DYPFavoriteFilterType)type;

@end
