//
//  DYPFavoriteFilterViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFavoriteFilterViewController.h"
#import "DYPFavoriteFilter.h"
#import "DYPFilterFactory.h"
#import "UIViewController+NotificationShow.h"
#import "DYPQuote.h"
#import "UIColor+DYP.h"

@interface DYPFavoriteFilterViewController () <UITableViewDataSource, UITableViewDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

#pragma mark - properties
@property (nonatomic,strong) NSDictionary<NSString *, NSNumber *> *data;
@property (nonatomic,assign) DYPFavoriteFilterType type;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;
@property (setter=injected:,readonly) id<DYPQuote> quote;

@end

@implementation DYPFavoriteFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}
-(instancetype)initWithFavorite:(id<DYPFavoriteFilter>)favoriteFilter {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        self.type = [favoriteFilter type];
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.quoteLabel setText:[self.quote random]];
    
    [self setTitle:@"Favorite Filter"];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    self.data = @{@"Include all pictures" : @(DYPFavoriteFilterTypeAllFavs),
                  @"Include only favorite pictures" : @(DYPFavoriteFilterTypeYesFavs),
                  @"Does not include favorite pictures" : @(DYPFavoriteFilterTypeNoFavs)};
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *applyFilter = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyAction:)];
    [self.navigationItem setRightBarButtonItem:applyFilter];
}

#pragma mark - table view
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"DYPFavoriteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.data.allKeys[indexPath.row];
    cell.accessoryType = self.type == [self.data[self.data.allKeys[indexPath.row]] integerValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.tintColor = [UIColor dyp_redColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.type = [self.data[[tableView cellForRowAtIndexPath:indexPath].textLabel.text] integerValue];
    [self.tableView reloadData];
}

#pragma mark - action
-(void)applyAction:(UIBarButtonItem *)item {
    if (self.type > 0) {
        [self.delegate source:self didCreateFilter:[self.filterFactory favoriteFilterWithType:self.type]];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:@"You need to choose!"];
    }
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
