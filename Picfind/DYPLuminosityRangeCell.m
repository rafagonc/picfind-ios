//
//  DYPLuminosityRangeCell.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLuminosityRangeCell.h"
#import "MARKRangeSlider.h"
#import "UIColor+DYP.h"

@interface DYPLuminosityRangeCell ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftValueLabel;
@property (weak, nonatomic) IBOutlet MARKRangeSlider *rangeSlider;

@end

@implementation DYPLuminosityRangeCell

#pragma mark - constructor
-(instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self.rightImageView setImage:[[UIImage imageNamed:@"sun"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.leftImageView setImage:[[UIImage imageNamed:@"night"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.rightImageView setTintColor:[UIColor blackColor]];
        [self.leftImageView setTintColor:[UIColor blackColor]];
        
        [self.rangeSlider setRangeImage:[UIImage imageNamed:@"track"]];
        [self.rangeSlider setMinValue:0.0 maxValue:1.0];
        [self.rangeSlider addTarget:self action:@selector(rangeSliderChanged:) forControlEvents:UIControlEventValueChanged];
        [self.rangeSlider setLeftValue:0.2 rightValue:0.6];
        [self.rangeSlider setTintColor:[UIColor dyp_redColor]];
        
    } return self;
}

#pragma mark - action
-(void)rangeSliderChanged:(MARKRangeSlider *)rangeSlider {
    self.rightValueLabel.text = [NSString stringWithFormat:@"%.2f",[rangeSlider rightValue]];
    self.leftValueLabel.text = [NSString stringWithFormat:@"%.2f",[rangeSlider leftValue]];
    [self.delegate cell:self changedInitialValueTo:[rangeSlider leftValue] andFinalValueTo:[rangeSlider rightValue]];
}

@end
