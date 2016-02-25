//
//  DYPLocationFilter.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilter.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol DYPLocationFilter <DYPFilter, MKAnnotation>

-(CLLocation *)location;
-(NSInteger)range;

@end
