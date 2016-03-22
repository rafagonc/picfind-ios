//
//  DYPFavoriteFilter.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFavoriteFilterImpl.h"

@implementation DYPFavoriteFilterImpl

#pragma mark - constructor
-(instancetype)initWithType:(DYPFavoriteFilterType)type {
    if (self = [super init]) {
        _type = type;
    } return self;
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    switch (self.type) {
        case DYPFavoriteFilterTypeAllFavs:
            isElegible();
            break;
        case DYPFavoriteFilterTypeNoFavs:
            if (![asset isFavorite]) isElegible();
            break;
        case DYPFavoriteFilterTypeYesFavs:
            if ([asset isFavorite]) isElegible();
            break;
    }
}
-(NSString *)explain {
    switch (self.type) {
        case DYPFavoriteFilterTypeAllFavs:
            return @"Include all pictures";
            break;
        case DYPFavoriteFilterTypeNoFavs:
            return @"Does not include ❤️ pictures";
            break;
        case DYPFavoriteFilterTypeYesFavs:
            return @"Include only ❤️ pictures";
            break;
    }
    return @"";
}
-(DYPFilterPriority)priority {
    return DYPFilterPriorityFast;
}

@end
