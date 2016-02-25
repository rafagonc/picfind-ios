//
//  DYPMapCell.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPLocationFilter.h"

@interface DYPMapCell : UITableViewCell

@property (nonatomic,weak) id<DYPLocationFilter> locationFilter;
@property (nonatomic,assign) NSInteger range;
@property (nonatomic,strong) CLLocation *searchedLocation;

#pragma mark - result
-(CLLocation *)finalLocation;

@end
