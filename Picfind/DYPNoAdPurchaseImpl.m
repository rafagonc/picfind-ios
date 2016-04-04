//
//  DYPAdPurchaser.m
//  Picfind
//
//  Created by Rafael Gonzalves on 4/3/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

@import StoreKit;

#import "DYPNoAdPurchaseImpl.h"
#import <AdColony/AdColony.h>

@interface DYPNoAdPurchaseImpl () <UIAlertViewDelegate, SKProductsRequestDelegate>

#pragma mark - properties
@property (nonatomic,strong) SKProductsRequest *productsRequest;
@property (nonatomic,strong) SKProduct * product;

@end

static NSString *const DYPNoAdPurchasedKey = @"DYPNoAdPurchasedKey";

@implementation DYPNoAdPurchaseImpl

#pragma mark - constructor
-(instancetype)init {
    if (self = [super init]) {
        
    } return self;
}

#pragma mark - methods
-(void)askInViewController:(UIViewController *)vc {
    NSInteger random = arc4random() % 2;
    if (random == 0 || random == 1) {
        if (![self hasPurchased]) {
            [[[UIAlertView alloc] initWithTitle:@"Ad" message:@"To mantain our services we need you to see an ad once in a while, otherwise you can purchase 'no ads'." delegate:self cancelButtonTitle:@"Continue and see ad" otherButtonTitles:@"Purchase", nil] show];
        }
    }
}

#pragma mark - alert view delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self purchase];
    } else {
        
    }
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [AdColony playVideoAdForZone:@"vz84659a7599c24beb88" withDelegate:nil];
    }
}

#pragma mark - purchase
-(void)purchase {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"products" withExtension:@"plist"];
    NSArray *productIdentifiers = [NSArray arrayWithContentsOfURL:url];
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:productIdentifiers]];
    [request setDelegate:self];
    [request start];
    self.productsRequest = request;
    
}

#pragma mark - prod request delegate
-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    self.product = response.products.firstObject;
    SKMutablePayment *mPayment = [SKMutablePayment paymentWithProduct:self.product];
    mPayment.quantity = 1;
    [[SKPaymentQueue defaultQueue] addPayment:mPayment];
}

#pragma mark - persisting
-(void)persistCompletedPurchase:(SKPaymentTransaction *)transaction {
    NSUserDefaults *storage = [NSUserDefaults standardUserDefaults];
    NSData *newReceipt = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] appStoreReceiptURL]];
    NSArray *savedReceipts = [storage arrayForKey:@"receipts"];
    if (!savedReceipts) {
        [storage setObject:@[newReceipt] forKey:@"receipts"];
    } else {
        NSArray *updatedReceipts = [savedReceipts arrayByAddingObject:newReceipt];
        [storage setObject:updatedReceipts forKey:@"receipts"];
    }
    [storage setBool:YES forKey:DYPNoAdPurchasedKey];
    [storage synchronize];
    
    
}
-(BOOL)hasPurchased {
    NSUserDefaults *storage = [NSUserDefaults standardUserDefaults];
    return [storage boolForKey:DYPNoAdPurchasedKey];
}

@end
