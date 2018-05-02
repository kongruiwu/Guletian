//
//  QuestViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/11.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "QuestViewController.h"
#import "ConfigHeader.h"
#import "QuestionCell.h"
#import "QuestionModel.h"
#import "NewPagedFlowView.h"
#import "PGIndexBannerSubiew.h"
#import "QuizTeacherViewController.h"

static NSString * questCellID = @"QuestionCell";

@interface QuestViewController ()<UITableViewDataSource,UITableViewDelegate,NewPagedFlowViewDelegate,NewPagedFlowViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong)NSMutableArray <QuestionModel *> *dataArray;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation QuestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];
    [self createButton];
    [self setupBanner];
}

- (void)createButton{
    UIButton *quizBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    quizBtn.backgroundColor = Color_MainBlue;
    quizBtn.titleLabel.font = kFont(28);
    [quizBtn setTitle:@"去提问" forState:0];
    [quizBtn setTitleColor:[UIColor whiteColor] forState:0];
    quizBtn.layer.cornerRadius = Anno750(30);
    quizBtn.layer.masksToBounds = YES;
    quizBtn.alpha = 0.8f;
    [quizBtn addTarget:self action:@selector(quiz) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quizBtn];
    [quizBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-Anno750(30));
        make.width.equalTo(@(Anno750(200)));
        make.height.equalTo(@(Anno750(66)));
    }];
}

- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UI_WIDTH, self.view.mj_h-Nav64-Tab49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColorFromRGB(0xEEEEEE);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[QuestionCell class] forCellReuseIdentifier:questCellID];
    [self.view addSubview:self.tableView];
}

- (void)setupBanner{
    NewPagedFlowView *pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 0, UI_WIDTH,Anno750(370))];
    pageFlowView.backgroundColor = [UIColor blackColor];
    pageFlowView.delegate = self;
    pageFlowView.dataSource = self;
    pageFlowView.minimumPageAlpha = 0.1;
    pageFlowView.isCarousel = YES;
    pageFlowView.orientation = NewPagedFlowViewOrientationHorizontal;
    pageFlowView.isOpenAutoScroll = NO;
    
    //初始化pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, pageFlowView.frame.size.height - 32, UI_WIDTH, 8)];
    pageFlowView.pageControl = pageControl;
    [pageFlowView addSubview:pageControl];
    [pageFlowView reloadData];
    
    self.tableView.tableHeaderView = pageFlowView;
}

- (void)quiz{
    QuizTeacherViewController *quiz = [[QuizTeacherViewController alloc] init];
    quiz.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:quiz animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:questCellID];
    cell.model = self.dataArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionModel *model = self.dataArray[indexPath.section];
    
    return Anno750(363) + model.contentH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return Anno750(20);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(0xF5F5F5);
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    return view;
}

- (NSMutableArray<QuestionModel *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i=0; i<10 ; i++) {
            QuestionModel *model = [[QuestionModel alloc] init];
            if (i == 1) {
                model.content = @"最后时刻，一向稳重的保罗居然在最关键的时刻犯错：最后8s。";
            }else if(i == 2){
                model.content = @"火箭领先3分并握有球权";
            }else{
                model.content = @"首节比赛，哈登状态一般，可状态一般的哈登仍令森林狼感到头疼，他在外线顶着吉米-巴特勒防守强投三分命中，当他突破杀到内线吸引卡尔-安东尼-唐斯协防，他总能送出妙传，助攻克林特-卡佩拉完成空接暴扣，哈登能攻能传，这令森林狼防不胜防，锡伯杜虽然是防守大师，可他也拿不出好办法限制哈登";
            }
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

#pragma mark NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(UI_WIDTH - 60, Anno750(350));
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    
    NSLog(@"点击了第%ld张图",(long)subIndex + 1);
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView {
    
    NSLog(@"ViewController 滚动到了第%ld页",pageNumber);
}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    return self.imageArray.count;
}

- (PGIndexBannerSubiew *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    PGIndexBannerSubiew *bannerView = [flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] init];
        bannerView.tag = index;
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    //在这里下载网络图片
    //  [bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    bannerView.mainImageView.image = self.imageArray[index];
    
    return bannerView;
}

#pragma mark - 懒加载数据
- (NSMutableArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 5; i ++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Yosemite0%ld",i]];
            [self.imageArray addObject:image];
            
        }
    }
    return _imageArray;
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
