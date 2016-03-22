//
//  DYPLuminosityFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilter.h"

@protocol DYPLuminosityFilter <DYPFilter>

#pragma mark - setters
-(void)setInitialValue:(CGFloat)initalValue;
-(void)setFinalValue:(CGFloat)finalValue;

#pragma mark - getters
-(CGFloat)initialValue;
-(CGFloat)finalValue;

@end
