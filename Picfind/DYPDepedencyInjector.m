//
//  DYPDepedencyInjector.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPDepedencyInjector.h"
#import "DYPCollectionViewDatasourceProtocol.h"
#import "DYPAssetDatasource.h"
#import "DYPAssetDataAccessObject.h"
#import "DYPAssetDataAccessObjectImpl.h"
#import "Depend/DPRegistry.h"
#import "DYPCustomizer.h"
#import "DYPNavigationBarCustomizer.h"

@implementation DYPDepedencyInjector

+(void)registerImplementations {
    
    //collection view datasoruce
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetDatasource class] forProtocol:@protocol(DYPCollectionViewDatasourceProtocol) context:@"asset"];
    
    //dao
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetDataAccessObjectImpl class] forProtocol:@protocol(DYPAssetDataAccessObject) context:nil];
    
    //customizer
    [[DPRegistry sharedRegistry] registerImplementation:[DYPNavigationBarCustomizer class] forProtocol:@protocol(DYPCustomizer) context:@"nav"];

}

@end
