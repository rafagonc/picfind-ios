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
#import "DYPAssetDatasourceDelegate.h"
#import "UIStaticTableView.h"
#import "DYPFilterCell.h"
#import "UIFont+DYP.h"
#import "UIColor+DYP.h"
#import "DYPPhotoCollectionCell.h"
#import "DYPLocationFilterViewController.h"
#import "DYPPeriodFilterViewController.h"
#import "DYPLiveScanViewController.h"
#import "DYPCustomizer.h"
#import "DYPFilterCreatorDelegate.h"
#import "DYPLocationFilter.h"
#import "DYPPeriodFilter.h"
#import "DYPFilterCollection.h"
#import "DYPResultsViewController.h"
#import "DYPFaceRecognizerFilter.h"
#import "DYPNameFilter.h"
#import "DYPFilterFactoryImpl.h"
#import "DYPImageViewController.h"
#import "UIViewController+NotificationShow.h"
#import "DYPPhotosViewController+Transitions.h"
#import "DYPFaceCountFilter.h"

@interface DYPPhotosViewController () <UISearchResultsUpdating, UISearchBarDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;
@property (weak, nonatomic) DYPFilterCell *periodCell;
@property (weak, nonatomic) DYPFilterCell *locationCell;
@property (weak, nonatomic) DYPFilterCell *faceRecognizerCell;
@property (weak, nonatomic) DYPFilterCell *albumCell;
@property (weak, nonatomic) DYPFilterCell *favoriteCell;
@property (weak, nonatomic) DYPFilterCell *faceCountCell;

#pragma mark - properties
@property (strong, nonatomic) UISearchController *searchController;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;
@property (setter=injected:,readonly) id<DYPAssetDataAccessObject> assetDataAccessObject;
@property (setter=injected_nav:,readonly) id<DYPCustomizer> navigationBarCustomizer;

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
    
    [self setTitle:@"Picfind"];
    
    //setups
    self.appliedFilters = [[DYPFilterCollection alloc] init];
    [self setupTableView];
    [self setupSearchController];
    [self setDefinesPresentationContext:YES];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationBarCustomizer customize:self.navigationController.navigationBar];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(searchAction:)];
    [self.navigationItem setRightBarButtonItem:searchButton];
}

#pragma mark - setup
-(void)setupTableView {
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"Filters"];
    
    DYPFilterCell *periodFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Period Filter"];
    [periodFilter setDelegate:self];
    [periodFilter addTarget:self selector:@selector(periodFilterWasSelected:)];
    [self.tableView addCell:periodFilter onSection:section];
    [self setPeriodCell:periodFilter];
    
    DYPFilterCell *locationFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Location Filter"];
    [locationFilter setDelegate:self];
    [locationFilter addTarget:self selector:@selector(locationFilterWasSelected:)];
    [self.tableView addCell:locationFilter onSection:section];
    [self setLocationCell:locationFilter];
    
    DYPFilterCell *albumFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Album Filter"];
    [albumFilter setDelegate:self];
    [albumFilter addTarget:self selector:@selector(albumFilterWasSelected:)];
    [self.tableView addCell:albumFilter onSection:section];
    [self setAlbumCell:albumFilter];
    
    DYPFilterCell *favoriteFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Favorite Filter"];
    [favoriteFilter setDelegate:self];
    [favoriteFilter addTarget:self selector:@selector(favoriteFilterWasSelected:)];
    [self.tableView addCell:favoriteFilter onSection:section];
    [self setFavoriteCell:favoriteFilter];
    
    DYPFilterCell *faceCountFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Number Of Faces Filter"];
    [faceCountFilter setDelegate:self];
    [faceCountFilter addTarget:self selector:@selector(faceCountFilterWasSelected:)];
    [self.tableView addCell:faceCountFilter onSection:section];
    [self setFaceCountCell:faceCountFilter];
    
//    DYPFilterCell *faceFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Face Recognition Filter"];
//    [faceFilter setDelegate:self];
//    [faceFilter addTarget:self selector:@selector(faceFilterWasSelected:)];
//    [self.tableView addCell:faceFilter onSection:section];
//    [self setFaceRecognizerCell:faceFilter];
    
    UIStaticTableViewSection *recentsSection = [[UIStaticTableViewSection alloc] init];
    [recentsSection setHeaderName:@"Recents"];
    
    DYPPhotoCollectionCell *photosCell = [[DYPPhotoCollectionCell alloc] init];
    [photosCell setAssets:[self.assetDataAccessObject recents]];
    [self.tableView addCell:photosCell onSection:recentsSection];
    
    [self.tableView addSection:section];
    [self.tableView addSection:recentsSection];
}
-(void)setupSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"Search by name Ex: IMG_0001";
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.searchBar.tintColor = [UIColor dyp_redColor];
    [self.searchController.searchBar addToolbar];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
}

#pragma mark - delegates
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.appliedFilters clean];
    id<DYPNameFilter> nameFilter = [self.filterFactory nameFilterForName:searchBar.text];
    [self.appliedFilters addFilter:nameFilter];
    DYPResultsViewController *results = [[DYPResultsViewController alloc] initWithCollection:self.appliedFilters];
    [self.navigationController pushViewController:results animated:YES];
}
-(void)source:(id)source didCreateFilter:(id<DYPFilter>)filter {
    [self.appliedFilters addFilter:filter];
    if ([filter conformsToProtocol:@protocol(DYPLocationFilter)]) {
        [self.locationCell setFilter:filter];
    } else if ([filter conformsToProtocol:@protocol(DYPPeriodFilter)]) {
        [self.periodCell setFilter:filter];
    } else if ([filter conformsToProtocol:@protocol(DYPFaceRecognizerFilter)]) {
        [self.faceRecognizerCell setFilter:filter];
    } else if ([filter conformsToProtocol:@protocol(DYPAlbumFilter)]) {
        [self.albumCell setFilter:filter];
    } else if ([filter conformsToProtocol:@protocol(DYPFavoriteFilter)]) {
        [self.favoriteCell setFilter:filter];
    } else if ([filter conformsToProtocol:@protocol(DYPFaceCountFilter)]) {
        [self.faceCountCell setFilter:filter];
    }
}
-(void)filterCell:(DYPFilterCell *)cell didDeleteFilter:(id<DYPFilter>)filter {
    [self.appliedFilters removeFilter:filter];
}

#pragma mark - actions
-(IBAction)searchAction:(id)sender {
    if (self.appliedFilters.count == 0) {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:@"Apply some filters before searching"];
        return;
    }
    DYPResultsViewController *results = [[DYPResultsViewController alloc] initWithCollection:self.appliedFilters];
    [self.navigationController pushViewController:results animated:YES];
}

#pragma mark - dealloc
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
