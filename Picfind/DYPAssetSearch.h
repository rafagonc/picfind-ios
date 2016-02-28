//
//  DYPAssetSearch.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/28/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilterCollection.h"

@protocol DYPAssetSearch <NSObject>

#pragma mark - methods
-(void)assetsWithFilterCollection:(DYPFilterCollection *)collection callback:(void(^)(NSArray <id<DYPAssetProtocol>> * assets))callback;

@end
