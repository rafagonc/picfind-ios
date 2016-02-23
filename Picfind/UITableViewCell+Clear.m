//
//  UITableViewCell+Clear.m
//  ReadingList
//
//  Created by Rafael Gonzalves on 10/17/15.
//  Copyright © 2015 Rafael Gonzalves. All rights reserved.
//

#import "UITableViewCell+Clear.h"

@implementation UITableViewCell (Clear)

-(void)clearBackgroundSelection {
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1];
    [self setSelectedBackgroundView:view];
}

@end
