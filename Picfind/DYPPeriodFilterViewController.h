//
//  DYPPeriodFilterViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"

@interface DYPPeriodFilterViewController : UIViewController

@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
