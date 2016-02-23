//
//  DYPFaceDetector.h
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DYPFaceDetector : NSObject

#pragma mark - constructor
-(instancetype)init __attribute__((unavailable("init not available, use initWithImage")));
-(instancetype)initWithImage:(UIImage *)image;

#pragma mark - methods
-(NSArray <NSValue *> *)detect;


@end
