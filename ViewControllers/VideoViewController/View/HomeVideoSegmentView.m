//
//  HomeVideoSegmentView.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "HomeVideoSegmentView.h"

@implementation HomeVideoSegmentView

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        [self createUIWithTitles:titles];
    }
    return self;
}
- (void)createUIWithTitles:(NSArray *)titles{
    
    self.selectRow = 0;
    
    float height = self.frame.size.height;
    
    self.backgroundColor = [UIColor blackColor];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = Anno750(35);
    
    self.titleCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(Anno750(24), 0, UI_WIDTH -Anno750(84) , height) collectionViewLayout:layout];
    self.titleCollectionView.delegate = self;
    self.titleCollectionView.dataSource = self;

    [self.titleCollectionView registerClass:[SubTitleCollectionCell class] forCellWithReuseIdentifier:@"SubTitleCollectionCell"];
    
    [self addSubview:self.titleCollectionView];

    
    self.optionImg = [Factory creatImageViewWithImage:@"icon-caidan"];
    [self addSubview:self.optionImg];
    [self.optionImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(Anno750(-24)));
        make.centerY.equalTo(@0);
    }];
    
    self.shadowView = [Factory creatViewWithColor:[UIColor clearColor]];
    [self addSubview:self.shadowView];
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.optionImg.mas_left);
        make.width.equalTo(@(Anno750(60)));
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    
    CAGradientLayer * layer = [CAGradientLayer layer];
    layer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
    layer.locations = @[@0,@1];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    layer.frame = CGRectMake(0, 0,Anno750(60) ,height);
    [self.shadowView.layer addSublayer:layer];
    
    self.optionsButton = [Factory creatButtonWithNormalImage:@"" selectImage:@""];
    [self addSubview:self.optionsButton];
    [self.optionsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView.mas_left);
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}
//设置每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    VideoCateModel * model = self.titles[indexPath.row];
    CGSize textSize = [Factory getSize:model.name maxSize:CGSizeMake(UI_WIDTH, 99999) font:[UIFont systemFontOfSize:font750(28)]];
    return CGSizeMake(textSize.width + Anno750(10), Anno750(96));
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VideoCateModel * model = self.titles[indexPath.row];
    SubTitleCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SubTitleCollectionCell" forIndexPath:indexPath];
    [cell updateWithTitle:model.name Selected:(self.selectRow == indexPath.row)];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectRow = indexPath.row;
    [self.titleCollectionView reloadData];
    [self.titleCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:YES];
    if ([self.delegeate respondsToSelector:@selector(homeSegementSelectAtIndex:)]) {
        [self.delegeate homeSegementSelectAtIndex:indexPath.row];
    }
}

- (void)updateWithTitles:(NSArray *)array{
    self.titles = array;
    [self.titleCollectionView reloadData];
}
@end
