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
#import "DYPFilterFactory.h"
#import "DYPFilterFactoryImpl.h"
#import "DYPMapViewDatasource.h"
#import "DYPLocationFilterMapDatasource.h"
#import "DYPLocationFilterValidator.h"
#import "DYPQuote.h"
#import "DYPQuoteImpl.h"
#import "DYPAssetSearch.h"
#import "DYPAssetSearchImpl.h"
#import "DYPPhotoLibaryValidator.h"

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
    [[DPRegistry sharedRegistry] registerImplementation:[DYPPhotoLibaryValidator class] forProtocol:@protocol(DYPValidation) context:@"photo"];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPLocationFilterValidator class] forProtocol:@protocol(DYPValidation) context:@"location"];
    
    //factories
    [[DPRegistry sharedRegistry] registerImplementation:[DYPFilterFactoryImpl class] forProtocol:@protocol(DYPFilterFactory) context:nil];
    
    //map view delegate
    [[DPRegistry sharedRegistry] registerImplementation:[DYPLocationFilterMapDatasource class] forProtocol:@protocol(DYPMapViewDatasource) context:nil];
    
    //othres
    [[DPRegistry sharedRegistry] registerImplementation:[DYPQuoteImpl class] forProtocol:@protocol(DYPQuote) context:nil];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetSearchImpl class] forProtocol:@protocol(DYPAssetSearch) context:nil];



}

@end
