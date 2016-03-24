//
//  DYPAdImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAdImpl.h"
#import <AdColony/AdColony.h>

typedef void(^DYPAdCallback)();

@interface DYPAdImpl () <UIAlertViewDelegate, AdColonyAdDelegate>

@property (nonatomic,copy) DYPAdCallback ad;

@end

@implementation DYPAdImpl

#pragma mark - ad
-(void)showAdOnViewController:(UIViewController *)vc withCallback:(DYPAdCallback)callback {
    NSInteger random = arc4random() % 3;
    if (random == 1 || random == 2) {
        callback();
        return;
    }
    self.ad = callback;
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Ad" message:@"To maintain our services, once in a while we need you to watch an ad 😑" delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
    [alertView show];
    
}

#pragma mark - alert view delegate
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [AdColony playVideoAdForZone:@"vz84659a7599c24beb88" withDelegate:self];

}

#pragma mark - ad delegate
-(void)onAdColonyAdFinishedWithInfo:(AdColonyAdInfo *)info {
    if (self.ad) self.ad();
}

@end
