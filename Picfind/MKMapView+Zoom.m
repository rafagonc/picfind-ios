//
//  MKMapView+Zoom.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "MKMapView+Zoom.h"
#import <MapKit/MapKit.h>

@implementation MKMapView (Zoom)

-(void)zoomToAnnotations {
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in self.annotations) {
        if ([annotation coordinate].latitude == 0) continue;
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(zoomRect)) {
            zoomRect = pointRect;
        } else {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }
    [self setVisibleMapRect:zoomRect edgePadding:UIEdgeInsetsMake(40, 40, 40, 40) animated:YES];
}

@end
