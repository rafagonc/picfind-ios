//
//  DYPAssetCell.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAssetCell.h"
#import "UIImage+Color.h"

@interface DYPAssetCell ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation DYPAssetCell

-(void)setAsset:(id<DYPAssetProtocol>)asset {
    _asset = asset;
    [self.activityIndicator startAnimating];
        [asset fetchImage:^(UIImage *image, NSDictionary *data) {
            self.photoImageView.image = image;
            [self.activityIndicator stopAnimating];
        }];
}

@end
