//
//  DYPFaceRecognizer.h
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DYPFaceRecognizer : NSObject

#pragma mark - constructor
-(instancetype)init;

#pragma mark - methods
-(void)train:(NSArray < UIImage * > *)images andLabels:(NSArray <NSNumber *> *)labels;

#pragma mark - predict
-(int)predict:(UIImage *)image;

@end
