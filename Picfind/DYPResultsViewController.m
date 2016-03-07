
//
//  DYPResultsViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/28/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPResultsViewController.h"
#import "DYPAssetSearch.h"
#import "DYPCollectionViewDatasourceProtocol.h"
#import "UIViewController+Loading.h"
#import "DYPAssetCell.h"
#import "DYPAssetDatasourceDelegate.h"
#import "DYPImageViewController.h"

@interface DYPResultsViewController () <DYPAssetDatasourceDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

#pragma mark - properties
@property (weak, nonatomic) DYPFilterCollection *collection;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPAssetSearch> search;
@property (setter=injected_asset:,readonly) id<DYPCollectionViewDatasourceProtocol> datasource;

@end

@implementation DYPResultsViewController

#pragma mark - constructor
-(instancetype)initWithCollection:(DYPFilterCollection *)collection {
    if (self = [super init]) {
        self.collection = collection;
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Results"];
    
    [self.datasource setDelegate:self];
    [self.collectionView registerClass:[DYPAssetCell class] forCellWithReuseIdentifier:@"DYPAssetCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DYPAssetCell" bundle:nil] forCellWithReuseIdentifier:@"DYPAssetCell"];
    [self.collectionView setDataSource:self.datasource];
    [self.collectionView setDelegate:self.datasource];
    [self.collectionView reloadData];
    
    [self start];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - datasource
-(void)datasource:(id<DYPCollectionViewDatasourceProtocol>)datasource wantsToCheckOutPicture:(id<DYPAssetProtocol>)asset {
    DYPImageViewController *imageViewController = [[DYPImageViewController alloc] initWithAsset:asset];
    [self.navigationController pushViewController:imageViewController animated:YES];
}

#pragma mark - methods
-(void)start {
    __weak typeof(self) welf = self;
    [self startFullLoading];
    [self.search assetsWithFilterCollection:self.collection callback:^(NSArray<id<DYPAssetProtocol>> *assets) {
        [welf.datasource setData:assets];
        [welf.collectionView reloadData];
        [welf stopFullLoading];
    }];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
