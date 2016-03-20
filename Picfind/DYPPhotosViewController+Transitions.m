//
//  DYPPhotosViewController+Transitions.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPhotosViewController+Transitions.h"
#import "DYPPeriodFilterViewController.h"
#import "DYPLocationFilterViewController.h"
#import "DYPLiveScanViewController.h"
#import "DYPLocationFilter.h"
#import "DYPPeriodFilter.h"
#import "DYPAlbumFilterViewController.h"

@implementation DYPPhotosViewController (Transitions)

#pragma mark - actions
-(void)periodFilterWasSelected:(DYPFilterCell *)cell        {
    DYPPeriodFilterViewController *period = [[DYPPeriodFilterViewController alloc] initWithPeriodFilter:(id<DYPPeriodFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPPeriodFilter)]];
    [period setDelegate:self];
    [self.navigationController pushViewController:period animated:YES];
}
-(void)locationFilterWasSelected:(DYPFilterCell *)cell      {
    DYPLocationFilterViewController *location = [[DYPLocationFilterViewController alloc] initWithLocationFilter:(id<DYPLocationFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPLocationFilter)]];
    [location setDelegate:self];
    [self.navigationController pushViewController:location animated:YES];
}
-(void)faceFilterWasSelected:(DYPFilterCell *)cell          {
    DYPLiveScanViewController *liveScan = [[DYPLiveScanViewController alloc] init];
    [liveScan setDelegate:self];
    [self.navigationController pushViewController:liveScan animated:YES];
}
-(void)albumFilterWasSelected:(DYPFilterCell *)cell         {
    DYPAlbumFilterViewController *filter = [[DYPAlbumFilterViewController alloc] init];
    [filter setDelegate:self];
    [self.navigationController pushViewController:filter animated:YES];
}

@end
