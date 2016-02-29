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
#import "DYPMatImageConverter.h"
#import "DYPImageMatConverter.h"
#import "DYPFaceRecognizerFilter.h"
#import "DYPFilterFactory.h"

@interface DYPLiveScanViewController () <AVCaptureVideoDataOutputSampleBufferDelegate> {
    UIImage * current;
    dispatch_queue_t queue;
    AVCaptureSession *session;
    AVCaptureVideoDataOutput *video;
}

#pragma mark - properties
@property (nonatomic,strong) CvVideoCamera *camera;
@property (nonatomic,strong) DYPFaceDetector * faceDetector;
@property (nonatomic,strong) NSTimer *timer;

#pragma mark - ui
@property (nonatomic,strong) NSMutableArray * images;

#pragma mark - injceted
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;

@end

@implementation DYPLiveScanViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        queue = dispatch_queue_create("com.rafagonc.face.detection", DISPATCH_QUEUE_SERIAL);
        self.images = [[NSMutableArray alloc] init];
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.faceDetector = [[DYPFaceDetector alloc] init];
    
    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetMedium];
    
    AVCaptureDevice *inputDevice = [self frontCamera];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session canAddInput:deviceInput]) {
        [session addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    CALayer *rootLayer = [[self view] layer];
    [previewLayer setFrame:self.view.bounds];
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    video = [[AVCaptureVideoDataOutput alloc] init];
    [video setSampleBufferDelegate:self queue:queue];
    
    [session addOutput:video];
    
    [session startRunning];
    
    [self performSelector:@selector(start) withObject:nil afterDelay:3];
    
}
-(AVCaptureDevice *)frontCamera {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == AVCaptureDevicePositionFront) {
            return device;
        }
    }
    return nil;
}

#pragma mark - methods
-(void)start {
    AVCaptureConnection *connection = [video connectionWithMediaType:AVMediaTypeVideo];
    if ([connection isVideoOrientationSupported]) {
        [connection setVideoOrientation:AVCaptureVideoOrientationPortrait];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(runFaceDetection) userInfo:nil repeats:YES];
}

#pragma mark - delegate
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    CVImageBufferRef o = CMSampleBufferGetImageBuffer(sampleBuffer);
    CIImage *ciimage = [CIImage imageWithCVImageBuffer:o];
    UIImage *image = [UIImage imageWithCIImage:ciimage];
    current = image;
}

#pragma mark - scheduled
-(void)runFaceDetection {
    @synchronized(current) {
        NSArray *faces = [self.faceDetector detectWithCIFeature:current];
        if (faces.count == 1) [self.images addObject:current];
        if (self.images.count == 10) {
            [session stopRunning];
            [self.delegate source:self didCreateFilter:[self faceRecognizerFilterWithImages:[self.images copy]]];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}

#pragma mark - creating
-(id<DYPFaceRecognizerFilter>)faceRecognizerFilterWithImages:(NSArray <UIImage *> *)images {
    return [self.filterFactory faceRecognizerFilterWithImages:images];
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
