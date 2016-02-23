//
//  DYPImageMatConverter.h
//  FaceDetectorPOC
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <opencv2/opencv.hpp>

@interface DYPImageMatConverter : NSObject

#pragma mark - constructor
-(instancetype)init __attribute__((unavailable("init not available, use initWithImage")));
-(instancetype)initWithImage:(UIImage *)image;

#pragma mark - output
-(cv::Mat)mat;
-(cv::Mat)grayMat;

#pragma mark - static factory
+(cv::Mat)matFromImage:(UIImage *)image;
+(cv::Mat)grayMatFromImage:(UIImage *)image;
+(std::vector<cv::Mat>)matVectorFromImageArray:(NSArray <UIImage *> *)images;

@end
