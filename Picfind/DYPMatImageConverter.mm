//
//  DYPMatImageConverter.m
//  FaceDetectorPOC
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPMatImageConverter.h"
#import <opencv2/highgui/ios.h>

@interface DYPMatImageConverter () {
    cv::Mat _mat;
}

@end

@implementation DYPMatImageConverter

#pragma mark - constructor
-(instancetype)initWithMat:(cv::Mat)mat {
    if (self = [super init]) {
        _mat = mat;
    } return self;
}

#pragma mark - methods
-(UIImage *)image {
//    //_mat.convertTo(_mat, CV_8UC3, 255.0);
//    NSData *data = [NSData dataWithBytes:_mat.data length:_mat.elemSize()*_mat.total()];
//    CGColorSpaceRef colorSpace;
//    if (_mat.elemSize() == 1) {
//        colorSpace = CGColorSpaceCreateDeviceGray();
//    } else {
//        colorSpace = CGColorSpaceCreateDeviceRGB();
//    }
//    
//    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
//    
//    // Creating CGImage from cv::Mat
//    CGImageRef imageRef = CGImageCreate(_mat.cols,                                  //width
//                                        _mat.rows,                                  //height
//                                        8,                                          //bits per component
//                                        8 * _mat.elemSize(),                        //bits per pixel
//                                        _mat.step[0],                               //bytesPerRow
//                                        colorSpace,                                 //colorspace
//                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
//                                        provider,                                   //CGDataProviderRef
//                                        NULL,                                       //decode
//                                        false,                                      //should interpolate
//                                        kCGRenderingIntentDefault                   //intent
//                                        );
//    
//    
//    // Getting UIImage from CGImage
//    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
//    CGImageRelease(imageRef);
//    CGDataProviderRelease(provider);
//    CGColorSpaceRelease(colorSpace);
//    return finalImage;
    return MatToUIImage(_mat);
}

#pragma mark - factory method
+(UIImage *)imageFromMat:(cv::Mat)mat {
    return [[[DYPMatImageConverter alloc] initWithMat:mat] image];
}

@end
