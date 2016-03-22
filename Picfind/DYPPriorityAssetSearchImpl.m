//
//  DYPPriorityAssetSearchImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPriorityAssetSearchImpl.h"
#import "DYPAssetDataAccessObject.h"

@interface DYPPriorityAssetSearchImpl ()

@property (setter=injected:,readonly) id<DYPAssetDataAccessObject> assetDataAccessObject;

@end

@implementation DYPPriorityAssetSearchImpl

#pragma mark - search
-(void)assetsWithFilterCollection:(DYPFilterCollection *)collection callback:(void (^)(NSArray<id<DYPAssetProtocol>> *))callback progress:(void (^)(CGFloat))progress_callback {
    NSArray *highPriorityFilters = [collection filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"priority = %lu", DYPFilterPriorityFast]];
    NSArray *lowPriorityFilters = [collection filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"priority = %lu", DYPFilterPrioritySlow]];
    [self _assetsWithFilterCollection:highPriorityFilters andResult:(NSArray *)[self.assetDataAccessObject all] callback:^(NSArray<id<DYPAssetProtocol>> *assets) {
        if (lowPriorityFilters.count) {
            [self _assetsWithFilterCollection:lowPriorityFilters andResult:assets callback:^(NSArray<id<DYPAssetProtocol>> *assets) {
                callback(assets);
            } progress:^(CGFloat progress) {
                progress_callback(progress);
            }];
        } else {
            callback(assets);
        }
    } progress:^(CGFloat progress) {
        if (!lowPriorityFilters.count) {
            progress_callback(progress);
        }
    }];
}
-(void)_assetsWithFilterCollection:(NSArray *)collection andResult:(NSArray *)result callback:(void(^)(NSArray <id<DYPAssetProtocol>> * assets))callback progress:(void(^)(CGFloat progress))progress_callback {
    if ([collection count] == 0) callback(result);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSMutableArray *assets = [[NSMutableArray alloc] init];
        NSInteger result_count = [result count];
        [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @autoreleasepool {
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
            }
        }];
        
    });
}

@end
