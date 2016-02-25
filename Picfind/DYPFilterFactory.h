//
//  DYPFilterFactory.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilter.h"

@protocol DYPFilterFactory <NSObject>

-(id<DYPFilter>)periodFilterFrom:(NSDate *)startDate to:(NSDate *)endDate;
-(id<DYPFilter>)locationFilterWith:(CLLocation *)location range:(NSInteger)range;

@end
