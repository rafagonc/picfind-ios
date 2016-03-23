//
//  DYPShareImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

@import Social;
#import "DYPFacebookShareImpl.h"

@implementation DYPFacebookShareImpl

-(void)share:(UIImage *)image from:(UIViewController *)vc {
        SLComposeViewController *compose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [compose addImage:image];
        [vc presentViewController:compose animated:YES completion:nil];
}

@end
