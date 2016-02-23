//
//  DYPTFaceRecognizer.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DYPFaceRecognizer.h"

@interface DYPTFaceRecognizer : XCTestCase

@end

@implementation DYPTFaceRecognizer

#pragma mark - setup
-(void)setUp {
    [super setUp];
}

#pragma mark - test
-(void)test {
    DYPFaceRecognizer *recognizer = [[DYPFaceRecognizer alloc] init];
    NSMutableArray * images = [@[] mutableCopy];
    NSMutableArray * labels = [@[] mutableCopy];
    for (int i = 0; i < 3; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"test_sample%d", i]]];
        [labels addObject:@(i + 1)];
    }
    [recognizer train:images andLabels:labels];
    for (int i = 3; i < 7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"test_sample%d",i]];
        int result = [recognizer predict:image];
        XCTAssertTrue(result != 0);
    }
    
}

@end
