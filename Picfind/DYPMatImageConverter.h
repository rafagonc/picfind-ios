//
//  DYPMatImageConverter.h
//  FaceDetectorPOC
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>
#import <UIKit/UIKit.h>

@interface DYPMatImageConverter : NSObject

-(instancetype)init __attribute__((unavailable("init not available, use initWithMat")));
-(instancetype)initWithMat:(cv::Mat)mat;

#pragma mark - methods
-(UIImage *)image;

#pragma mark - factory method
+(UIImage *)imageFromMat:(cv::Mat)mat;

@end
