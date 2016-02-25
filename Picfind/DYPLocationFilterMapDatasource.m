//
//  DYPLocationFilterMapDatasource.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLocationFilterMapDatasource.h"
#import "UIColor+DYP.h"

@implementation DYPLocationFilterMapDatasource

#pragma mark - map delegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    NSString *reuse = @"resuse_id";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuse];
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuse];
    }
    
    annotationView.annotation = annotation;
    
    return annotationView;
}
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
    [circleRenderer setFillColor:[[UIColor dyp_redColor] colorWithAlphaComponent:0.4]];
    [circleRenderer setStrokeColor:[UIColor dyp_redColor]];
    [circleRenderer setLineWidth:2];
    return circleRenderer;
}

@end
