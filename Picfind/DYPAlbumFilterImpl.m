//
//  DYPAlbumFilter.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAlbumFilterImpl.h"
#import "DYPCollectionProtocol.h"

@interface DYPAlbumFilterImpl ()

@property (nonatomic,strong) id<NSCollection> albums;

@end

@implementation DYPAlbumFilterImpl

#pragma mark - constructor
-(instancetype)initWithAlbums:(id<NSCollection>)albums {
    if (self = [super init]) {
        _albums = albums;
    } return self;
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    for (id<DYPCollectionProtocol> collection in self.albums) {
        if ([collection contains:asset]) {
            isElegible();
        }
    }
}
-(NSString *)explain {
    return @"";
}

@end
