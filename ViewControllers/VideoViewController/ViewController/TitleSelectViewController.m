//
//  TitleSelectViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TitleSelectViewController.h"
#import "CustomCell.h"

@interface TitleSelectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionview;
@property (nonatomic, strong) UIButton * editButton;
@property (nonatomic) BOOL isexp;

@end

@implementation TitleSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"选择频道"];
    [self drawBackButton];
    [self drawRightBarButton];
    
    [self creatUI];
}

- (void)drawRightBarButton{
    
    self.editButton = [Factory creatButtonWithTitle:@"编辑"
                                          backGroundColor:[UIColor clearColor]
                                                textColor:[UIColor whiteColor]
                                                 textSize:font750(28)];
    [self.editButton setTitle:@"取消" forState:UIControlStateSelected];
    [self.editButton addTarget:self action:@selector(changeEidtStatus:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.editButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
- (void)changeEidtStatus:(UIButton *)btn{
    btn.selected = !btn.selected;
    [self.collectionview reloadData];
}
- (void)creatUI{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setHeaderReferenceSize:CGSizeMake(UI_WIDTH, Anno750(80))];
    
    self.collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT) collectionViewLayout:layout];
    [self.collectionview registerClass:[CustomCell class] forCellWithReuseIdentifier:@"CustomCell"];
    [self.collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    self.collectionview.backgroundColor = Color_BackGround;
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc ]initWithTarget:self action:@selector(longpAction:)];
    [self.collectionview addGestureRecognizer:longP];
    [self.view addSubview:self.collectionview];
}

-(void)longpAction:(UILongPressGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:sender.view];
    //获取点击的索引
    NSIndexPath *indexPath = [self.collectionview indexPathForItemAtPoint:point];

    // 只允许第一区可移动
    if (indexPath.section != 0) {
        return;
    }

    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            if (indexPath) {
                [self.collectionview beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {//手势状态改变的时候
            [self.collectionview updateInteractiveMovementTargetPosition:point];//刷新
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self.collectionview endInteractiveMovement];
            break;
        }
        default: {
            NSLog(@"44444");
            [self.collectionview cancelInteractiveMovement];
            break;
        }
    }

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return [HomeVideoModel instance].selectTitles.count;
    }else{
        return [HomeVideoModel instance].unSelectTitles.count;
    }
}
//设置格子大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(Anno750(155), Anno750(75));

}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *Rview = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        NSString * headTitles;
        NSString * headDesc;
        if (indexPath.section == 0) {
            headTitles = @"我的频道";
            headDesc = @"点击进入频道";
        }else{
            headTitles = @"未选频道";
            headDesc = @"点击加入频道";
        }
        UICollectionReusableView *view  = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        for (UIView * subview in view.subviews) {
            [subview removeFromSuperview];
        }
        UILabel * titleLabel = [Factory creatLabelWithText:headTitles
                                                 fontValue:font750(30)
                                                 textColor:Color_DarkGray
                                             textAlignment:NSTextAlignmentLeft];
        titleLabel.tag = 1001;
        UILabel * descLabel = [Factory creatLabelWithText:headDesc
                                                fontValue:font750(25)
                                                textColor:Color_LightGray
                                            textAlignment:NSTextAlignmentRight];
        [view addSubview:titleLabel];
        [view addSubview:descLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(Anno750(24)));
            make.bottom.equalTo(@0);
        }];
        [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-Anno750(24)));
            make.centerY.equalTo(titleLabel.mas_centerY);
        }];
        Rview = view;
    }
    return Rview;

}
//设置格子上左下右间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(Anno750(24), Anno750(24), 0, Anno750(24));
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    NSString * title =indexPath.section == 0 ? [HomeVideoModel instance].selectTitles[indexPath.row].name : [HomeVideoModel instance].unSelectTitles[indexPath.row].name;
    if (indexPath.section == 0) {
        [cell updateWithTitle:title ShowDeleteBtn:self.editButton.selected];
    }else{
        [cell updateWithTitle:title ShowDeleteBtn:NO];
    }
    return cell;

}

/**
 是否可以移动
 */
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//只是在第一个中可以移动.
        return YES;
    }
    return NO;
}

/**
 拖动重排

 @param collectionView       self.collectionview
 @param sourceIndexPath      当前点击的数据源位置
 @param destinationIndexPath 移动到的目标位置
 */
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath.section == 0 && destinationIndexPath.section == 0) {
        VideoCateModel * model = [HomeVideoModel instance].selectTitles[sourceIndexPath.item];
        [[HomeVideoModel instance].selectTitles removeObject:model];
        [[HomeVideoModel instance].selectTitles insertObject:model atIndex:destinationIndexPath.item];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//点击的是第一个
        if (self.editButton.selected) {
            //相应的第一个减少.第二个增加
            VideoCateModel * model = [HomeVideoModel instance].selectTitles[indexPath.item];
            model.selected = !model.selected;
            [[HomeVideoModel instance].unSelectTitles insertObject:model atIndex:0];
            [[HomeVideoModel instance].selectTitles removeObjectAtIndex:indexPath.item];
            
            [self.collectionview moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        }else{
            [[HomeVideoModel instance] saveDataArrays];
            self.callBlock([HomeVideoModel instance].selectTitles[indexPath.item]);
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        VideoCateModel * model = [HomeVideoModel instance].unSelectTitles[indexPath.item];
        model.selected = !model.selected;
        [[HomeVideoModel instance].selectTitles addObject:model];
        [[HomeVideoModel instance].unSelectTitles removeObjectAtIndex:indexPath.item];
        [self.collectionview moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:[HomeVideoModel instance].selectTitles.count - 1 inSection:0]];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionview reloadData];
    });
}

- (void)doBack{
    [[HomeVideoModel instance] saveDataArrays];
    [super doBack];
}

@end
