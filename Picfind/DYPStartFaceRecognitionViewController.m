//
//  DYPStartFaceRecognitionViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPStartFaceRecognitionViewController.h"
#import "DYPLiveScanViewController.h"

@interface DYPStartFaceRecognitionViewController ()

@end

@implementation DYPStartFaceRecognitionViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}

#pragma mark - actions
-(IBAction)startAction:(id)sender {
    DYPLiveScanViewController *liveScan = [[DYPLiveScanViewController alloc] init];
    [self.navigationController pushViewController:liveScan animated:YES];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
