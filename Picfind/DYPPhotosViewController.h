//
//  DYPPhotosViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"
#import "DYPFilterCell.h"
#import "DYPFilterCollection.h"

@interface DYPPhotosViewController : UIViewController <DYPFilterCreatorDelegate, DYPFilterCellDelegate>

#pragma mark - properties
@property (strong, nonatomic) DYPFilterCollection * appliedFilters;

@end
