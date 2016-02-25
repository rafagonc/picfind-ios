//
//  DYPRangeCell.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPRangeCell.h"

@interface DYPRangeCell ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;


@end

@implementation DYPRangeCell

#pragma makr - constructor
-(instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
    } return self;
}

#pragma mark - setters
-(void)setLocationFilter:(id<DYPLocationFilter>)locationFilter {
    _locationFilter = locationFilter;
    [self.slider setValue:(float)[locationFilter range] animated:YES];
}

#pragma mark - actions
-(IBAction)sliderChanged:(UISlider *)sender {
    MKDistanceFormatter *distanceFormatter = [[MKDistanceFormatter alloc] init];
    [distanceFormatter setUnits:MKDistanceFormatterUnitsMetric];
    NSString * distance = [distanceFormatter stringFromDistance:(CLLocationDistance)sender.value];
    [self.rangeLabel setText:distance];
    [self.delegate rangeCell:self didChangeRangeSlider:(NSInteger)sender.value];
}

@end
