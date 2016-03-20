//
//  DYPCollectionDataAccessObjectImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

@import Photos;
#import "DYPCollectionDataAccessObjectImpl.h"

@implementation DYPCollectionDataAccessObjectImpl

#pragma mark - create
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

#pragma mark - all
-(id<NSCollection>)all {
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
    [fetchOptions setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"localizedTitle" ascending:YES]]];
    id<NSCollection> result = (id<NSCollection>)[PHCollectionList fetchTopLevelUserCollectionsWithOptions:fetchOptions];
    return result;
}

@end
