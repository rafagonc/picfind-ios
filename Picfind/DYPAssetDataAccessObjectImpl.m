//
//  DYPAssetDataAccessObjectImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAssetDataAccessObjectImpl.h"
@import Photos;

@implementation DYPAssetDataAccessObjectImpl

-(id<NSCollection>)recents {
    PHFetchOptions * options = [[PHFetchOptions alloc] init];
    [options setFetchLimit:8];
    [options setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]]];
    id<NSCollection> result = (id<NSCollection>)[PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    return result;
}
-(id<NSCollection>)all {
    PHFetchResult *result = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
    return (id<NSCollection>)result;
}

-(void)createAlbumWithAssets:(id<NSCollection>)assets andName:(NSString *)name callback:(void(^)(BOOL success,NSError * error))callback {
    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) {
        [photoLibrary performChanges:^{
            PHAssetCollectionChangeRequest *changeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:name];
            [changeRequest addAssets:assets];
        } completionHandler:^(BOOL success, NSError * _Nullable photoError) {
            if (photoError) callback(NO, photoError);
            else callback(YES, nil);
        }];
    } else {
        callback(NO, [NSError errorWithDomain:DYPErrorDomain code:101 userInfo:@{NSLocalizedDescriptionKey : @"Photo library isnt available"}]);
    }
}


@end
