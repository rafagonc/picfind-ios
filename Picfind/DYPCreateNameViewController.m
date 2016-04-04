//
//  DYPCreateNameViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/9/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPCreateNameViewController.h"
#import "UIStaticTableView.h"
#import "DYPNameCell.h"
#import "DYPAssetDataAccessObject.h"
#import "UIViewController+NotificationShow.h"
#import "DYPCustomizer.h"
#import "DYPCollectionDataAccessObject.h"

@interface DYPCreateNameViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;
@property (weak, nonatomic) DYPNameCell *nameCell;

#pragma mark - properties
@property (nonatomic,strong) id<NSCollection> assets;

#pragma mark - injected
@property (setter=injected:)id<DYPAssetDataAccessObject> assetDataAccessObject;
@property (setter=injected:)id<DYPCollectionDataAccessObject> collectionDataAccessObject;
@property (setter=injected_nav:,readonly) id<DYPCustomizer> navigationBarCustomizer;

@end

@implementation DYPCreateNameViewController

#pragma mark - constructor
-(instancetype)initWithAssets:(id<NSCollection>)assts {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        _assets = assts;
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Create Album"];
    
    [self createTableView];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStylePlain target:self action:@selector(createAction:)];
    [self.navigationItem setRightBarButtonItem:createButton];

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction:)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    
    [self.navigationBarCustomizer customize:self.navigationController.navigationBar];
    
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.nameCell becomeFirstResponder];
}

#pragma mark - actions
-(void)cancelAction:(UIBarButtonItem *)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)createAction:(UIBarButtonItem *)create {
    if ([self.nameCell name].length > 0) {
        [self.collectionDataAccessObject createAlbumWithAssets:self.assets andName:[self.nameCell name] callback:^(BOOL success, NSError *error) {
            if (success) {
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                [self showNotificationWithType:SHNotificationViewTypeError withMessage:error.localizedDescription];
            }
        }];
    } else {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:@"Name is empty!"];
    }
}

#pragma mark - table view
-(void)createTableView {
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"Type the album's name"];
    
    DYPNameCell *nameCell = [[DYPNameCell alloc] init];
    [self.tableView addCell:nameCell onSection:section];
    [self setNameCell:nameCell];
    
    [self.tableView addSection:section];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
