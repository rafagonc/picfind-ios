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
#import "RFQuiltLayout.h"
#import "DYPAssetDatasourceDelegate.h"

@interface DYPPhotosViewController () <UICollectionViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, DYPAssetDatasourceDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet RFQuiltLayout *quiltLayout;

#pragma mark - properties
@property (strong, nonatomic) UISearchController *searchController;

@property (weak, nonatomic) IBOutlet UIView *searchBarContentView;
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
    
    //setups
    [self setupCollectionView];
    [self setupLayout];
    [self setupSearchController];
    [self setDefinesPresentationContext:YES];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
}
-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.searchController.searchBar setFrame:CGRectMake(0, 0, self.searchBarContentView.frame.size.width, self.searchBarContentView.frame.size.height)];
}

#pragma mark - setup
-(void)setupCollectionView {
    [self.collectionView registerClass:[UISearchBar class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UISearchBar"];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DYPAssetCell class]) bundle:nil] forCellWithReuseIdentifier:@"DYPAssetCell"];
    [self.datasource setData:[self.assetDataAccessObject recents]];
    [self.collectionView setDataSource:self.datasource];
    [self.collectionView setDelegate:self.datasource];
    [self.collectionView reloadData];
}
-(void)setupLayout {
    self.quiltLayout.direction = UICollectionViewScrollDirectionVertical;
    self.quiltLayout.blockPixels = CGSizeMake(75, 75);
    self.quiltLayout.delegate = (id<RFQuiltLayoutDelegate>)self.datasource;
}
-(void)setupSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.searchController.searchBar addToolbar];
    [self.searchBarContentView addSubview:self.searchController.searchBar];
    [self.searchController.searchBar setFrame:self.searchBarContentView.frame];

}

#pragma mark - delegates
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

#pragma mark - dealloc
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
