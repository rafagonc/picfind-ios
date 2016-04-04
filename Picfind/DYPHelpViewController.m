//
//  DYPHelpViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPHelpAttributedString.h"
#import "DYPHelpViewController.h"
#import "UIColor+DYP.h"

@interface DYPHelpViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;

#pragma mark - injected
@property (setter=injected:)id<DYPHelpAttributedString> help;

@end

@implementation DYPHelpViewController

#pragma makr - construcotr
-(instancetype)init {
    if (self = [super init]) {
        
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.attributedText = [self.help help];
    [self.textView scrollRangeToVisible:NSMakeRange(0, 1)];
    
    self.helpButton.layer.borderColor = [UIColor dyp_redColor].CGColor;
    self.helpButton.layer.borderWidth = 1;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (IBAction)helpAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
