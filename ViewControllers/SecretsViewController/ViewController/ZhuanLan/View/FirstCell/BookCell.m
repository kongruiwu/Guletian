//
//  BookCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BookCell.h"
#import "BookCollectionViewCell.h"
#import "ConfigHeader.h"
static NSString *const bookCollection = @"BookCollectionViewCell";

@interface BookCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * collection;
@property (nonatomic,strong)NSMutableArray * DataArray;

@end

@implementation BookCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = Anno750(64);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(Anno750(188), Anno750(320));
    layout.sectionInset = UIEdgeInsetsMake(0, Anno750(30), 0, Anno750(30));
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, Anno750(15), UI_WIDTH, Anno750(320)) collectionViewLayout:layout];
    _collection.backgroundColor =[UIColor whiteColor];
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_collection];
    [_collection registerNib:[UINib nibWithNibName:NSStringFromClass([BookCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:bookCollection];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BookCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:bookCollection forIndexPath:indexPath];
    cell.backgroundColor =[UIColor whiteColor];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rsp) {
        self.rsp();
    }
}

@end
