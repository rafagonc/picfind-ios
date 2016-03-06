//
//  DYPFaceCropper.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/29/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceCropper.h"
#import "UIImage+Crop.h"

static CGFloat const kAmplifiedRectMultiplierFactor = 0.3;

@interface DYPFaceCropper ()

#pragma mark - properties
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,assign) CGRect faceRect;

@end

@implementation DYPFaceCropper

#pragma mark - constructor
-(instancetype)initWithImage:(UIImage *)image andFaceRect:(CGRect)face {
    if (self = [super init]) {
        self.image = image;
        self.faceRect = face;
    } return self;
}

#pragma mark - crop
-(UIImage *)face {
    CGFloat amplifiedWidth = self.faceRect.size.width * kAmplifiedRectMultiplierFactor;
    CGFloat amplifiedHeight = self.faceRect.size.height * kAmplifiedRectMultiplierFactor;
    CGRect amplified = CGRectMake(self.faceRect.origin.x - amplifiedWidth/2, self.faceRect.origin.y - amplifiedHeight/2, self.faceRect.size.width + amplifiedWidth, self.faceRect.size.height + amplifiedHeight);
    UIImage *image = [self.image crop:amplified];
    image = [image resize:kCGRectFaceSize];
    return image;
}

@end
