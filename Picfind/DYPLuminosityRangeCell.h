//
//  DYPLuminosityRangeCell.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYPLuminosityRangeCell;
@protocol DYPLuminosityRangeCellDelegate <NSObject>

-(void)cell:(DYPLuminosityRangeCell *)cell changedInitialValueTo:(CGFloat)initialValue andFinalValueTo:(CGFloat)finalValue;

@end

@interface DYPLuminosityRangeCell : UITableViewCell

@property (nonatomic,weak) id<DYPLuminosityRangeCellDelegate> delegate;
-(void)setInitialRange:(CGFloat)initalRange andFinalRange:(CGFloat)finalRange;

@end
