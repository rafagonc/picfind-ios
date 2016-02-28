
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

@interface DYPResultsViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

#pragma mark - properties
@property (weak, nonatomic) DYPFilterCollection *collection;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPAssetSearch> search;
@property (setter=injected:,readonly) id<DYPCollectionViewDatasourceProtocol> datasource;

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
    
    [self.collectionView setDataSource:self.datasource];
    [self.collectionView setDelegate:self.datasource];
    [self.collectionView reloadData];
    
    [self start];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
