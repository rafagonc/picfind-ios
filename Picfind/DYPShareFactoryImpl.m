//
//  DYPShareFactoryImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPShareFactoryImpl.h"
#import "DYPMailShareImpl.h"
#import "DYPFacebookShareImpl.h"
#import "DYPTwitterShareImpl.h"

@implementation DYPShareFactoryImpl

-(id<DYPShare>)shareForType:(DYPShareType)type {
    switch (type) {
        case DYPShareTypeFacebook:
            return [[DYPFacebookShareImpl alloc] init];
            break;
        case DYPShareTypeMail:
            return [[DYPMailShareImpl alloc] init];
            break;
        case DYPShareTypeTwitter:
            return [[DYPTwitterShareImpl alloc] init];
            break;
            
        default:
            @throw [NSException exceptionWithName:@"DYPErrorName" reason:@"Not mapped enum" userInfo:@{}];
            break;
    }
}

@end
