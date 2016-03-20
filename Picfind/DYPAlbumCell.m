//
//  DYPAlbumCell.m
//  Picfind
//
//  Created by Rafael Gonzalves on 3/19/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPAlbumCell.h"
#import "UIColor+DYP.h"

@interface DYPAlbumCell ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;


@end

@implementation DYPAlbumCell

#pragma mark - constructors
-(instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.tintColor = [UIColor dyp_redColor];
    } return self;
}

#pragma mark - setters
-(void)setCollection:(id<DYPCollectionProtocol>)collection {
    _collection = collection;
    [self.nameLabel setText:[collection name]];
    [self.collection thumbnail:^(UIImage *image) {
        [self.thumbnailImageView setImage:image];
    }];
}
-(void)setChoosed:(BOOL)choosed {
    _choosed = choosed;
    self.accessoryType = choosed ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

@end
