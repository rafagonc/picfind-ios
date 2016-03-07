//
//  DYPAssetDatasource.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAssetDatasource.h"
#import "DYPAssetCell.h"
#import "DYPAssetDatasourceDelegate.h"

@interface DYPAssetDatasource ()

@property (nonatomic,strong) NSArray * assets;

@end

@implementation DYPAssetDatasource

@synthesize delegate;

#pragma mark - getters and setters
-(void)setData:(NSArray *)data {
    _assets = data;
}
-(NSArray *)data {
    return self.assets;
}

#pragma mark - datasource
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 50);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assets.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"DYPAssetCell";
    DYPAssetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.asset = self.assets[indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DYPAssetCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [self.delegate datasource:self wantsToCheckOutPicture:cell.asset];;
}


@end
