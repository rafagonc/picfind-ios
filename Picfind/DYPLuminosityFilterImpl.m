//
//  DYPLuminosityFilterImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLuminosityFilterImpl.h"
#import "UIImage+Pixels.h"

@interface DYPLuminosityFilterImpl ()

#pragma mark - properties
@property (nonatomic,assign) CGFloat initialValue;
@property (nonatomic,assign) CGFloat finalValue;

@end

@implementation DYPLuminosityFilterImpl

#pragma mark - constructor
-(instancetype)initWithInitialValue:(CGFloat)initialValue andFinalValue:(CGFloat)finalValue {
    if (self = [super init]) {
        self.finalValue = finalValue;
        self.initialValue = initialValue;
    } return self;
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    [asset fetchImage:^(UIImage *image, NSDictionary *data) {
        CGFloat lum = [image luminosity];
        if (lum >= self.initialValue && lum <= self.finalValue) {
            isElegible();
        }
        image = nil;
    }];
}
-(NSString *)explain {
    return [NSString stringWithFormat:@"🌗 %.2f - %.2f", self.initialValue, self.finalValue];
}
-(DYPFilterPriority)priority {
    return DYPFilterPrioritySlow;
}

@end
