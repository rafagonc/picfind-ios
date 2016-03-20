//
//  PHCollection+DYPCollectionAdapter.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Photos/Photos.h>
#import "DYPCollectionProtocol.h"

@interface PHAssetCollection (DYPCollectionAdapter)

<DYPCollectionProtocol>

@end
