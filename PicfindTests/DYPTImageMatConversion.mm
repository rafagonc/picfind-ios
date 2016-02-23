//
//  DYPTImageMatConversion.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DYPImageMatConverter.h"
#import <opencv2/opencv.hpp>

@interface DYPTImageMatConversion : XCTestCase

@property (nonatomic,strong) UIImage * targetImage;

@end

@implementation DYPTImageMatConversion

#pragma mark - setup
-(void)setUp {
    self.targetImage = [UIImage imageNamed:@"test_photo"];
}

#pragma mark - test
-(void)testToMatConversion {
    DYPImageMatConverter *converter = [[DYPImageMatConverter alloc] initWithImage:self.targetImage];
    cv::Mat m = [converter mat];
    XCTAssertFalse(m.empty());
}
-(void)testToMatWithNilImage {
    DYPImageMatConverter *converter = [[DYPImageMatConverter alloc] initWithImage:nil];
    XCTAssertThrows([converter mat]);
}

@end
