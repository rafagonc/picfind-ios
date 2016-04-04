//
//  PHAsset+DYPAssetProtocol.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "PHAsset+DYPAssetProtocol.h"
#import <objc/runtime.h>

@import Photos;

@interface PHAsset ()

@property (nonatomic) UIImage *normalImageAsset;

@end

@implementation PHAsset (DYPAssetProtocol)

-(void)fetchImage:(void (^)(UIImage *, NSDictionary *))callback {
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    [options setDeliveryMode:PHImageRequestOptionsDeliveryModeHighQualityFormat];
    if (self.normalImageAsset == nil) {
        [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(300, 300) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            callback(result, info);
        }];
    } else {
        callback(self.normalImageAsset, nil);
    }
}
-(void)fetchHighQualityImage:(void (^)(UIImage *, NSDictionary *))callback {
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    [options setDeliveryMode:PHImageRequestOptionsDeliveryModeHighQualityFormat];
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(self.pixelWidth, self.pixelHeight) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        callback(result, info);
    }];
}
-(void)fetchLivePhoto:(void(^)(PHLivePhoto *p))callback {
    [[PHImageManager defaultManager] requestLivePhotoForAsset:self targetSize:CGSizeMake(self.pixelWidth, self.pixelHeight) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(PHLivePhoto * _Nullable livePhoto, NSDictionary * _Nullable info) {
        callback(livePhoto);
    }];
}

#pragma mark - search index
-(void)setSearchIndex:(NSUInteger)searchIndex {
    objc_setAssociatedObject(self, @selector(searchIndex), @(searchIndex), OBJC_ASSOCIATION_RETAIN);
}
-(NSUInteger)searchIndex {
    return [objc_getAssociatedObject(self, @selector(searchIndex)) unsignedIntegerValue];
}
-(void)setNormalImageAsset:(UIImage *)normalImageAsset {
    objc_setAssociatedObject(self, @selector(normalImageAsset), normalImageAsset, OBJC_ASSOCIATION_RETAIN);
}
-(UIImage *)normalImageAsset {
    return objc_getAssociatedObject(self, @selector(normalImageAsset));
}

@end
