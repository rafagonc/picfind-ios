//
//  DYPAlbumFilterViewController.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilterCreatorDelegate.h"

@interface DYPAlbumFilterViewController : UIViewController

@property (nonatomic,weak) id<DYPFilterCreatorDelegate> delegate;

@end
