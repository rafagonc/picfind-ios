//
//  DYPDateCell.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPDateCell.h"
#import "UITextField+DoneButton.h"

@interface DYPDateCell ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;

#pragma mark - properties
@property (nonatomic, strong) NSDate *_date;

@end

@implementation DYPDateCell

#pragma mark - constructor
-(instancetype)initWithPlaceholder:(NSString *)placeholder {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        [self.dateTextField addToolbar];
        self.dateTextField.placeholder = placeholder;
        self.dateTextField.inputView = self.datePicker;
        [self.datePicker addTarget:self action:@selector(datePicked:) forControlEvents:UIControlEventValueChanged];
    } return self;
}

#pragma mark - actions
-(void)datePicked:(UIDatePicker *)picker {
    self.date = picker.date;
}

#pragma mark - overrides
-(BOOL)becomeFirstResponder {
    [self.dateTextField becomeFirstResponder];
    return [super becomeFirstResponder];
}

#pragma mark - getters
-(NSDate *)date {
    return self._date;
}
-(void)setDate:(NSDate *)date {
    __date = date;
    if (date) {
        self.datePicker.date = date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [self.dateTextField setText:[formatter stringFromDate:date]];
    }
}

@end
