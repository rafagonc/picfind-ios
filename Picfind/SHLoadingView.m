//
//  SHLoadingView.m
//  Share
//
//  Created by Rafael Gonzalves on 8/30/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "SHLoadingView.h"
#import "LLARingSpinnerView.h"
#import "UIColor+DYP.h"

static NSTimeInterval const SHLoadingView_AnimationDuration = 0.4;

@interface SHLoadingView ()

@property (nonatomic,strong) LLARingSpinnerView *loading;

@end

@implementation SHLoadingView

#pragma mark - constructor
-(instancetype)init {
    if (self = [super init]) {
        self.alpha = 0;
        self.backgroundColor = [UIColor whiteColor];
    } return self;
}

#pragma mark - overrides
-(void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.alpha = 0;
    self.loading = [[LLARingSpinnerView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.loading.tintColor = [UIColor dyp_redColor];
    self.loading.lineWidth = 1.5f;
    [self addSubview:self.loading];
}

#pragma mark - layout subviews
-(void)layoutSubviews {
    self.frame = CGRectMake(0, 0, self.superview.frame.size.width, self.superview.frame.size.height);
    self.loading.frame = CGRectMake(self.frame.size.width/2 - self.loading.frame.size.width/2, self.frame.size.height/2 - self.loading.frame.size.height/2, self.loading.frame.size.width, self.loading.frame.size.height);
}

#pragma mark - animating
-(void)startAnimating {
    [self.loading startAnimating];
    [UIView animateWithDuration:SHLoadingView_AnimationDuration animations:^{
        self.alpha = 1;
    }];
}
-(void)stopAnimatingWithCompletion:(void(^)())callback {
    [UIView animateWithDuration:SHLoadingView_AnimationDuration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (callback) callback();
       [self removeFromSuperview];
    }];
}

#pragma mark - daelloc
-(void)dealloc {
    
}


@end
