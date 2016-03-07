//
//  DYPFaceRecognizerFilterImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/28/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceRecognizerFilterImpl.h"
#import "DYPFaceRecognizer.h"
#import "DYPFaceDetector.h"
#import "DYPFaceCropper.h"

@interface DYPFaceRecognizerFilterImpl ()

@property (nonatomic,strong) DYPFaceRecognizer *faceRecognizer;

@end

@implementation DYPFaceRecognizerFilterImpl

#pragma mark - setters
-(void)setPredictable:(NSArray *)images andRects:(NSArray *)rects {
    _faceRecognizer = [[DYPFaceRecognizer alloc] init];
    NSMutableArray *labels = [@[] mutableCopy];
    for (int i = 0; i < images.count; i++) [labels addObject:@2];
    [_faceRecognizer train:images andRects:rects andLabels:labels];
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
        [asset fetchImage:^(UIImage *image, NSDictionary *data) {
            DYPFaceDetector *faceDetector = [[DYPFaceDetector alloc] init];
            NSArray * faces = [faceDetector detectWithCIFeatureFromCGImage:image];
            for (NSValue *rect in faces) {
                CGRect rectValue = [rect CGRectValue];
                UIImage *faceImage = [[[DYPFaceCropper alloc] initWithImage:image andFaceRect:rectValue] face];
                if ([_faceRecognizer predict:faceImage] == 2) {
                    isElegible();
                    break;
                }
            }
        }];
}

-(NSString *)explain {
    return @"👦🏽";
}

@end
