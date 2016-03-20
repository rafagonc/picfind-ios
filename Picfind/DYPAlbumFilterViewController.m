//
//  DYPAlbumFilterViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAlbumFilterViewController.h"
#import "DYPTableViewDatasource.h"
#import "DYPAlbumTableViewDatasourceDelegate.h"
#import "DYPCollectionDataAccessObject.h"
#import "DYPFilterFactory.h"
#import "DYPAlbumFilter.h"
#import "UIViewController+NotificationShow.h"
#import "DYPValidation.h"

@interface DYPAlbumFilterViewController () <DYPAlbumTableViewDatasourceDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark - properties
@property (nonatomic,strong) id<NSCollection> albums;

#pragma mark - injected
@property (setter=injected_collection:,readonly) id<DYPTableViewDatasource> datasource;
@property (setter=injected:,readonly) id<DYPCollectionDataAccessObject> colletionDataAccessObject;
@property (setter=injected_album:,readonly) id<DYPValidation> albumValidator;
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;

@end

@implementation DYPAlbumFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.datasource setData:(NSArray *)[self.colletionDataAccessObject all]];
    [self.datasource setDelegate:self];
    [self.tableView setDataSource:self.datasource];
    [self.tableView setDelegate:self.datasource];
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *applyItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyAction:)];
    [self.navigationItem setRightBarButtonItem:applyItem];
}

#pragma mark - delegate
-(void)datasource:(id<DYPTableViewDatasource>)datasource didSelectAlbums:(id<NSCollection>)collection {
    self.albums = collection;
}
-(NSString *)titleForAlbumDatasource:(id<DYPTableViewDatasource>)datasource {
    return @"Choose the albums that you wanna search.";
}

#pragma mark - actions
-(void)applyAction:(UIBarButtonItem *)item {
    NSError *error;
    if ([self.albumValidator validate:self.albums error:&error]) {
        id<DYPAlbumFilter> album = [self.filterFactory albumFilterForAlbums:self.albums];
        [self.delegate source:self didCreateFilter:album];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:error.localizedDescription];
    }
}

#pragma mark - daelloc
-(void)dealloc {
    
}

@end
