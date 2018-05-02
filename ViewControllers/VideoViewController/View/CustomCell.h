//
//  CustomCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"



@interface CustomCell : UICollectionViewCell

@property (nonatomic, strong) UIButton * deleteBtn;
@property (nonatomic, strong) UILabel * titlesLab;

- (void)updateWithTitle:(NSString *)title ShowDeleteBtn:(BOOL)rec;
@end
