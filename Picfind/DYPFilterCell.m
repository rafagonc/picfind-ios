//
//  DYPFilterCell.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilterCell.h"

@interface DYPFilterCell ()

#pragma mark - ui
@property (nonatomic,weak) IBOutlet UILabel *filterLabel;

#pragma mark - properties
@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL selector;

@end

@implementation DYPFilterCell

#pragma mark - constructor
-(instancetype)initWithFilterText:(NSString *)text {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        self.filterLabel.text = text;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } return self;
}

#pragma mark - select
-(void)selected {
    [self.target performSelector:self.selector withObject:self];
}

#pragma mark - action
-(void)addTarget:(id)target selector:(SEL)selector {
    self.target = target;
    self.selector = selector;
}

@end
