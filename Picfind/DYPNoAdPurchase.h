//
//  DYPNoAdPurchase.h
//  Picfind
//
//  Created by Rafael Gonzalves on 4/3/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@import StoreKit;

@protocol DYPNoAdPurchase <NSObject>

-(void)askInViewController:(UIViewController *)vc;
-(void)persistCompletedPurchase:(SKPaymentTransaction *)transaction;

@end
