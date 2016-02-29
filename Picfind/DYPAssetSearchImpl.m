//
//  DYPAssetSearch.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/28/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAssetSearchImpl.h"
#import "DYPFilterCollection.h"
#import "DYPAssetProtocol.h"

@import Photos;

@interface DYPAssetSearchImpl ()

@end

@implementation DYPAssetSearchImpl

#pragma mark - assets
-(void)assetsWithFilterCollection:(DYPFilterCollection *)collection callback:(void(^)(NSArray <id<DYPAssetProtocol>> * assets))callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        PHFetchResult *result = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
        NSMutableArray *assets = [[NSMutableArray alloc] init];
        [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id<DYPAssetProtocol> asset = (id<DYPAssetProtocol>)obj;
            for (id<DYPFilter> filter in collection)
                [filter analyze:asset isElegible:^{
                    [assets addObject:asset];
                }];
        }];
        dispatch_sync(dispatch_get_main_queue(), ^{
            callback(assets);
        });
    });
}

@end
