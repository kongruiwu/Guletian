//
//  HomeVideoSegmentView.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HMSegmentedControl.h>
#import "ConfigHeader.h"
#import "SubTitleCollectionCell.h"
#import "HomeVideoModel.h"

@protocol HomeVideoSegmentSelectDelegate<NSObject>

- (void)homeSegementSelectAtIndex:(NSInteger)index;


@end

@interface HomeVideoSegmentView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) HMSegmentedControl * segmentControl;
@property (nonatomic, strong) UIButton * optionsButton;
@property (nonatomic, strong) UIImageView * optionImg;
@property (nonatomic, strong) UIView * shadowView;
@property (nonatomic, strong) UICollectionView * titleCollectionView;
@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, assign) NSInteger selectRow;
@property (nonatomic, assign) id<HomeVideoSegmentSelectDelegate> delegeate;

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)updateWithTitles:(NSArray *)array;
@end
