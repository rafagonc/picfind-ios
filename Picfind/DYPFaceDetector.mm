//
//  DYPFaceDetector.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceDetector.h"


@interface DYPFaceDetector () {
}

@end

@implementation DYPFaceDetector

#pragma mark - constructors
-(instancetype)init {
    if (self = [super init]) {
    } return self;
}


-(NSArray <NSValue *> *)detectWithCIFeature:(UIImage *)image {
    CIContext *context = [CIContext contextWithOptions:@{}];
    CIDetector *ciDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:@{}];
    NSArray *features = [ciDetector featuresInImage:image.CIImage];
    NSMutableArray <NSValue *> *rects = [@[] mutableCopy];
    for (CIFeature *feature in features) {
        [rects addObject:[NSValue valueWithCGRect:feature.bounds]];
    }
    return rects;
}
-(NSArray <NSValue *> *)detectWithCIFeatureFromCGImage:(UIImage *)image {
    CIContext *context = [CIContext contextWithOptions:@{}];
    CIDetector *ciDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:@{}];
    NSArray *features = [ciDetector featuresInImage:[[CIImage alloc] initWithCGImage:image.CGImage]];
    NSMutableArray <NSValue *> *rects = [@[] mutableCopy];
    for (CIFeature *feature in features) {
        [rects addObject:[NSValue valueWithCGRect:feature.bounds]];
    }
    return rects;
}



@end
