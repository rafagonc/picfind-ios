//
//  DYPFilterCell.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPFilter.h"

@class DYPFilterCell;
@protocol DYPFilterCellDelegate <NSObject>

-(void)filterCell:(DYPFilterCell *)cell didDeleteFilter:(id<DYPFilter>)filter;

@end

@interface DYPFilterCell : UITableViewCell

#pragma mark - constructor
-(instancetype)initWithFilterText:(NSString *)text;

#pragma mark - properties
@property (nonatomic,weak) id<DYPFilter> filter;
@property (nonatomic,weak) id<DYPFilterCellDelegate> delegate;
@property (nonatomic,strong) NSString * vel;

#pragma mark - action
-(void)addTarget:(id)target selector:(SEL)selector;

@end
