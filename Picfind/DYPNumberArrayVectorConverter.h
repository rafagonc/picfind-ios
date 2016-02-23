//
//  DYPNumberArrayVectorConverter.h
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>

@interface DYPNumberArrayVectorConverter : NSObject

#pragma mark - constructor
-(instancetype)initWithNumberArray:(NSArray <NSNumber *> *)numbers;

#pragma mark - methods
-(std::vector<int>)int_vector;

#pragma mark - factory
+(std::vector<int>)int_vectorFromNumberArray:(NSArray <NSNumber *> *)numbers;

@end
