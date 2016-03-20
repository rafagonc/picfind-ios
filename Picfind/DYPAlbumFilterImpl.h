//
//  DYPAlbumFilter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPAlbumFilter.h"

@interface DYPAlbumFilterImpl : NSObject

<DYPAlbumFilter>

#pragma mark - constructor
-(instancetype)initWithAlbums:(id<NSCollection>)albums;

@end
