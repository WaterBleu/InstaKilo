//
//  InstaKiloCollectionViewCell.h
//  InstaKilo
//
//  Created by Jeff Huang on 2015-07-16.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InstaKilo;
@interface InstaKiloCollectionViewCell : UICollectionViewCell

-  (void)setCell:(InstaKilo*)obj withSegIndex:(NSInteger)segIndex;

@end
