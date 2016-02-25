//
//  DYPLocation.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DYPLocation : NSObject

<MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D location;

@end
