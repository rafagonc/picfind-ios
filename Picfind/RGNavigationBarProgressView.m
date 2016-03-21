//
//  RGNavigationBarProgressView.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "RGNavigationBarProgressView.h"
#import "UIColor+DYP.h"

@interface RGNavigationBarProgressView ()

#pragma mark - ui
@property (nonatomic,weak) UIView * progressBarView;

@end

@implementation RGNavigationBarProgressView

#pragma mark - constructor
-(instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    } return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    } return self;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    } return self;
}
-(void)commonInit {
}

#pragma mark - view
-(void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    UIView *progressBarView = [[UIView alloc] initWithFrame:CGRectZero];
    progressBarView.backgroundColor = [UIColor dyp_redColor];
    [self addSubview:progressBarView];
    [self setProgressBarView:progressBarView];
    
    self.percentage = 0.0f;
}

#pragma mark - layout subviews
-(void)layoutSubviews {
    [super layoutSubviews];
    [UIView animateWithDuration:0.05 animations:^{
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 2);
        self.progressBarView.frame = CGRectMake(0, 0, self.frame.size.width * self.percentage, self.frame.size.height);
    }];
}

#pragma mark - setters
-(void)setPercentage:(CGFloat)percentage {
    _percentage = percentage;
    [self setNeedsLayout];
}

#pragma mark - stop
-(void)stop {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - dealloc
-(void)dealloc {
    
}


@end
