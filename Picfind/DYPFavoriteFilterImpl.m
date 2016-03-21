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
            return @"All Photos";
            break;
        case DYPFavoriteFilterTypeNoFavs:
            return @"No Favorite Pictures";
            break;
            
        case DYPFavoriteFilterTypeYesFavs:
            return @"Just Favorite Pictures";
            break;
    }
    return @"";
}

@end
