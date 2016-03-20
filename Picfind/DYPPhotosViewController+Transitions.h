//
//  DYPPhotosViewController+Transitions.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPhotosViewController.h"
#import "DYPFilterCell.h"

@interface DYPPhotosViewController (Transitions)

-(void)periodFilterWasSelected:(DYPFilterCell *)cell;
-(void)locationFilterWasSelected:(DYPFilterCell *)cell;
-(void)faceFilterWasSelected:(DYPFilterCell *)cell;
-(void)albumFilterWasSelected:(DYPFilterCell *)cell;

@end
