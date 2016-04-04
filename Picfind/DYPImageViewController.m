//
//  DYPImageViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/6/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPImageViewController.h"
#import "DYPAssetProtocol.h"
#import "DYPShareFactory.h"
#import "UIViewController+Loading.h"

@interface DYPImageViewController () <UIActionSheetDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

#pragma mark - properties
@property (nonatomic,strong) id<DYPAssetProtocol> asset;
@property (strong, nonatomic) id<DYPShare> share;

#pragma mark - injected
@property (setter=injected:)id<DYPShareFactory> shareFactory;

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
    [self.scrollView setMaximumZoomScale:10.f];
    [self setTitle:@"Photo"];
    [self startBlackFullLoading];
    [self.asset fetchHighQualityImage:^(UIImage *image, NSDictionary *data) {
        self.imageView.image = image;
        [self stopFullLoading];
    }];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareAction:)];
    [self.navigationItem setRightBarButtonItem:shareButton];
}

#pragma mark - actions
-(void)shareAction:(UIBarButtonItem *)item {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twiiter", @"Mail", nil];
    [actionSheet showInView:self.view];
}

#pragma mark - delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 2) {
        self.share = [self.shareFactory shareForType:DYPShareTypeMail];
        [self.share share:self.imageView.image from:self];
    } else if (buttonIndex == 1) {
        self.share = [self.shareFactory shareForType:DYPShareTypeTwitter];
        [self.share share:self.imageView.image from:self];
    } else if (buttonIndex == 0) {
        self.share = [self.shareFactory shareForType:DYPShareTypeFacebook];
        [self.share share:self.imageView.image from:self];
    }
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
