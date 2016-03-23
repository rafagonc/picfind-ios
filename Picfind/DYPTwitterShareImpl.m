//
//  DYPTwitterShareImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPTwitterShareImpl.h"

@import Social;

@implementation DYPTwitterShareImpl

-(void)share:(UIImage *)image from:(UIViewController *)vc {
        SLComposeViewController *compose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [compose addImage:image];
        [vc presentViewController:compose animated:YES completion:nil];
}

@end
