//
//  CollectionViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectBottomView.h"
#import "CollectCell.h"
#import "CollectModel.h"

#import "UIImage+Category.h"

static NSString * CellID = @"CollectCell";

@interface CollectionViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIButton *_back;
    UIButton *_edit;
    BOOL _isEditing;
}

@property (nonatomic, strong)CollectBottomView *bottomView;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataArray;

@property (nonatomic, assign)NSInteger count;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavTitle:@"收藏"];
    [self drawBackButton];
    self.count = 0;
    _isEditing = NO;
    [self setupTableView];

    _edit = [UIButton buttonWithType:UIButtonTypeCustom];
    [_edit setTitle:@"编辑" forState:UIControlStateNormal];
    [_edit setTitle:@"取消" forState:UIControlStateSelected];
    _edit.titleLabel.font = kFont(34);
    [_edit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_edit addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightNav = [[UIBarButtonItem alloc] initWithCustomView:_edit];
    self.navigationItem.rightBarButtonItem = rightNav;
}

- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.mj_w,self.view.mj_h-Nav64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Anno750(168);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[CollectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.isShow = _isEditing;
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
    __weak typeof(self) weakSelf = self;
    cell.rsp = ^(BOOL isAll) {
        if (isAll) {
            weakSelf.count++;
            
        }else{
            weakSelf.count--;
        }
        weakSelf.bottomView.count = weakSelf.count;
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - 编辑按钮点击事件
- (void)editAction{
    _edit.selected = !_edit.selected;
    
    if (_edit.selected) {
        [self animationWith:self.bottomView withRect:CGRectMake(0, CGRectGetMaxY(self.view.bounds)-Anno750(70), UI_WIDTH, Anno750(70))];
        self.tableView.frame = CGRectMake(0, 0, self.view.mj_w,self.view.mj_h-Anno750(70));
    }else{
        [self animationWith:self.bottomView withRect:CGRectMake(0, CGRectGetMaxY(self.view.bounds), UI_WIDTH, Anno750(70))];
        self.tableView.frame = CGRectMake(0, 0, self.view.mj_w,self.view.mj_h);
        
    }
    _isEditing = _edit.selected;
    [self.tableView reloadData];
}

- (CollectBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[CollectBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.bounds), UI_WIDTH, Anno750(70))];
        __weak typeof(self) weakSelf = self;
        _bottomView.selectRsp = ^(BOOL isAll) {
            [weakSelf.dataArray enumerateObjectsUsingBlock:^(CollectModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.isSelect = isAll;
                [weakSelf.dataArray replaceObjectAtIndex:idx withObject:obj];
            }];
            [weakSelf.tableView reloadData];
            
            if (isAll) {
                weakSelf.count = weakSelf.dataArray.count;
            }else{
                weakSelf.count = 0;
            }
            weakSelf.bottomView.count = weakSelf.count;
        };
        
        [self.view addSubview:_bottomView];
    }
    return _bottomView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            CollectModel *model = [[CollectModel alloc] init];
            model.isSelect = NO;
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

#pragma mark - 点击弹出底部视图
- (void)animationWith:(UIView *)view withRect:(CGRect)rect{
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.35f];
    [view setFrame:rect];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
