//
//  DYPFaceCountFilterImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/20/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFaceCountFilterImpl.h"
#import "DYPFaceDetector.h"

@interface DYPFaceCountFilterImpl ()

#pragma mark - properties
@property (nonatomic,strong) DYPFaceDetector *detector;

@end

@implementation DYPFaceCountFilterImpl

#pragma mark - constructor
-(instancetype)initWithCount:(NSInteger)count {
    if (self = [super init]) {
        self.count = count;
        self.detector = [[DYPFaceDetector alloc] init];
    } return self;
}

#pragma mark - filter
-(void)analyze:(id<DYPAssetProtocol>)asset isElegible:(void (^)())isElegible {
    __weak typeof(self) welf = self;
    dispatch_queue_t current = dispatch_get_current_queue();
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [asset fetchImage:^(UIImage *image, NSDictionary *data) {
            NSArray *faceCount = [welf.detector detectWithCIFeatureFromCGImage:image];
            if (faceCount.count >= welf.count) {
                dispatch_sync(current, ^{
                    isElegible();
                });
            }
            image = nil;
        }];
    });
}
-(NSString *)explain {
    NSMutableString *string = [[NSMutableString alloc] initWithString:@">= "];
    for (int i = 0; i < self.count; i++) {
        [string appendString:@"👨🏻"];
    }
    return [string copy];
}
-(DYPFilterPriority)priority {
    return DYPFilterPrioritySlow;
}

@end
