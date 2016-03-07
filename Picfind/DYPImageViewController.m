//
//  DYPImageViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/6/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPImageViewController.h"
#import "DYPAssetProtocol.h"
#import "UIViewController+Loading.h"

@interface DYPImageViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

#pragma mark - properties
@property (nonatomic,strong) id<DYPAssetProtocol> asset;

@end

@implementation DYPImageViewController

#pragma mark - constructor
-(instancetype)initWithAsset:(id<DYPAssetProtocol>)asset {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        self.asset = asset;
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Photo"];
    [self startBlackFullLoading];
    [self.asset fetchHighQualityImage:^(UIImage *image, NSDictionary *data) {
        self.imageView.image = image;
        [self stopFullLoading];
    }];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
