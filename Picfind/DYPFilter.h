//
//  DYPFilter.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPAssetProtocol.h"

@protocol DYPFilter <NSObject>

-(BOOL)analyze:(id<DYPAssetProtocol>)asset;

@end
