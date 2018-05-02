//
//  SubTitleCollectionCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
@interface SubTitleCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel * nameLabel;

- (void)updateWithTitle:(NSString *)title Selected:(BOOL)rec;

@end
