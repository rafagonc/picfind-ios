//
//  DYPAssetProtocol.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

@import UIKit;
@import CoreLocation;

@protocol DYPAssetProtocol <NSObject>

#pragma mark - properties
-(NSDate *)creationDate;
-(NSDate *)modificationDate;
-(CLLocation *)location;
-(BOOL)isFavorite;

#pragma mark - fetching
-(void)fetchImage:(void(^)(UIImage *image, NSDictionary *data))callback;

@end
