//
//  DYPFaceCountFilterImpl.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFaceCountFilter.h"

@interface DYPFaceCountFilterImpl : NSObject

<DYPFaceCountFilter>

#pragma mark - constructor
-(instancetype)initWithCount:(NSInteger)count;

#pragma mark - properties
@property (nonatomic,assign) NSInteger count;

@end
