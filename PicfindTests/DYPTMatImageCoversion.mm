//
//  DYPTMatImageCoversion.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DYPImageMatConverter.h"
#import "DYPMatImageConverter.h"
#import <opencv2/opencv.hpp>

using namespace cv;

@interface DYPTMatImageCoversion : XCTestCase {
    Mat mat;
}

@end

@implementation DYPTMatImageCoversion

#pragma mark - setup
-(void)setUp {
    [super setUp];
    
    mat = [DYPImageMatConverter matFromImage:[UIImage imageNamed:@"test_photo"]];
}

#pragma mark - test
-(void)testToImage {
    XCTAssertNotNil([DYPMatImageConverter imageFromMat:mat]);
}

@end
