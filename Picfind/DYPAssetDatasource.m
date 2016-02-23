//
//  DYPAssetDatasource.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAssetDatasource.h"
#import "DYPAssetCell.h"

@interface DYPAssetDatasource ()

@property (nonatomic,strong) NSArray * assets;

@end

@implementation DYPAssetDatasource

#pragma mark - getters and setters
-(void)setData:(NSArray *)data {
    _assets = data;
    
}
-(NSArray *)data {
    return self.assets;
}

#pragma mark - datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assets.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"DYPAssetCell";
    DYPAssetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    }
    
    cell.asset = self.assets[indexPath.row];
    
    return cell;
}


@end
