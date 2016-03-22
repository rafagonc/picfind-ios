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
@property (weak, nonatomic) IBOutlet UIButton *trashButton;

#pragma mark - properties
@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL selector;
@property (nonatomic,strong) NSString *filterText;

@end

@implementation DYPFilterCell

#pragma mark - constructor
-(instancetype)initWithFilterText:(NSString *)text {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        _filterText = text;
        self.filterLabel.text = text;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.trashButton setImage:[[UIImage imageNamed:@"trash"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [self.trashButton setTintColor:[UIColor lightGrayColor]];
        [self.trashButton setHidden:1];
    } return self;
}

#pragma mark - select
#pragma gcc diagnostic push
#pragma gcc diagnostic ignored "-Wundeclared-selector"
-(void)selected {
    [self.target performSelector:self.selector withObject:self];
}
#pragma gcc diagnostic pop

#pragma mark - setters
-(void)setFilter:(id<DYPFilter>)filter {
    _filter = filter;
    [self.filterLabel setText:filter ? [filter explain] : self.filterText];
    self.accessoryType = filter ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryDisclosureIndicator;
    self.trashButton.hidden = (filter == nil);
}

#pragma mark - action
-(void)addTarget:(id)target selector:(SEL)selector {
    self.target = target;
    self.selector = selector;
}
-(IBAction)trashAction:(id)sender {
    [self.delegate filterCell:self didDeleteFilter:self.filter];
    [self setFilter:nil];
}

@end
