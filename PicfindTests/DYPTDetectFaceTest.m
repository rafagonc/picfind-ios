//
//  DYPTDetectFaceTest.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DYPFaceDetector.h"

@import CoreImage;

@interface DYPTDetectFaceTest : XCTestCase

#pragma mark - properties
@property (nonatomic,strong) UIImage *photoWithFace;
@property (nonatomic,strong) UIImage *photoWithoutFace;

@end

@implementation DYPTDetectFaceTest

#pragma mark - setup
-(void)setUp {
    [super setUp];
    self.photoWithFace = [UIImage imageNamed:@"test_photo"];
    self.photoWithoutFace = [UIImage imageNamed:@"no_face_photo"];
}

#pragma mark - test
-(void)testDetectFaceWithPhotoWithFace {
    DYPFaceDetector *faceDetector = [[DYPFaceDetector alloc] initWithImage:self.photoWithFace];
    NSArray * rects = [faceDetector detect];
    XCTAssertTrue(rects.count == 1);
}
-(void)testDetectFacetWithPhotoWithoutFace {
    DYPFaceDetector *faceDetector = [[DYPFaceDetector alloc] initWithImage:self.photoWithoutFace];
    NSArray * rects = [faceDetector detect];
    XCTAssertTrue(rects.count == 0);
}

@end
