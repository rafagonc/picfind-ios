//
//  DYPAssetDataAccessObject.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPAssetProtocol.h"
#import "NSCollection.h"

@protocol DYPAssetDataAccessObject <NSObject>

#pragma mark - read
-(id<NSCollection>)recents;
-(id<NSCollection>)all;

#pragma mark - create
-(void)createAlbumWithAssets:(id<NSCollection>)assets andName:(NSString *)name callback:(void(^)(BOOL success,NSError * error))callback;

@end
