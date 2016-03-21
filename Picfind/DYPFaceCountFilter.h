//
//  DYPFaceCountFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilter.h"

@protocol DYPFaceCountFilter <DYPFilter>

-(void)setCount:(NSInteger)count;
-(NSInteger)count;

@end
