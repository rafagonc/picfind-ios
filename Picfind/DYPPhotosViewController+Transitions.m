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
#import "DYPFavoriteFilterViewController.h"
#import "DYPFaceCountFilterViewController.h"
#import "DYPLuminosityFilterViewController.h"
#import "DYPLuminosityFilter.h"

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
    DYPAlbumFilterViewController *filter = [[DYPAlbumFilterViewController alloc] initWithAlbumFilter:(id<DYPAlbumFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPAlbumFilter)]];
    [filter setDelegate:self];
    [self.navigationController pushViewController:filter animated:YES];
}
-(void)favoriteFilterWasSelected:(DYPFilterCell *)cell {
    DYPFavoriteFilterViewController *favorite = [[DYPFavoriteFilterViewController alloc] initWithFavorite:(id<DYPFavoriteFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPFavoriteFilter)]];
    [favorite setDelegate:self];
    [self.navigationController pushViewController:favorite animated:YES];
}
-(void)faceCountFilterWasSelected:(DYPFilterCell *)cell {
    DYPFaceCountFilterViewController *faceCount = [[DYPFaceCountFilterViewController alloc] initWithFaceCount:(id<DYPFaceCountFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPFaceCountFilter)]];
    [faceCount setDelegate:self];
    [self.navigationController pushViewController:faceCount animated:YES];
}
-(void)luminosityFilterWasSelected:(DYPFilterCell *)cell {
    DYPLuminosityFilterViewController *lum = [[DYPLuminosityFilterViewController alloc] initWithInitialValue:[(id<DYPLuminosityFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPLuminosityFilter)] initialValue] andFinalValue:[(id<DYPLuminosityFilter>)[self.appliedFilters filterWithProtocol:@protocol(DYPLuminosityFilter)] finalValue]];
    [lum setDelegate:self];
    [self.navigationController pushViewController:lum animated:YES];
}

@end
