//
//  ZhuanViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/11.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "ZhuanViewController.h"
#import "SectionHeadView.h"
#import "BookCell.h"
#import "NRCell.h"
#import "RecommendCell.h"
#import "NewPagedFlowView.h"
#import "PGIndexBannerSubiew.h"
#import "NewsListViewController.h"
#import "RecListViewController.h"
#import "PersonalCenterVC.h"
#import "NewsDetailViewController.h"

static NSString * sectionHead = @"SectionHeadView";
static NSString * bookCell = @"BookCell";
static NSString * NRCellID = @"NRCell";
static NSString * RecCellID = @"RecommendCell";

@interface ZhuanViewController ()<UITableViewDelegate,UITableViewDataSource,NewPagedFlowViewDelegate,NewPagedFlowViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation ZhuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];
    [self setupBanner];
}

- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UI_WIDTH, self.view.mj_h-Nav64-Tab49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColorFromRGB(0xEEEEEE);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[SectionHeadView class] forHeaderFooterViewReuseIdentifier:sectionHead];
    [self.tableView registerClass:[BookCell class] forCellReuseIdentifier:bookCell];
    [self.tableView registerClass:[NRCell class] forCellReuseIdentifier:NRCellID];
    [self.tableView registerClass:[RecommendCell class] forCellReuseIdentifier:RecCellID];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 1;
    }
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf  = self;
    if (indexPath.section == 0) {
        BookCell *cell = [tableView dequeueReusableCellWithIdentifier:bookCell];
        cell.rsp = ^{
            NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc] init];
            newsDetailVC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:newsDetailVC animated:YES];
        };
        return cell;
    }else if (indexPath.section == 1){
        NRCell *cell = [tableView dequeueReusableCellWithIdentifier:NRCellID];
        cell.selectBlock = ^(NSString *teacherName) {
            PersonalCenterVC *teacherCenter = [[PersonalCenterVC alloc] init];
            teacherCenter.teacherName = teacherName;
            teacherCenter.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:teacherCenter animated:YES];
        };
        return cell;
    }
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:RecCellID];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return Anno750(350);
    }else if (indexPath.section == 1){
        return Anno750(340);
    }
    return Anno750(160);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Anno750(90);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return 0 ;
    }
    return Anno750(20);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __weak typeof(self) weakSelf = self;
    SectionHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionHead];
    headView.section = section;
    headView.rspBlock = ^(NSInteger section) {
        switch (section) {
            case 0:
            {
                NewsListViewController *newsListVC = [[NewsListViewController alloc] init];
                newsListVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:newsListVC animated:YES];
            }
                break;
            case 2:
            {
                RecListViewController *listVC = [[RecListViewController alloc] init];
                listVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:listVC animated:YES];
                
            }
                break;
            case 3:
            {
                RecListViewController *listVC = [[RecListViewController alloc] init];
                listVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:listVC animated:YES];
            }
                break;
            default:
                break;
        }
    };
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(0xF5F5F5);
    return view;
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
