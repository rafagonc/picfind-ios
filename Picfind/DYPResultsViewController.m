
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
#import "DYPAssetDataAccessObject.h"
#import "RGNavigationBarProgressView.h"
#import "DYPCreateNameViewController.h"

@interface DYPResultsViewController () <DYPAssetDatasourceDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) RGNavigationBarProgressView * progressView;
@property (weak, nonatomic) IBOutlet UIView *noResultsView;

#pragma mark - properties
@property (weak, nonatomic) DYPFilterCollection *collection;
@property (assign, nonatomic) BOOL empty;
@property (assign, nonatomic) BOOL loading;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPAssetDataAccessObject> assetDataAccessObject;
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
    
    RGNavigationBarProgressView *progressView = [[RGNavigationBarProgressView alloc] init];
    [self.view addSubview:progressView];
    [self setProgressView:progressView];
    
    [self start];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    [self.navigationItem setRightBarButtonItem:addButton];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.search stop];
}

#pragma mark - datasource
-(void)datasource:(id<DYPCollectionViewDatasourceProtocol>)datasource wantsToCheckOutPicture:(id<DYPAssetProtocol>)asset {
    DYPImageViewController *imageViewController = [[DYPImageViewController alloc] initWithAsset:asset];
    [self.navigationController pushViewController:imageViewController animated:YES];
}

#pragma mark - methods
-(void)start {
    __weak typeof(self) welf = self;
    self.empty = NO;
    [self startFullLoading];
    self.loading = YES;
    self.noResultsView.hidden = YES;
    [self.view bringSubviewToFront:self.progressView];
    [self.search assetsWithFilterCollection:self.collection callback:^(NSArray<id<DYPAssetProtocol>> *assets) {
        [welf.datasource setData:assets];
        [welf.collectionView reloadData];
        [welf stopFullLoading];
        [welf.progressView stop];
        [welf.noResultsView setHidden:[assets count] > 0];
        [welf setEmpty:assets.count == 0];
        [welf setLoading:NO];
    } progress:^(CGFloat progress) {
        [welf.progressView setPercentage:progress];
    }];
}

#pragma mark - actions
-(void)addAction:(UIBarButtonItem *)item {
    if (!self.empty && !self.loading) {
        DYPCreateNameViewController *create = [[DYPCreateNameViewController alloc] initWithAssets:(id<NSCollection>)self.datasource.data];
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:create] animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"No photos!" message:@"You can't create an album with no photos" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
