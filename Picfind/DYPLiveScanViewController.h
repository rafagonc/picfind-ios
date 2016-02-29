//
//  DYPLiveScanViewController.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/26/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"

@interface DYPLiveScanViewController : UIViewController

#pragma mark - properties
@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
