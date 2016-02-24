//
//  UIViewController+NotificationShow.h
//  Share
//
//  Created by Rafael Gonzalves on 9/4/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHNotificationView.h"

@interface UIViewController (NotificationShow)

-(void)showNotificationWithType:(SHNotificationViewType)type withMessage:(NSString *)message ;

@end
