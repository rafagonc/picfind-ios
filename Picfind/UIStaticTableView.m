 //
//  UIStaticTableView.m
//  Ticket
//
//  Created by Rafael Gonçalves on 28/04/15.
//  Copyright (c) 2015 Iterative. All rights reserved.
//

#import "UIStaticTableView.h"

@interface UIStaticTableViewSection ()

@property (nonatomic,strong) NSMutableArray *cells;

@end

@implementation UIStaticTableViewSection

#pragma mark - Constructor
-(instancetype)init {
    if (self = [super init]) {
        self.cells = [[NSMutableArray alloc] init];
    } return self;
}

@end

@interface UIStaticTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *sections;

@end

@implementation UIStaticTableView

#pragma mark - Constructor
-(instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    } return self;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self commonInit];
    } return self;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    } return self;
}
-(void)awakeFromNib {
    [self commonInit];
}
-(void)commonInit {
    self.sections = [[NSMutableArray alloc] init];
    self.delegate = self;
    self.dataSource = self;
}

#pragma GCC diagnostic ignored "-Wwarning-flag"
#pragma mark - Table View Delegate And Datasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[self.sections[indexPath.section] cells] objectAtIndex:indexPath.row];
    return cell.frame.size.height;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sections[section] headerName];
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.sections[section] footerName];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)section {
    return self.sections.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    UIStaticTableViewSection *sectionRef = [self.sections objectAtIndex:section];
    return [sectionRef cells].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[[self.sections objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    
    UIView *selView = [[UIView alloc] initWithFrame:cell.frame];
    selView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    cell.selectedBackgroundView = selView;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell layoutIfNeeded];
}
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wundeclared-selector"
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(selected)]) {
        [cell performSelector:@selector(selected)];
    }
    [self deselectRowAtIndexPath:indexPath animated:YES];

}
#pragma GCC diagnostic pop

#pragma mark - overrided setters
-(void)setDelegate:(id<UITableViewDelegate>)delegate {
    super.delegate = self;
    
}
-(void)setDataSource:(id<UITableViewDataSource>)dataSource {
    super.dataSource = self;
}

#pragma mark - Adding And Removing
-(void)addSection:(UIStaticTableViewSection *)section {
    [self.sections addObject:section];
    [self reloadData];
}
-(void)removeSection:(UIStaticTableViewSection *)section {
    [self.sections removeObject:section];
    [self reloadData];
}
-(void)addCell:(UITableViewCell *)cell onSection:(UIStaticTableViewSection *)section {
    if (![section.cells containsObject:cell])
    [section.cells addObject:cell];
}
-(void)addCell:(UITableViewCell *)cell onSection:(UIStaticTableViewSection *)section animated:(BOOL)animated {
    if ([self.sections indexOfObject:section] == NSNotFound) {
        @throw [NSException exceptionWithName:@"SectionNotFoundException" reason:@"Add the section before adding the cell" userInfo:nil];
    }
    if (animated && ![section.cells containsObject:cell]) {
        [self beginUpdates];
        [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:section.cells.count inSection:[self.sections indexOfObject:section]]] withRowAnimation:UITableViewRowAnimationFade];
        [section.cells addObject:cell];
        [self endUpdates];
        [self reloadData];
    } else {
        [self addCell:cell onSection:section];
    }
}
-(void)removeCell:(UITableViewCell *)cell ofSection:(UIStaticTableViewSection *)section {
    [section.cells removeObject:cell];
    [self reloadData];
}
-(void)removeCell:(UITableViewCell *)cell ofSection:(UIStaticTableViewSection *)section animated:(BOOL)animated {
    if ([self.sections indexOfObject:section] == NSNotFound) {
        @throw [NSException exceptionWithName:@"SectionNotFoundException" reason:@"Add the section before removing the cell" userInfo:nil];
    }
    if (animated) {
        [self beginUpdates];
        [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[section.cells indexOfObject:cell] inSection:[self.sections indexOfObject:section]]] withRowAnimation:UITableViewRowAnimationFade];
        [section.cells removeObject:cell];
        [self endUpdates];
        [self reloadData];
    } else {
        [self removeCell:cell ofSection:section];
    }
}
-(void)clean {
    for (UIStaticTableViewSection *section in self.sections) {
        [section.cells removeAllObjects];
    }
    [self.sections removeAllObjects];
}



@end
