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

@import Photos;

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - application delegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DPInjector inject];
    [DYPDepedencyInjector registerImplementations];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:[[DYPPhotosViewController alloc] init]];
    [self.window setRootViewController:navControl];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
