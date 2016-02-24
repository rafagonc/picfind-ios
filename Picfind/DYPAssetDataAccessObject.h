//
//  DYPAssetDataAccessObject.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPAssetProtocol.h"
#import "NSCollection.h"

@protocol DYPAssetDataAccessObject <NSObject>

-(id<NSCollection>)recents;

@end
