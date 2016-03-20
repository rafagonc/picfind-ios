//
//  DYPAlbumCell.h
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPCollectionProtocol.h"

@interface DYPAlbumCell : UITableViewCell

@property (nonatomic,weak) id<DYPCollectionProtocol> collection;
@property (nonatomic,assign) BOOL choosed;

@end
