//
//  UISearchBar+Toolbar.m
//  ReadingList
//
//  Created by Rafael Gonzalves on 10/17/15.
//  Copyright © 2015 Rafael Gonzalves. All rights reserved.
//

#import "UISearchBar+Toolbar.h"
#import "UIColor+DYP.h"

@implementation UISearchBar (Toolbar)

#pragma mark - methods
-(void)addToolbar {
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setTintColor:[UIColor dyp_redColor]];
    [toolbar sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    [toolbar setItems:@[doneButton]];
    self.inputAccessoryView = toolbar;
}

#pragma mark - actions
-(void)doneAction:(UIBarButtonItem *)button {
    [self resignFirstResponder];
}

@end
