//
//  SHLoadingView.h
//  Share
//
//  Created by Rafael Gonzalves on 8/30/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHLoadingView : UIView

#pragma mark - animating
-(void)startAnimating;
-(void)stopAnimatingWithCompletion:(void(^)())callback;

@end
