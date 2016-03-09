//
//  DYPPhotoLibaryValidator.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/9/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPhotoLibaryValidator.h"
@import Photos;

@implementation DYPPhotoLibaryValidator

-(BOOL)validate:(id)obj error:(NSError *__autoreleasing *)error {
    if ([PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized) {
        if (error) *error = [NSError errorWithDomain:DYPErrorDomain code:101 userInfo:@{NSLocalizedDescriptionKey : @"Access to photos unauthorized!"}];
    }
    return YES;
}

@end
