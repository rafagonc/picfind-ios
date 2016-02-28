//
//  UIViewController+Loading.m
//  Share
//
//  Created by Rafael Gonzalves on 9/13/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "UIViewController+Loading.h"
#import <objc/runtime.h>

@implementation UIViewController (Loading)

@dynamic loadingView;

#pragma mark - full loading
-(void)startFullLoading {
    self.loadingView = [[SHLoadingView alloc] init];
    [self.view addSubview:self.loadingView];
    [self.loadingView startAnimating];
}
-(void)stopFullLoading {
    [self.loadingView stopAnimatingWithCompletion:nil];
    [self.view bringSubviewToFront:self.loadingView];
}

#pragma mark - getters and setters
-(void)setLoadingView:(SHLoadingView *)loadingView {
    objc_setAssociatedObject(self, @selector(loadingView), loadingView , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(SHLoadingView *)loadingView {
    return objc_getAssociatedObject(self, @selector(loadingView));
}

@end
