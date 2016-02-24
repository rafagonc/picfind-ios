//
//  DYPLocationManager.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol DYPLocationManager <NSObject>

-(CLLocation *)userLocation;

@end
