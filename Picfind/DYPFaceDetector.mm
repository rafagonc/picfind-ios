//
//  DYPFaceDetector.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceDetector.h"
#import <opencv2/opencv.hpp>
#import "DYPImageMatConverter.h"

using namespace cv;

@interface DYPFaceDetector () {
    CascadeClassifier detector;
}

@end

@implementation DYPFaceDetector

#pragma mark - constructors
-(instancetype)init {
    if (self = [super init]) {
        [self load];
    } return self;
}

#pragma mark - methods
-(NSArray <NSValue *> *)detectImage:(UIImage *)image {
    if (image == nil) @throw [NSException exceptionWithName:@"DYPException" reason:@"image cannot be nil" userInfo:@{}];
    Mat sourceVector = [DYPImageMatConverter matFromImage:image];
    std::vector<cv::Rect> faceRects;
    detector.detectMultiScale(sourceVector, faceRects);
    NSMutableArray <NSValue *> *rects = [@[] mutableCopy];
    for (int i = 0; i < faceRects.size(); i++) {
        cv::Rect rect = faceRects[i];
        CGRect faceRect = CGRectMake(rect.x, rect.y, rect.width, rect.height);
        NSValue *rectValue = [NSValue valueWithCGRect:faceRect];
        [rects addObject:rectValue];
    }
    return rects;
}
-(NSArray <NSValue *> *)detectMat:(cv::Mat)sourceVector {
    std::vector<cv::Rect> faceRects;
    if (sourceVector.empty()) return @[];
    detector.detectMultiScale(sourceVector, faceRects);
    NSMutableArray <NSValue *> *rects = [@[] mutableCopy];
    for (int i = 0; i < faceRects.size(); i++) {
        cv::Rect rect = faceRects[i];
        CGRect faceRect = CGRectMake(rect.x, rect.y, rect.width, rect.height);
        NSValue *rectValue = [NSValue valueWithCGRect:faceRect];
        [rects addObject:rectValue];
    }
    return rects;
}
-(void)load {
    NSString *faceCascadePath = [[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_alt2" ofType:@"xml"];
    const CFIndex CASCANDE_NAME_LEN = 2048;
    char * CASCADE_NAME = (char *)malloc(CASCANDE_NAME_LEN);
    CFStringGetFileSystemRepresentation((CFStringRef)faceCascadePath, CASCADE_NAME, CASCANDE_NAME_LEN);
    detector.load(CASCADE_NAME);
}

@end
