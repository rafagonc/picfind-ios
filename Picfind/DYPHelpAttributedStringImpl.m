//
//  DYPHelpAttributedString.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/22/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPHelpAttributedStringImpl.h"

@implementation DYPHelpAttributedStringImpl

-(NSAttributedString *)help {
    NSMutableParagraphStyle *attributedStringParagraphStyle = [[NSParagraphStyle defaultParagraphStyle]mutableCopy];
    attributedStringParagraphStyle.alignment = NSTextAlignmentLeft;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"Hey!\n\nWith time your camera roll can become a bit big and mess. To help you guys stop scrolling up and down, I created a search engine with some filters which can help you find what you’re for.  Here is a brief explanation about each filter:\n\nAnd more… You can create albums by using the search result and share photos on social networks!\n\nPeriod Filter\n\nYou can set a period which you think the picture was taken.\n\nLocation Filter\n\nBy tapping in the map, you can set a location with a distance range which you think the picture was taken. Obs: not all picture has locations attached to it.\n\nAlbum Filter\n\nIf you dont want to search your whole album, you can speed up the algorithm by setting the specific album which you think the picture you are looking for are.\n\nFavorite Filter\n\nThe picture was favorited once in the past? You can limit the search to favorite picture or not favorited pictures;\n\nNumber of faces Filter\n\nDo you know how many people were with you in the picture? So you can limit the search engine to find a specific number of faces. Obs: Not 100%%  accurate.\n\nLuminosity Filter\n\nThe picture was taken during the day or night, or in a dark room? Only you know it.\n\n\n\n\n\n"]];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:80.0] range:NSMakeRange(0,5)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(5,238)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18.0] range:NSMakeRange(243,9)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(252,88)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(340,14)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(355,61)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(416,16)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(433,107)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBoldItalic" size:18.0] range:NSMakeRange(540,3)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(543,49)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(592,13)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(606,160)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(766,16)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(783,117)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(900,23)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(924,129)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBoldItalic" size:18.0] range:NSMakeRange(1053,3)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(1056,23)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(1079,18)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(1098,88)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:attributedStringParagraphStyle range:NSMakeRange(416,768)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,416)];
    
    return attributedString;
}

@end
