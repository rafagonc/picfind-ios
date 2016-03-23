//
//  PHAsset+DYPAssetProtocol.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "PHAsset+DYPAssetProtocol.h"

@import Photos;

@implementation PHAsset (DYPAssetProtocol)

-(void)fetchImage:(void (^)(UIImage *, NSDictionary *))callback {
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    [options setDeliveryMode:PHImageRequestOptionsDeliveryModeHighQualityFormat];
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(300, 300) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        callback(result, info);
    }];
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

@end
