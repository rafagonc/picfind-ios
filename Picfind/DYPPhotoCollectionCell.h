//
//  DYPPhotoCollectionCell.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSCollection.h"
#import "DYPAssetProtocol.h"

@class DYPPhotoCollectionCell;
@protocol DYPPhotoCollectionCellDelegate <NSObject>

-(void)cell:(DYPPhotoCollectionCell *)cell wantsToCheckOutPicture:(id<DYPAssetProtocol>)asset;

@end

@interface DYPPhotoCollectionCell : UITableViewCell

@property (nonatomic,strong) id<NSCollection> assets;
@property (nonatomic,weak) id<DYPPhotoCollectionCellDelegate> delegate;

@end
