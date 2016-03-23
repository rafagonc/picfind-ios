//
//  DYPShareFactory.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPShare.h"

typedef NS_ENUM(NSUInteger, DYPShareType) {
    DYPShareTypeMail,
    DYPShareTypeTwitter,
    DYPShareTypeFacebook,
};

@protocol DYPShareFactory <NSObject>

-(id<DYPShare>)shareForType:(DYPShareType)type;

@end
