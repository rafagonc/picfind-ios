//
//  DYPAlbumFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilter.h"

@protocol DYPAlbumFilter <DYPFilter>

-(id<NSCollection>)albums;

@end
