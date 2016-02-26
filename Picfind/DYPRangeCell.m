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
        [self didSetRange:300];
    } return self;
}

#pragma mark - setters
-(void)setLocationFilter:(id<DYPLocationFilter>)locationFilter {
    _locationFilter = locationFilter;
    if (locationFilter) {
        [self.slider setValue:(float)[locationFilter range] animated:YES];
        [self didSetRange:(NSInteger)[locationFilter range]];
    } else {
        [self didSetRange:300];
    }
}

#pragma mark - actions
-(IBAction)sliderChanged:(UISlider *)sender {
    [self didSetRange:(NSInteger)sender.value];
    [self.delegate rangeCell:self didChangeRangeSlider:(NSInteger)sender.value];
}

#pragma mark - methods
-(void)didSetRange:(NSInteger)range {
    MKDistanceFormatter *distanceFormatter = [[MKDistanceFormatter alloc] init];
    [distanceFormatter setUnits:MKDistanceFormatterUnitsMetric];
    NSString * distance = [distanceFormatter stringFromDistance:(CLLocationDistance)range];
    [self.rangeLabel setText:distance];
}

@end
