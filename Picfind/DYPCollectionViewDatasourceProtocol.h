//
//  DYPCollectionViewDatasourceProtocol.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DYPCollectionViewDatasourceProtocol <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,strong) NSArray *data;
@property (nonatomic,weak)   id delegate;

@end
