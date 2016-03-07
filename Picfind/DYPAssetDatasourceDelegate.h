//
//  DYPAssetDatasourceDelegate.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPCollectionViewDatasourceProtocol.h"
#import "DYPAssetProtocol.h"
#import "DYPCollectionViewDatasourceProtocol.h"

@protocol DYPAssetDatasourceDelegate <NSObject>

-(void)datasource:(id<DYPCollectionViewDatasourceProtocol>)datasource wantsToCheckOutPicture:(id<DYPAssetProtocol>)asset;

@end
