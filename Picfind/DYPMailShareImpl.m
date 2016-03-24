//
//  DYPMailShareImpl.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPMailShareImpl.h"
@import MessageUI;


@interface DYPMailShareImpl () <MFMailComposeViewControllerDelegate>

@property (nonatomic,weak) UIViewController *vc;
@property (nonatomic,strong) MFMailComposeViewController *mail_vc;

@end

@implementation DYPMailShareImpl

-(void)share:(UIImage *)image from:(UIViewController *)vc {
    MFMailComposeViewController *emailShareController = [[MFMailComposeViewController alloc] init];
    emailShareController.mailComposeDelegate = self;
    [emailShareController setSubject:@"Share Image"];
    [emailShareController addAttachmentData:UIImageJPEGRepresentation(image, 1) mimeType:@"image/jpeg" fileName:@"image.jpeg"];
    if (emailShareController) [vc presentViewController:emailShareController animated:YES completion:nil];
    [self setMail_vc:emailShareController];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}


@end
