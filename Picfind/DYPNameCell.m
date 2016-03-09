//
//  DYPNameCell.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/9/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPNameCell.h"

@interface DYPNameCell ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DYPNameCell

#pragma mark - constructor
-(instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        
    } return self;
}

#pragma mark - getters
-(NSString *)name {
    return self.textField.text;
}

#pragma mark - override
-(BOOL)becomeFirstResponder {
    [self.textField becomeFirstResponder];
    return [super becomeFirstResponder];
}

@end
