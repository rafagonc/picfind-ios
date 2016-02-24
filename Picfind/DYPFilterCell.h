//
//  DYPFilterCell.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYPFilterCell : UITableViewCell

#pragma mark - constructor
-(instancetype)initWithFilterText:(NSString *)text;

#pragma mark - action
-(void)addTarget:(id)target selector:(SEL)selector;

@end
