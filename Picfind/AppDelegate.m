//
//  AppDelegate.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "AppDelegate.h"
#import "DYPPhotosViewController.h"
#import "Depend/DPInjector.h"
#import "DYPDepedencyInjector.h"
#import <AdColony/AdColony.h>
#import <Fabric/Fabric.h>
#import <Answers/Answers.h>
#import "DYPNoAdPurchase.h"

@import Photos;
@import StoreKit;

@interface AppDelegate () <SKPaymentTransactionObserver>

@property (setter=injected:) id<DYPNoAdPurchase> no_ad_purchase;

@end

@implementation AppDelegate

#pragma mark - application delegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AdColony configureWithAppID:@"app7f5112f31bb44e7e91"
                         zoneIDs:@[@"vz84659a7599c24beb88"]
                        delegate:nil
                         logging:YES];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    [DPInjector inject];
    [DYPDepedencyInjector registerImplementations];
    
    [Fabric with:@[[Answers class]]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:[[DYPPhotosViewController alloc] init]];
    [self.window setRootViewController:navControl];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - payment
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {
    SKPaymentTransaction *transaction = transactions.firstObject;
    switch (transaction.transactionState) {
        case SKPaymentTransactionStateFailed:
            
            break;
        case SKPaymentTransactionStateDeferred:
            
            break;
        case SKPaymentTransactionStateRestored:
            
            break;
        case SKPaymentTransactionStatePurchased:
            [self.no_ad_purchase persistCompletedPurchase:transaction];
            break;
        case SKPaymentTransactionStatePurchasing:
            
            break;
    }
}

@end
