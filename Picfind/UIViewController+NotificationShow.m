//
//  UIViewController+NotificationShow.m
//  Share
//
//  Created by Rafael Gonzalves on 9/4/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "UIViewController+NotificationShow.h"

@implementation UIViewController (NotificationShow)

-(void)showNotificationWithType:(SHNotificationViewType)type withMessage:(NSString *)message {
    SHNotificationView *view = [[SHNotificationView alloc] initWithMessage:message andType:SHNotificationViewTypeError];
    if (self.navigationController) {
        [view showFromNavigationController:self.navigationController];
    } else {
        [view showInView:self.view];
    }
}

@end
