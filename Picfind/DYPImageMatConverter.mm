//
//  DYPImageMatConverter.m
//  FaceDetectorPOC
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPImageMatConverter.h"

@interface DYPImageMatConverter()

@property (nonatomic,strong) UIImage *image;

@end

@implementation DYPImageMatConverter

#pragma mark - constructor
-(instancetype)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        _image = image;
    } return self;
}

#pragma makr - methods
-(cv::Mat)mat {
    if (!self.image) @throw [NSException exceptionWithName:@"DYPException" reason:@"Image cannot be nil" userInfo:@{}];
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(self.image.CGImage);
    CGFloat cols = self.image.size.width;
    CGFloat rows = self.image.size.height;
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), self.image.CGImage);
    CGContextRelease(contextRef);
    
    return cvMat;
}
-(cv::Mat)grayMat {
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(self.image.CGImage);
    CGFloat cols = self.image.size.width;
    CGFloat rows = self.image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC1); // 8 bits per component, 1 channels
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), self.image.CGImage);
    CGContextRelease(contextRef);
    
    return cvMat;
}

#pragma mark - static factory
+(cv::Mat)matFromImage:(UIImage *)image {
    return [[[DYPImageMatConverter alloc] initWithImage:image] mat];
}
+(cv::Mat)grayMatFromImage:(UIImage *)image {
    return [[[DYPImageMatConverter alloc] initWithImage:image] grayMat];
}
+(std::vector<cv::Mat>)matVectorFromImageArray:(NSArray <UIImage *> *)images {
    std::vector<cv::Mat> matVector;
    for (UIImage *image in images) {
        matVector.push_back([DYPImageMatConverter matFromImage:image]);
    }
    return matVector;
}


@end
