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
    NSMutableString *albums = [@"📕 " mutableCopy];
    for (id<DYPCollectionProtocol> collection in self.albums) {
        [albums appendString:[collection isEqual:[self.albums lastObject]] ? [NSString stringWithFormat:@"%@", [collection name]] : [NSString stringWithFormat:@"%@, ", [collection name]]];
    }
    return [albums copy];
}
-(DYPFilterPriority)priority {
    return DYPFilterPriorityFast;
}

@end
