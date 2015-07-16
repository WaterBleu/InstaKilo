//
//  InstaKiloCollectionViewCell.m
//  InstaKilo
//
//  Created by Jeff Huang on 2015-07-16.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import "InstaKiloCollectionViewCell.h"
#import "InstaKilo.h"

@interface InstaKiloCollectionViewCell()

@property(nonatomic, weak) InstaKilo *instaKilo;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation InstaKiloCollectionViewCell

- (void)setCell:(InstaKilo*)obj withSegIndex:(NSInteger)segIndex{
    self.image.image = obj.image;
}

@end
