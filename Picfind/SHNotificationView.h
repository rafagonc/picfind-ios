//
//  SHNotificationView.h
//  Share
//
//  Created by Rafael Gonzalves on 9/4/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SHNotificationViewType) {
    SHNotificationViewTypeSuccess,
    SHNotificationViewTypeError
};

@interface SHNotificationView : UIView

#pragma mark - constructor
-(instancetype)initWithMessage:(NSString *)message andType:(SHNotificationViewType)type;

#pragma mark - show
-(void)showInView:(UIView *)view;
-(void)showInView:(UIView *)view duration:(NSTimeInterval)duration;
-(void)showFromNavigationController:(UINavigationController *)navigationController;
-(void)showFromNavigationController:(UINavigationController *)navigationController duration:(NSTimeInterval)duration;

#pragma mark - geometric properties
@property (nonatomic,assign) CGFloat topMargin;

@end
