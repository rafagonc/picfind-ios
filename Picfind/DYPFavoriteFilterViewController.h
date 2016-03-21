//
//  DYPFavoriteFilterViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"
#import "DYPFavoriteFilter.h"

@interface DYPFavoriteFilterViewController : UIViewController

#pragma mark - constructor
-(instancetype)initWithFavorite:(id<DYPFavoriteFilter>)favoriteFilter;

#pragma mark - properties
@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
