//
//  DYPLocationFilterViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"
#import "DYPLocationFilter.h"

@interface DYPLocationFilterViewController : UIViewController

#pragma mark - constructor
-(instancetype)initWithLocationFilter:(id<DYPLocationFilter>)locationFilter;

#pragma mark - propreties
@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
