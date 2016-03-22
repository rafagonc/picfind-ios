//
//  DYPLuminosityFilterImpl.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "DYPLuminosityFilter.h"

@interface DYPLuminosityFilterImpl : NSObject

<DYPLuminosityFilter>

#pragma mark - constructor
-(instancetype)initWithInitialValue:(CGFloat)initialValue andFinalValue:(CGFloat)finalValue;

@end
