//
//  DYPValidation.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DYPValidation <NSObject>

-(BOOL)validate:(id)obj error:(NSError **)error;

@end
