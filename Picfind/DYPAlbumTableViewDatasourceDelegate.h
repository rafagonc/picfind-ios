//
//  DYPAlbumTableViewDatasourceDelegate.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPTableViewDatasource.h"
#import "DYPCollectionProtocol.h"

@protocol DYPAlbumTableViewDatasourceDelegate <NSObject>

-(void)datasource:(id<DYPTableViewDatasource>)datasource didSelectAlbums:(id<NSCollection>)collection;
-(NSString *)titleForAlbumDatasource:(id<DYPTableViewDatasource>)datasource;
-(id<NSCollection>)albumsSelectedForDatasource:(id<DYPTableViewDatasource>)tableView;

@end
