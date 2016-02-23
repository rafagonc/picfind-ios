//
//  DYPPhotosViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPhotosViewController.h"
#import "DYPAssetDataAccessObject.h"
#import "DYPAssetCell.h"
#import "DYPCollectionViewDatasourceProtocol.h"
#import "UISearchBar+Toolbar.h"

@interface DYPPhotosViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

#pragma mark - properties
@property (strong, nonatomic) UISearchController *searchController;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPAssetDataAccessObject> assetDataAccessObject;
@property (setter=injected_asset:,readonly) id<DYPCollectionViewDatasourceProtocol> datasource;

@end

@implementation DYPPhotosViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    //setup collection view
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DYPAssetCell class]) bundle:nil] forCellWithReuseIdentifier:@"DYPAssetCell"];
    
    //datasource
    [self.datasource setData:[self.assetDataAccessObject recents]];
    [self.collectionView setDataSource:self.datasource];
    [self.collectionView setDelegate:self.datasource];
    [self.collectionView reloadData];
    
    //search controller
    [self.searchBar addToolbar];

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - dealloc
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
