//
//  DYPFaceCropper.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/29/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYPFaceCropper : NSObject

#pragma mark - constructor
-(instancetype)initWithImage:(UIImage *)image andFaceRect:(CGRect)face;

#pragma mark - image
-(UIImage *)face;

@end
