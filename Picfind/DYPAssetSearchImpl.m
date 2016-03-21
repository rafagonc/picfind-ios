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
#import "DYPAssetDataAccessObject.h"

@interface DYPAssetSearchImpl ()

@property (setter=injected:,readonly) id<DYPAssetDataAccessObject> assetDataAccessObject;

@end

@implementation DYPAssetSearchImpl

#pragma mark - assets
-(void)assetsWithFilterCollection:(DYPFilterCollection *)collection callback:(void(^)(NSArray <id<DYPAssetProtocol>> * assets))callback progress:(void(^)(CGFloat progress))progress_callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSMutableArray *assets = [[NSMutableArray alloc] init];
        NSArray *result = (NSArray *)[self.assetDataAccessObject all];
        NSInteger result_count = [result count];
        [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id<DYPAssetProtocol> asset = (id<DYPAssetProtocol>)obj;
            __block NSUInteger count = 0;
            for (id<DYPFilter> filter in collection)
                [filter analyze:asset isElegible:^{
                    count++;
                    if (count == [collection count]) {
                        [assets addObject:asset];
                    }
                }];
            dispatch_sync(dispatch_get_main_queue(), ^{
                progress_callback((CGFloat)idx/result_count);
            });
            if (result.count == idx + 1) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    callback(assets);
                    *stop = YES;
                });
            }
        }];

    });
}

@end
