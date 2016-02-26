//
//  DYPDateCell.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYPDateCell : UITableViewCell

#pragma mark - constructor
-(instancetype)initWithPlaceholder:(NSString *)placeholder;

#pragma mark - properties
@property (nonatomic,strong) NSDate *date;


@end
