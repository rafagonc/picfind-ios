//
//  DYPAlbumFilterViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"
#import "DYPAlbumFilter.h"

@interface DYPAlbumFilterViewController : UIViewController

#pragma mark - constructor
-(instancetype)initWithAlbumFilter:(id<DYPAlbumFilter>)albumFilter;

#pragma mark - properties
@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
