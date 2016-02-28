//
//  UIViewController+Loading.h
//  Share
//
//  Created by Rafael Gonzalves on 9/13/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHLoadingView.h"

@interface UIViewController (Loading)

#pragma mark - ui
@property (nonatomic,strong) SHLoadingView *loadingView;

#pragma mark - full loading
-(void)startFullLoading;
-(void)stopFullLoading;

@end
