//
//  DYPFaceCountFilterViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "UIColor+DYP.h"
#import "DYPFaceCountFilterViewController.h"
#import "DYPQuote.h"
#import "UIViewController+NotificationShow.h"
#import "DYPFilterFactory.h"
#import "DYPFaceCountFilter.h"
#import <Answers/Answers.h>

@interface DYPFaceCountFilterViewController () <UITableViewDataSource, UITableViewDelegate>

#pragma mark - ui
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet UILabel *quoteLabel;

#pragma mark - injected
@property (setter=injected:)id<DYPQuote> quote;
@property (setter=injected:)id<DYPFilterFactory> filterFactory;

#pragma mark - properties
@property (nonatomic,strong) NSArray * countArray;
@property (nonatomic,strong) NSNumber *countSelected;

@end

@implementation DYPFaceCountFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        self.countSelected = @(0);
    } return self;
}
-(instancetype)initWithFaceCount:(id<DYPFaceCountFilter>)faceCountFilter {
    if (self = [super init]) {
        if (!faceCountFilter) {
            self.countSelected = @(0);
        } else {
            self.countSelected = @([faceCountFilter count]);
        }
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Number of Faces Filter"];
    
    [self.quoteLabel setText:[self.quote random]];
    self.countArray = @[@(0), @(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8)];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyAction:)];
    [self.navigationItem setRightBarButtonItem:applyButton];
}

#pragma mark - table view
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"How many faces do the picture have? (PS: This filter is not 100% accurate and also can slow the searcha bit).";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"DYPFaceCountCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [[self.countArray objectAtIndex:indexPath.row] isEqualToNumber:@(0)] ? @"Any" : [NSString stringWithFormat:@">= %@", self.countArray[indexPath.row]];
    cell.accessoryType = [self.countSelected integerValue] == [self.countArray[indexPath.row] integerValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.tintColor = [UIColor dyp_redColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.countSelected = self.countArray[indexPath.row];
    [self.tableView reloadData];
}

#pragma mark - action
-(void)applyAction:(UIBarButtonItem *)item {
    if (self.countSelected) {
        [Answers logCustomEventWithName:[self title] customAttributes:nil];
        if ([self.countSelected integerValue] != 0) {
            [self.delegate source:self didCreateFilter:[self.filterFactory faceCountFilterWithCount:[self.countSelected integerValue]]];
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
