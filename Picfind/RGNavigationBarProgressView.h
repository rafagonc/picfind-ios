//
//  RGNavigationBarProgressView.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGNavigationBarProgressView : UIView

@property (nonatomic,assign) CGFloat percentage;

-(void)stop;

@end
