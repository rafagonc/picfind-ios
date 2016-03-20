//
//  PHCollection+DYPCollectionAdapter.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "PHAssetCollection+DYPCollectionAdapter.h"
#import "DYPAssetProtocol.h"

@implementation PHAssetCollection (DYPCollectionAdapter)

-(NSString *)name {
    return self.localizedTitle;
}
-(NSUInteger)count {
    return [self estimatedAssetCount];
}
-(void)thumbnail:(void (^)(UIImage *image))callback {
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    [options setFetchLimit:1];
    [options setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]]];
    id<DYPAssetProtocol> asset = (id<DYPAssetProtocol>)[[PHAsset fetchAssetsInAssetCollection:self options:options] firstObject];
    if (asset) {
        [asset fetchHighQualityImage:^(UIImage *image, NSDictionary *data) {
            callback(image);
        }];
    }
}
-(BOOL)contains:(id<DYPAssetProtocol>)asset {
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsContainingAsset:(PHAsset *)asset withType:PHAssetCollectionTypeAlbum options:nil];
    for (PHAssetCollection *collection in result) {
        if ([collection isEqual:self]) {
            return YES;
        }
    }
    return NO;
}

@end
