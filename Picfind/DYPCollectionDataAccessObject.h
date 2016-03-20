//
//  DYPCollectionDataAccessObject.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DYPCollectionDataAccessObject <NSObject>

#pragma mark - fetch
-(id<NSCollection>)all;

#pragma mark - create
-(void)createAlbumWithAssets:(id<NSCollection>)assets andName:(NSString *)name callback:(void(^)(BOOL success,NSError * error))callback;


@end
