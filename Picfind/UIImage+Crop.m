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
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}
-(UIImage *)resize:(CGSize)newSize {
    CGFloat scale = [[UIScreen mainScreen]scale];
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end