//
//  DYPFaceDetector.h
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <opencv2/opencv.hpp>

@interface DYPFaceDetector : NSObject

#pragma mark - constructor
-(instancetype)init;

#pragma mark - methods
-(NSArray <NSValue *> *)detectMat:(cv::Mat)sourceVector;
-(NSArray <NSValue *> *)detectImage:(UIImage *)image;
-(NSArray <NSValue *> *)detectWithCIFeature:(UIImage *)image;

@end
