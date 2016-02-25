//
//  DYPMapSearchCell.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPLocationFilter.h"

@class DYPMapSearchCell;
@protocol DYPMapSearchCellDelegate <NSObject>

-(void)mapSearchCell:(DYPMapSearchCell *)mapSearchCell didSearchForLocation:(CLLocation *)location;

@end

@interface DYPMapSearchCell : UITableViewCell

@property (nonatomic,weak) id<DYPLocationFilter> locationFilter;
@property (nonatomic,weak) id<DYPMapSearchCellDelegate> delegate;

@end
