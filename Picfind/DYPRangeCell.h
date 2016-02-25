//
//  DYPRangeCell.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPLocationFilter.h"

@class DYPRangeCell;
@protocol DYPRangeCellDelegate <NSObject>

-(void)rangeCell:(DYPRangeCell *)rangeCell didChangeRangeSlider:(NSInteger)range;

@end

@interface DYPRangeCell : UITableViewCell

@property (nonatomic,weak) id<DYPLocationFilter> locationFilter;
@property (nonatomic,weak) id<DYPRangeCellDelegate> delegate;

@end
