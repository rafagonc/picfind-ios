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
-(instancetype)init;

#pragma mark - methods
-(NSArray <NSValue *> *)detectWithCIFeature:(UIImage *)image;
-(NSArray <NSValue *> *)detectWithCIFeatureFromCGImage:(UIImage *)image ;

@end
