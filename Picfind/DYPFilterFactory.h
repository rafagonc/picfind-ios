//
//  DYPFilterFactory.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPPeriodFilter.h"
#import "DYPLocationFilter.h"
#import "DYPFaceRecognizerFilter.h"

@protocol DYPFilterFactory <NSObject>

-(id<DYPPeriodFilter>)periodFilterFrom:(NSDate *)startDate to:(NSDate *)endDate;
-(id<DYPLocationFilter>)locationFilterWith:(CLLocation *)location range:(NSInteger)range;
-(id<DYPFaceRecognizerFilter>)faceRecognizerFilterWithImages:(NSArray *)images;

@end
