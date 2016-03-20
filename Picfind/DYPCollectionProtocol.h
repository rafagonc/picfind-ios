//
//  DYPCollectionProtocol.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DYPAssetProtocol.h"

@protocol DYPCollectionProtocol <NSObject>

-(NSString *)name;
-(NSUInteger)count;
-(void)thumbnail:(void (^)(UIImage *image))callback;
-(BOOL)contains:(id<DYPAssetProtocol>)asset;

@end
