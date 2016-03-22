//
//  DYPLuminosityFilterViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/21/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPLuminosityFilterViewController.h"
#import "UIStaticTableView.h"
#import "DYPFilterFactory.h"
#import "DYPLuminosityRangeCell.h"
#import "DYPQuote.h"

@interface DYPLuminosityFilterViewController () <DYPLuminosityRangeCellDelegate>

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

#pragma mark - properties
@property (nonatomic,assign) CGFloat initialValue;
@property (nonatomic,assign) CGFloat finalValue;

#pragma mark - injected
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;
@property (setter=injected:,readonly) id<DYPQuote> quote;

@end

@implementation DYPLuminosityFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        self.initialValue = 0.2;
        self.finalValue = 0.6;
    }return self;
}
-(instancetype)initWithInitialValue:(CGFloat)initialValue andFinalValue:(CGFloat)finalValue {
    if (self = [super init]) {
        self.initialValue = initialValue ? initialValue : 0.2;
        self.finalValue = finalValue ? finalValue : 0.6;
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Luminosity Filter"];
    [self.quoteLabel setText:[self.quote random]];
    [self createTableView];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(applyAction:)];
    [self.navigationItem setRightBarButtonItem:applyButton];
    
}

#pragma mark - table view
-(void)createTableView {
    
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"Set the luminosity of the pictures you are looking for. (Day, Night, etc...)"];
    
    DYPLuminosityRangeCell *rangeCell = [[DYPLuminosityRangeCell alloc] init];
    [rangeCell setDelegate:self];
    [self.tableView addCell:rangeCell onSection:section];
    
    [self.tableView addSection:section];
}

#pragma mark - delegate
-(void)cell:(DYPLuminosityRangeCell *)cell changedInitialValueTo:(CGFloat)initialValue andFinalValueTo:(CGFloat)finalValue {
    self.initialValue = initialValue;
    self.finalValue = finalValue;
}

#pragma mark - actions
-(void)applyAction:(UIBarButtonItem *)item {
    id<DYPLuminosityFilter> lum = [self.filterFactory luminosityFilterWithInitialValue:self.initialValue andFinalValue:self.finalValue];
    [self.delegate source:self didCreateFilter:lum];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
