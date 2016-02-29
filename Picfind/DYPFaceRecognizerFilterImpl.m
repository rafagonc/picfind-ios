//
//  DYPFaceRecognizerFilterImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/28/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceRecognizerFilterImpl.h"
#import "DYPFaceRecognizer.h"

@interface DYPFaceRecognizerFilterImpl ()

@property (nonatomic,strong) DYPFaceRecognizer *faceRecognizer;

@end

@implementation DYPFaceRecognizerFilterImpl

#pragma mark - setters
-(void)setPredictable:(NSArray *)images {
    _faceRecognizer = [[DYPFaceRecognizer alloc] init];
    NSMutableArray *labels = [@[] mutableCopy];
    for (int i = 0; i < images.count; i++) [labels addObject:@1];
    [_faceRecognizer train:images andLabels:labels];
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    [asset fetchImage:^(UIImage *image, NSDictionary *data) {
        if ([_faceRecognizer predict:image] > 0) {
            isElegible();
        }
    }];
}

-(NSString *)explain {
    return @"👦🏽";
}

@end