//
//  DYPLocationManagerImpl.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPLocationManager.h"

@interface DYPLocationManagerImpl : NSObject

<DYPLocationManager>

+(DYPLocationManagerImpl *)sharedManager;

@end
