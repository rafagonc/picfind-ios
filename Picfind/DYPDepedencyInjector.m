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
#import "DYPHelpAttributedString.h"
#import "DYPHelpAttributedStringImpl.h"
#import "DYPQuoteImpl.h"
#import "DYPAssetSearch.h"
#import "DYPAssetSearchImpl.h"
#import "DYPCollectionDataAccessObject.h"
#import "DYPCollectionDataAccessObjectImpl.h"
#import "DYPPhotoLibaryValidator.h"
#import "DYPAlbumTableViewDatasource.h"
#import "DYPTableViewDatasource.h"
#import "DYPAlbumValidator.h"
#import "DYPPriorityAssetSearchImpl.h"

@implementation DYPDepedencyInjector

+(void)registerImplementations {
    
    //location manager
    [[DPRegistry sharedRegistry] registerImplementation:[DYPLocationManagerImpl sharedManager] forProtocol:@protocol(DYPLocationManager) context:nil];
    
    //collection view datasoruce
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetDatasource class] forProtocol:@protocol(DYPCollectionViewDatasourceProtocol) context:@"asset"];
    
    //table view datasource
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAlbumTableViewDatasource class] forProtocol:@protocol(DYPTableViewDatasource) context:@"collection"];
    
    //dao
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAssetDataAccessObjectImpl class] forProtocol:@protocol(DYPAssetDataAccessObject) context:nil];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPCollectionDataAccessObjectImpl class] forProtocol:@protocol(DYPCollectionDataAccessObject) context:nil];

    
    //customizer
    [[DPRegistry sharedRegistry] registerImplementation:[DYPNavigationBarCustomizer class] forProtocol:@protocol(DYPCustomizer) context:@"nav"];
    
    //validation
    [[DPRegistry sharedRegistry] registerImplementation:[DYPPeriodFilterValidator class] forProtocol:@protocol(DYPValidation) context:@"period"];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPPhotoLibaryValidator class] forProtocol:@protocol(DYPValidation) context:@"photo"];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPAlbumValidator class] forProtocol:@protocol(DYPValidation) context:@"album"];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPLocationFilterValidator class] forProtocol:@protocol(DYPValidation) context:@"location"];
    
    //factories
    [[DPRegistry sharedRegistry] registerImplementation:[DYPFilterFactoryImpl class] forProtocol:@protocol(DYPFilterFactory) context:nil];
    
    //map view delegate
    [[DPRegistry sharedRegistry] registerImplementation:[DYPLocationFilterMapDatasource class] forProtocol:@protocol(DYPMapViewDatasource) context:nil];
    
    //othres
    [[DPRegistry sharedRegistry] registerImplementation:[DYPQuoteImpl class] forProtocol:@protocol(DYPQuote) context:nil];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPPriorityAssetSearchImpl class] forProtocol:@protocol(DYPAssetSearch) context:nil];
    [[DPRegistry sharedRegistry] registerImplementation:[DYPHelpAttributedStringImpl class] forProtocol:@protocol(DYPHelpAttributedString) context:nil];




}

@end
