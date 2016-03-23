//
//  DYPShare.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DYPShare <NSObject>

-(void)share:(UIImage *)image from:(UIViewController *)vc;

@end
