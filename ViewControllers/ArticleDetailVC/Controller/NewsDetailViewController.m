//
//  NewsDetailViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "TopView.h"
#import "BottomView.h"
#import "CommentSectionView.h"
#import "TitleCell.h"
#import "SDContentCell.h"
#import "PayCell.h"

static NSString * commentHead = @"CommentSectionView";
static NSString * TitleCellID = @"TitleCell";
static NSString * ContentCellID = @"SDContentCell";
static NSString * PayCellID = @"PayCell";


@interface NewsDetailViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{
    float _h;
}


@property (nonatomic,strong)TopView *topView;
@property (nonatomic,strong)BottomView *bottomView;
@property (nonatomic,strong)UITableView *tableView;


@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _h = 0;
    [self setNavTitle:@"资讯详情"];
    [self drawBackButton];
    [self setupTopView];
    [self setupBottomView];
    [self setupTableView];
    
}

- (void)setupTableView{
    NSLog(@"%lf",self.view.mj_h);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, UI_WIDTH, self.view.mj_h-110-Nav64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[CommentSectionView class] forHeaderFooterViewReuseIdentifier:commentHead];
    [self.tableView registerClass:[TitleCell class] forCellReuseIdentifier:TitleCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SDContentCell class]) bundle:nil] forCellReuseIdentifier:ContentCellID];
    [self.tableView registerClass:[PayCell class] forCellReuseIdentifier:PayCellID];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WEAKSELF();
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:TitleCellID];
            return cell;
        }else if (indexPath.row == 1){
            SDContentCell *cell = [tableView dequeueReusableCellWithIdentifier:ContentCellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.content = @"<body>今日沪深两市股指集体双双低开，整个早盘两市均在低位维持震荡走势。午后市场情绪开始好转，在煤炭、有色、钢铁等周期性权重板块的轮番拉升下，两市逐步反弹走强，沪指成功翻红。截至发稿，沪指上涨0.17%，报收3217点；深成指上涨0.02%，报收10563点；创业板下跌0.19%，报收1835点。</body>";
            cell.rsp = ^(float h) {
                _h = h;
                [weakSelf.tableView reloadData];
            };
            return cell;
        }else{
            PayCell *cell = [tableView dequeueReusableCellWithIdentifier:PayCellID];
            return cell;
        }
    }
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return Anno750(180);
        }else if (indexPath.row == 1){
            return _h?_h+10:200;
        }else{
            return Anno750(200);
        }
    }else{
        return Anno750(100);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return Anno750(60);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CommentSectionView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:commentHead];
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (void)setupTopView{
    _topView = [TopView instance];
    [self.view addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.height.equalTo(@(60));
    }];
}

- (void)setupBottomView{
    _bottomView = [[BottomView alloc] init];
    _bottomView.textF.delegate = self;
    [self.view addSubview:_bottomView];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(@(50));
    }];
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
