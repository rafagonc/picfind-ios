//
//  DYPMapSearchCell.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPMapSearchCell.h"
#import "UITextField+DoneButton.h"

@interface DYPMapSearchCell () <UITextFieldDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


@end

@implementation DYPMapSearchCell

#pragma mark - constructor
-(instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        [self.searchTextField addToolbar];
        [self.searchTextField setDelegate:self];
    } return self;
}

#pragma mark - text field delegate
-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self.activityIndicator startAnimating];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:self.searchTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        [self.activityIndicator stopAnimating];
        CLPlacemark *placemark = [placemarks firstObject];
        if (placemark) {
            [self.delegate mapSearchCell:self didSearchForLocation:placemark.location];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Could't find this place" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
        }
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
