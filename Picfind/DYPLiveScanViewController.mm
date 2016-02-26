//
//  DYPLiveScanViewController.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/26/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#ifdef __cplusplus
#import <opencv2/highgui/cap_ios.h>
#endif

#import "DYPLiveScanViewController.h"
#import "DYPFaceDetector.h"

@interface DYPLiveScanViewController () <CvVideoCameraDelegate> {
    cv::Mat current;
    dispatch_queue_t queue;
    dispatch_semaphore_t semaphore;
}

#pragma mark - properties
@property (nonatomic,strong) CvVideoCamera *camera;
@property (nonatomic,strong) DYPFaceDetector * faceDetector;
@property (nonatomic,strong) NSTimer *timer;

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIView *cameraContentView;

@end

@implementation DYPLiveScanViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        queue = dispatch_queue_create("com.rafagonc.face.detection", DISPATCH_QUEUE_CONCURRENT);
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.faceDetector = [[DYPFaceDetector alloc] init];
}
-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.camera = [[CvVideoCamera alloc] initWithParentView:self.cameraContentView];
    self.camera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.camera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.camera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.camera.defaultFPS = 30;
    self.camera.grayscaleMode = NO;
    self.camera.delegate = self;
    [self.camera start];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(runFaceDetection) userInfo:nil repeats:YES];
    
}

#pragma mark - delegate
-(void)processImage:(cv::Mat &)image {
    current = image;
}

#pragma mark - scheduled
-(void)runFaceDetection {
    dispatch_async(queue, ^{
        NSArray *faces = [self.faceDetector detectMat:current];
        if (faces.count == 1) {
            NSLog(@"Face!");
        } else {
            NSLog(@"Invalid Face!");
        }
    });
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
