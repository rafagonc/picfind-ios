//
//  UIImage+Crop.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/1/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

#pragma mark - image
-(UIImage *)crop:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *result = [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}


@end