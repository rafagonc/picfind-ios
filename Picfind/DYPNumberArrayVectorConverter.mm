//
//  DYPNumberArrayVectorConverter.m
//  DoYouHaveAnyPhotosOfMe
//
//  Created by Rafael Gonzalves on 2/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPNumberArrayVectorConverter.h"

@interface DYPNumberArrayVectorConverter ()

@property (nonatomic,strong) NSArray <NSNumber *> * numbers;

@end

@implementation DYPNumberArrayVectorConverter

#pragma mark - constructors
-(instancetype)initWithNumberArray:(NSArray<NSNumber *> *)numbers {
    if (self = [super init]) {
        _numbers = numbers;
    } return self;
}

#pragma mark - methods
-(std::vector<int>)int_vector {
    std::vector<int> vector;
    for (NSNumber *num in _numbers) {
        vector.push_back([num intValue]);
    }
    return vector;
}

#pragma mark - factory method
+(std::vector<int>)int_vectorFromNumberArray:(NSArray<NSNumber *> *)numbers {
    return [[[DYPNumberArrayVectorConverter alloc] initWithNumberArray:numbers] int_vector];
}

@end
