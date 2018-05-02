//
//  NRCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "NRCell.h"
#import "NRCollectionViewCell.h"
#import "ConfigHeader.h"

static NSString *const NRCollection = @"NRCollectionViewCell";

@interface NRCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * collection;
@property (nonatomic,strong)NSMutableArray * DataArray;

@end

@implementation NRCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = Anno750(46);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(Anno750(200), Anno750(280));
    layout.sectionInset = UIEdgeInsetsMake(0, Anno750(30), 0, Anno750(30));
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, Anno750(30), UI_WIDTH, Anno750(280)) collectionViewLayout:layout];
    _collection.backgroundColor =  UIColorFromRGB(0xF5F5F5);
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_collection];
    [_collection registerNib:[UINib nibWithNibName:NSStringFromClass([NRCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NRCollection];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NRCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NRCollection forIndexPath:indexPath];
    cell.backgroundColor =[UIColor whiteColor];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *teacherName = @"齐俊杰";
    if (self.selectBlock) {
        self.selectBlock(teacherName);
    }
}

@end
