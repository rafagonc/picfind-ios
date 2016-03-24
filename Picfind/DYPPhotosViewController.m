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
#import "DYPHelpViewController.h"
#import "DYPLuminosityFilter.h"
#import "DYPImageViewController.h"
#import "DYPAdImpl.h"
#import "DYPAd.h"
#import <AdColony/AdColony.h>
#import <Answers/Answers.h>

#define kVelocityFastString @"fast"
#define kVelocitySlowString @"slow"

@interface DYPPhotosViewController () <UISearchResultsUpdating, UISearchBarDelegate, DYPPhotoCollectionCellDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;
@property (weak, nonatomic) DYPFilterCell *periodCell;
@property (weak, nonatomic) DYPFilterCell *locationCell;
@property (weak, nonatomic) DYPFilterCell *faceRecognizerCell;
@property (weak, nonatomic) DYPFilterCell *albumCell;
@property (weak, nonatomic) DYPFilterCell *favoriteCell;
@property (weak, nonatomic) DYPFilterCell *faceCountCell;
@property (weak, nonatomic) DYPFilterCell *luminosityCell;
@property (weak, nonatomic) UIImageView *navBarImage;

#pragma mark - properties
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) id<DYPNameFilter> appliableNameFilter;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPAd> ad;
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
    
    UIBarButtonItem *helpButton = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStylePlain target:self action:@selector(helpAction:)];
    [self.navigationItem setLeftBarButtonItem:helpButton];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"p"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 15, [UIApplication sharedApplication].statusBarFrame.size.height/2, 25, 25);
    [self.navigationController.navigationBar addSubview:imageView];
    [self setNavBarImage:imageView];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navBarImage removeFromSuperview];
}
-(void)viewWillLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.navBarImage.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 15, [UIApplication sharedApplication].statusBarFrame.size.height/2, 25, 25);

}

#pragma mark - setup
-(void)setupTableView {
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"search by"];
    
    DYPFilterCell *periodFilter = [[DYPFilterCell alloc] initWithFilterText:@"Period"];
    [periodFilter setDelegate:self];
    [periodFilter setVel:kVelocityFastString];
    [periodFilter addTarget:self selector:@selector(periodFilterWasSelected:)];
    [self.tableView addCell:periodFilter onSection:section];
    [self setPeriodCell:periodFilter];
    
    DYPFilterCell *locationFilter = [[DYPFilterCell alloc] initWithFilterText:@"Location"];
    [locationFilter setDelegate:self];
    [locationFilter setVel:kVelocityFastString];
    [locationFilter addTarget:self selector:@selector(locationFilterWasSelected:)];
    [self.tableView addCell:locationFilter onSection:section];
    [self setLocationCell:locationFilter];
    
    DYPFilterCell *albumFilter = [[DYPFilterCell alloc] initWithFilterText:@"Album"];
    [albumFilter setDelegate:self];
    [albumFilter setVel:kVelocityFastString];
    [albumFilter addTarget:self selector:@selector(albumFilterWasSelected:)];
    [self.tableView addCell:albumFilter onSection:section];
    [self setAlbumCell:albumFilter];
    
    DYPFilterCell *favoriteFilter = [[DYPFilterCell alloc] initWithFilterText:@"Favorite"];
    [favoriteFilter setDelegate:self];
    [favoriteFilter setVel:kVelocityFastString];
    [favoriteFilter addTarget:self selector:@selector(favoriteFilterWasSelected:)];
    [self.tableView addCell:favoriteFilter onSection:section];
    [self setFavoriteCell:favoriteFilter];
    
    DYPFilterCell *faceCountFilter = [[DYPFilterCell alloc] initWithFilterText:@"Faces"];
    [faceCountFilter setDelegate:self];
    [faceCountFilter setVel:kVelocitySlowString];
    [faceCountFilter addTarget:self selector:@selector(faceCountFilterWasSelected:)];
    [self.tableView addCell:faceCountFilter onSection:section];
    [self setFaceCountCell:faceCountFilter];
    
    DYPFilterCell *luminosityFilter = [[DYPFilterCell alloc] initWithFilterText:@"Luminosity"];
    [luminosityFilter setDelegate:self];
    [luminosityFilter setVel:kVelocitySlowString];
    [luminosityFilter addTarget:self selector:@selector(luminosityFilterWasSelected:)];
    [self.tableView addCell:luminosityFilter onSection:section];
    [self setLuminosityCell:luminosityFilter];
    
//    DYPFilterCell *faceFilter = [[DYPFilterCell alloc] initWithFilterText:@"Apply Face Recognition Filter"];
//    [faceFilter setDelegate:self];
//    [faceFilter addTarget:self selector:@selector(faceFilterWasSelected:)];
//    [self.tableView addCell:faceFilter onSection:section];
//    [self setFaceRecognizerCell:faceFilter];
    
    UIStaticTableViewSection *recentsSection = [[UIStaticTableViewSection alloc] init];
    [recentsSection setHeaderName:@"Recents"];
    
    DYPPhotoCollectionCell *photosCell = [[DYPPhotoCollectionCell alloc] init];
    [photosCell setAssets:[self.assetDataAccessObject recents]];
    [photosCell setDelegate:self];
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
    [self setAppliableNameFilter:nameFilter];
    DYPResultsViewController *results = [[DYPResultsViewController alloc] initWithCollection:self.appliedFilters];
    [self.navigationController pushViewController:results animated:YES];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.appliedFilters removeFilter:self.appliableNameFilter];
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
    } else if ([filter conformsToProtocol:@protocol(DYPLuminosityFilter)]) {
        [self.luminosityCell setFilter:filter];
    }
}
-(void)filterCell:(DYPFilterCell *)cell didDeleteFilter:(id<DYPFilter>)filter {
    [self.appliedFilters removeFilter:filter];
}
-(void)cell:(DYPPhotoCollectionCell *)cell wantsToCheckOutPicture:(id<DYPAssetProtocol>)asset {
    DYPImageViewController *imageViewer = [[DYPImageViewController alloc] initWithAsset:asset];
    [self.navigationController pushViewController:imageViewer animated:YES];
}

#pragma mark - actions
-(IBAction)searchAction:(id)sender {
    if (self.appliedFilters.count == 0) {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:@"Apply some filters before searching"];
        return;
    }
    [self.ad showAdOnViewController:self withCallback:^{
        [Answers logCustomEventWithName:@"Searched" customAttributes:nil];
        DYPResultsViewController *results = [[DYPResultsViewController alloc] initWithCollection:self.appliedFilters];
        [self.navigationController pushViewController:results animated:YES];
    }];
}
-(IBAction)helpAction:(id)sender {
    DYPHelpViewController *help = [[DYPHelpViewController alloc] init];
    [self presentViewController:help animated:YES completion:nil];
}

#pragma mark - dealloc
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
