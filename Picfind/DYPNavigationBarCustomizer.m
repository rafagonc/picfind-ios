//
//  DYPNavigationBarCustomizer.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPNavigationBarCustomizer.h"
#import "UIColor+DYP.h"
#import "UIFont+DYP.h"

@implementation DYPNavigationBarCustomizer

-(void)customize:(UIView *)view {
    UINavigationBar *bar = (UINavigationBar *)view;
    bar.tintColor = [UIColor dyp_redColor];
    
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont avenirNextBoldWithSize:19.0f]}];
}

@end
