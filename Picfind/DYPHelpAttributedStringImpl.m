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
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"Hey!\n\nWith time your camera roll can become a bit bing and mess. To help you guys stop scrolling up and down, I created a search engine with some filters which can help you find what you’re for.  Here is a brief explanation about each filter:\n\nAnd more… You can create albums by using the search result and create cool matching photos albums!\n\nPeriod Filter\n\nYou can set a period which you think the picture was taken.\n\nLocation Filter\n\nBy tapping in the map, you can set a location with a distance range which you think the picture was taken. Obs: not all picture has locations attached to it.\n\nAlbum Filter\n\nIf you dont want to search your whole album, you can speed up the algorithm by setting the specific album which you think the picture you are looking for are.\n\nFavorite Filter\n\nThe picture was favorited once in the past? You can limit the search to favorite picture or not favorited pictures;\n\nNumber of faces Filter\n\nDo you know how many people were with you in the picture? So you can limit the search engine to find a specific number of faces. Obs: Not 100%%  accurate.\n\nLuminosity Filter\n\nThe picture was taken during the day or night, or in a dark room? Only you know it.\n\n\n\n\n\n"]];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:80.0] range:NSMakeRange(0,5)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(5,239)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18.0] range:NSMakeRange(244,9)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(253,91)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(344,14)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(359,61)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(420,16)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(437,107)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBoldItalic" size:18.0] range:NSMakeRange(544,3)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(547,49)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(596,13)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(610,160)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(770,16)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(787,117)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(904,23)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(928,129)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBoldItalic" size:18.0] range:NSMakeRange(1057,3)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(1060,23)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0] range:NSMakeRange(1083,18)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AvenirNext-Regular" size:18.0] range:NSMakeRange(1102,88)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:attributedStringParagraphStyle range:NSMakeRange(420,768)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,420)];
    
    return attributedString;
}

@end
