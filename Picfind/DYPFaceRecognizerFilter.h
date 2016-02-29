//
//  DYPFaceRecognizerFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/28/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilter.h"

@protocol DYPFaceRecognizerFilter <DYPFilter>

-(void)setPredictable:(NSArray *)images;

@end
