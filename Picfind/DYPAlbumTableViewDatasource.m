//
//  DYPAlbumTableViewDatasource.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAlbumTableViewDatasource.h"
#import "DYPAlbumCell.h"
#import "DYPAlbumTableViewDatasourceDelegate.h"

@interface DYPAlbumTableViewDatasource () {
    __weak UITableView *_tableView;
}

@property (nonatomic,strong) id<NSCollection> albums;

@end

@implementation DYPAlbumTableViewDatasource

@synthesize delegate;

#pragma mark - data
-(void)setData:(NSArray *)data {
    self.albums = (id<NSCollection>)data;
}
-(NSArray *)data {
    return (NSArray *)self.albums;
}

#pragma mark - table view
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    _tableView = tableView;
    return [self.delegate titleForAlbumDatasource:self];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.albums count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"DYPAlbumCell";
    DYPAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[DYPAlbumCell alloc] init];
    }
    cell.collection = [self.albums objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [(DYPAlbumCell *)[tableView cellForRowAtIndexPath:indexPath] setChoosed:![(DYPAlbumCell *)[tableView cellForRowAtIndexPath:indexPath]choosed]];
    [self.delegate datasource:self didSelectAlbums:[self choosedAlbums]];
}

#pragma mark - methods
-(id<NSCollection>)choosedAlbums {
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.albums count]; i++) {
        DYPAlbumCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (cell.choosed) {
            [albums addObject:[cell collection]];
        }
    }
    return (id<NSCollection>)albums;
}

@end
