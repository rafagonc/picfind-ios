//
//  DYPQuote.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/26/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPQuoteImpl.h"

@interface DYPQuoteImpl ()

@property (nonatomic,strong) NSArray *quotes;

@end

@implementation DYPQuoteImpl

#pragma mark - constructor
-(instancetype)init {
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"json"];
        NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
        NSArray *quotes = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        self.quotes = quotes;
    }
    return self;
}

#pragma mark - methods
-(NSString *)random {
    return [self.quotes objectAtIndex:arc4random() % self.quotes.count];
}

@end
