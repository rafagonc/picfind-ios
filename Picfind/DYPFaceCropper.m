//
//  DYPFaceCropper.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/29/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceCropper.h"
#import "UIImage+Crop.h"

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
    UIImage *image = [self.image crop:self.faceRect];
    return image;
}

@end
