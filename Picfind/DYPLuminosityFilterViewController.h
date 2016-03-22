//
//  DYPLuminosityFilterViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"

@interface DYPLuminosityFilterViewController : UIViewController

#pragma mark - constructor
-(instancetype)initWithInitialValue:(CGFloat)initialValue andFinalValue:(CGFloat)finalValue;

#pragma mark - properties
@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
