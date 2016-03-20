//
//  DYPAlbumValidator.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAlbumValidator.h"

@implementation DYPAlbumValidator

-(BOOL)validate:(id)obj error:(NSError *__autoreleasing *)error {
    id<NSCollection> albums = (id<NSCollection>)obj;
    if (![albums count]) {
        if (error) *error = [NSError errorWithDomain:DYPErrorDomain code:101 userInfo:@{NSLocalizedDescriptionKey : @"You need to choose some albums"}];
        return NO;
    }
    return YES;
}

@end
