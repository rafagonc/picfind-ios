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
    [options setDeliveryMode:PHImageRequestOptionsDeliveryModeFastFormat];
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(self.pixelWidth, self.pixelHeight) contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        callback(result, info);
    }];
}

@end
