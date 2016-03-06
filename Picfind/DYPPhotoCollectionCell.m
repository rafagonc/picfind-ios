//
//  DYPPhotoCollectionCell.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPhotoCollectionCell.h"
#import "DYPCollectionViewDatasourceProtocol.h"
#import "DYPAssetCell.h"

@interface DYPPhotoCollectionCell ()

#pragma mark - ui
@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;

#pragma mark - injected
@property (setter=injected_asset:,readonly) id<DYPCollectionViewDatasourceProtocol> datasource;

@end

@implementation DYPPhotoCollectionCell

#pragma mark - constructor
-(instancetype)init{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        [self.collectionView registerClass:[DYPAssetCell class] forCellWithReuseIdentifier:@"DYPAssetCell"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"DYPAssetCell" bundle:nil] forCellWithReuseIdentifier:@"DYPAssetCell"];
        self.collectionView.dataSource = self.datasource;
        self.collectionView.delegate = self.datasource;
    } return self;
}

#pragma mark - setters
-(void)setAssets:(id<NSCollection>)assets {
    _assets = assets;
    [self.datasource setData:(NSArray *)assets];
    [self.collectionView reloadData];
}

@end
