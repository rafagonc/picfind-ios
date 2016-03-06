//
//  DYPFilterFactoryImpl.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilterFactoryImpl.h"
#import "DYPLocationFilterImpl.h"
#import "DYPPeriodFilterImpl.h"
#import "DYPFaceRecognizerFilterImpl.h"
#import "DYPNameFilterImpl.h"

@implementation DYPFilterFactoryImpl

#pragma mark - creation
-(id<DYPLocationFilter>)locationFilterWith:(CLLocation *)location range:(NSInteger)range {
    return [[DYPLocationFilterImpl alloc] initWithLocation:location andRange:range];
}
-(id<DYPPeriodFilter>)periodFilterFrom:(NSDate *)startDate to:(NSDate *)endDate {
    return [[DYPPeriodFilterImpl alloc] initWithFirstDate:startDate andLastDate:endDate];
}
-(id<DYPFaceRecognizerFilter>)faceRecognizerFilterWithImages:(NSArray *)images andRects:(NSArray *)rects {
    DYPFaceRecognizerFilterImpl *fr = [[DYPFaceRecognizerFilterImpl alloc] init];
    [fr setPredictable:images andRects:rects];
    return fr;
}
-(id<DYPNameFilter>)nameFilterForName:(NSString *)name {
    return [[DYPNameFilterImpl alloc] initWithName:name];
}

@end
