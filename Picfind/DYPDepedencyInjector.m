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
#import "DYPValidation.h"
#import "DYPPeriodFilterValidator.h"
#import "DYPLocationManager.h"
#import "DYPLocationManagerImpl.h"

@implementation DYPDepedencyInjector

+(void)registerImplementations {
    
    //location manager
    [[DPRegistry sharedRegistry] registerImplementation:[DYPLocationManagerImpl sharedManager] forProtocol:@protocol(DYPLocationManager) context:nil];
    
    //collection view datasoruce
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetDatasource class] forProtocol:@protocol(DYPCollectionViewDatasourceProtocol) context:@"asset"];
    
    //dao
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetDataAccessObjectImpl class] forProtocol:@protocol(DYPAssetDataAccessObject) context:nil];
    
    //customizer
    [[DPRegistry sharedRegistry] registerImplementation:[DYPNavigationBarCustomizer class] forProtocol:@protocol(DYPCustomizer) context:@"nav"];
    
    //validation
    [[DPRegistry sharedRegistry] registerImplementation:[DYPPeriodFilterValidator class] forProtocol:@protocol(DYPValidation) context:@"period"];

}

@end
