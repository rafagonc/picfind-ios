//
//  DYPFaceRecognizer.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceRecognizer.h"
#import <opencv2/core/core.hpp>
//#import <opencv2/contrib/contrib.hpp>
#import <opencv2/highgui/highgui.hpp>
#import "DYPImageMatConverter.h"
#import "DYPNumberArrayVectorConverter.h"

using namespace cv;
using namespace std;

@interface DYPFaceRecognizer() {
    Ptr<FaceRecognizer> fr;
}

@end

@implementation DYPFaceRecognizer

#pragma mark - constructor
-(instancetype)init {
    if (self = [super init]) {
        fr = createEigenFaceRecognizer();
    } return self;
}

#pragma mark - training
-(void)train:(NSArray<UIImage *> *)images andLabels:(NSArray<NSNumber *> *)labels {
    vector<Mat> images_converted = [DYPImageMatConverter matVectorFromImageArray:images];
    vector<int> labels_converted = [DYPNumberArrayVectorConverter int_vectorFromNumberArray:labels];
    fr->train(images_converted, labels_converted);
}

#pragma mark - predict
-(int)predict:(UIImage *)image {
    Mat mat = [DYPImageMatConverter grayMatFromImage:image];
    int label;
    double confidence;
    fr->predict(mat, label, confidence);
    return label;
}


@end
