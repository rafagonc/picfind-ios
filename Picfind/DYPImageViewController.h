//
//  DYPImageViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/6/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPAssetProtocol.h"

@interface DYPImageViewController : UIViewController

#pragma mark - constructor
-(instancetype)initWithAsset:(id<DYPAssetProtocol>)asset;

@end
