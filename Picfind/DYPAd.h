//
//  DYPAd.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DYPAd <NSObject>

-(void)showAdOnViewController:(UIViewController *)vc withCallback:(void(^)())callback;
@end
