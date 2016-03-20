//
//  DYPTableViewDatasource.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DYPTableViewDatasource <UITableViewDelegate, UITableViewDataSource>

@property NSArray *data;
@property id delegate;

@end
