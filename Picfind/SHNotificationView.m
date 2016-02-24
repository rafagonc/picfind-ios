//
//  SHNotificationView.m
//  Share
//
//  Created by Rafael Gonzalves on 9/4/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "SHNotificationView.h"
#import "UIColor+DYP.h"

static CGFloat const SHNotificationView_NavigationBarAndStatusBarHeight = 64;
static CGFloat const SHNotificationView_DefaultHeight = 50;
static NSTimeInterval const SHNotificationView_DefaultDuration = 2;
static NSTimeInterval const SHNotificationView_DefaultAnimationDuration = 0.2;



@interface SHNotificationView ()

#pragma mark - showing
@property (nonatomic,weak) UIView *showingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeadingConstraint;

#pragma mark - properties
@property (nonatomic,assign) SHNotificationViewType type;
@property (nonatomic,strong) NSString *message;
@property (nonatomic,strong) UIImage *image;

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SHNotificationView

#pragma mark - constructor
-(instancetype)init {
    return [self initWithMessage:@"Default Message" andType:SHNotificationViewTypeError];
}
-(instancetype)initWithFrame:(CGRect)frame {
    return [self init];
}
-(instancetype)initWithMessage:(NSString *)message andType:(SHNotificationViewType)type {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil] firstObject];
    if (self) {
        self.frame = CGRectMake(0, -SHNotificationView_DefaultHeight, [UIScreen mainScreen].bounds.size.width, SHNotificationView_DefaultHeight);
        self.message = message;
        self.type = type;
    } return self;
}

#pragma mark - getters and setters
-(void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}
-(void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}
-(void)setType:(SHNotificationViewType)type {
    _type = type;
    self.backgroundColor = self.type == SHNotificationViewTypeError ? [UIColor dyp_redColor] : [UIColor greenColor];
}

#pragma mark - layout
-(void)layoutSubviews {
    [super layoutSubviews];
    self.labelLeadingConstraint.constant = self.image ? 61 : 8;
}

#pragma mark - show
-(void)showInView:(UIView *)view {
    [self showInView:view duration:SHNotificationView_DefaultDuration];
}
-(void)showFromNavigationController:(UINavigationController *)navigationController duration:(NSTimeInterval)duration {
    self.topMargin = navigationController.navigationBar.translucent && ((NSInteger)self.topMargin) == 0 ? SHNotificationView_NavigationBarAndStatusBarHeight : 0;
    [self showInView:navigationController.topViewController.view duration:duration];
    
}
-(void)showFromNavigationController:(UINavigationController *)navigationController {
    [self showFromNavigationController:navigationController duration:2];
}

#pragma mark - animating
-(void)showInView:(UIView *)view duration:(NSTimeInterval)duration {
    self.showingView = view;
    [self.showingView addSubview:self];
    [UIView animateWithDuration:SHNotificationView_DefaultAnimationDuration animations:^{
        self.frame = CGRectMake(0, 0 + self.topMargin, [UIScreen mainScreen].bounds.size.width, SHNotificationView_DefaultHeight);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(hide) withObject:self afterDelay:duration];
    }];
    
}
-(void)hide {
    [UIView animateWithDuration:SHNotificationView_DefaultAnimationDuration animations:^{
        self.frame = CGRectMake(0, -SHNotificationView_DefaultHeight, [UIScreen mainScreen].bounds.size.width, SHNotificationView_DefaultHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
