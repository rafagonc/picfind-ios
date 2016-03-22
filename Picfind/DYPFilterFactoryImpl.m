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
#import "DYPAlbumFilterImpl.h"
#import "DYPFavoriteFilterImpl.h"
#import "DYPFaceCountFilterImpl.h"
#import "DYPLuminosityFilterImpl.h"

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
-(id<DYPAlbumFilter>)albumFilterForAlbums:(id<NSCollection>)albums {
    return [[DYPAlbumFilterImpl alloc] initWithAlbums:albums];;
}
-(id<DYPFavoriteFilter>)favoriteFilterWithType:(DYPFavoriteFilterType)type {
    return [[DYPFavoriteFilterImpl alloc] initWithType:type];
}
-(id<DYPFaceCountFilter>)faceCountFilterWithCount:(NSInteger)count {
    return [[DYPFaceCountFilterImpl alloc] initWithCount:count];
}
-(id<DYPLuminosityFilter>)luminosityFilterWithInitialValue:(CGFloat)initialValue andFinalValue:(CGFloat)finalValue {
    return [[DYPLuminosityFilterImpl alloc] initWithInitialValue:initialValue andFinalValue:finalValue];
}

@end
