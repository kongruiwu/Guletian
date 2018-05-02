//
//  PersonalCenterVC.m
//  SGPageViewExample
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "PersonalCenterVC.h"
#import "PersonalCenterTableView.h"
#import "SGPagingView.h"
#import "UIView+SGPagingView.h"
#import "TeacherView.h"
#import "ConfigHeader.h"

#import "TeacherVideoViewController.h"
#import "TeaArticleViewController.h"
#import "TeaQuestionVC.h"

@interface PersonalCenterVC () <UITableViewDelegate, UITableViewDataSource, SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@property (nonatomic, strong) PersonalCenterTableView *tableView;
@property (nonatomic, strong) TeacherView *topView;
@property (nonatomic, strong) UIScrollView *childVCScrollView;

@end

@implementation PersonalCenterVC

static CGFloat const PersonalCenterVCPageTitleViewHeight = 35;
static CGFloat const PersonalCenterVCTopViewHeight = 200;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavTitle:self.teacherName];
    [self drawBackButton];
    [self foundTableView];
}

- (void)foundTableView {
    CGFloat tableViewX = 0;
    CGFloat tableViewW = self.view.frame.size.width;
    CGFloat tableViewH = self.view.frame.size.height;
    self.tableView = [[PersonalCenterTableView alloc] initWithFrame:CGRectMake(tableViewX, 0, tableViewW, tableViewH) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tableView.tableHeaderView = self.topView;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.sectionHeaderHeight = PersonalCenterVCPageTitleViewHeight;
    _tableView.rowHeight = self.view.frame.size.height - PersonalCenterVCPageTitleViewHeight;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}

- (TeacherView *)topView{
    if (!_topView) {
        _topView = [[TeacherView alloc] initWithFrame:CGRectMake(0, 0, 0, PersonalCenterVCTopViewHeight)];
    }
    return _topView;
}

- (SGPageTitleView *)pageTitleView {
    if (!_pageTitleView) {
        NSArray *titleArr = @[@"视频",@"文章",@"问答",@"跟投"];
        SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
        configure.bottomSeparatorColor = UIColorFromRGB(0xE6E2E3);
        configure.titleFont = kFont(28);
        configure.titleSelectedFont = kFont(28);
        configure.titleColor = UIColorFromRGB(0x666666);
        configure.titleSelectedColor = UIColorFromRGB(0x333333);
        configure.indicatorHeight = 2;
        configure.indicatorColor = Color_MainBlue;

        /// pageTitleView
        _pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, PersonalCenterVCPageTitleViewHeight) delegate:self titleNames:titleArr configure:configure];
        _pageTitleView.backgroundColor = [UIColor whiteColor];
    }
    return _pageTitleView;
}

- (SGPageContentView *)pageContentView {
    __weak typeof(self)wSelf = self;
    
    if (!_pageContentView) {
        TeacherVideoViewController *oneVC = [[TeacherVideoViewController alloc] init];
        oneVC.rsp = ^(UIScrollView *scrollView) {
            [wSelf personalCenterChildBaseVCScrollViewDidScroll:scrollView];
        };
        
        TeaArticleViewController *twoVC = [[TeaArticleViewController alloc] init];
        twoVC.rsp = ^(UIScrollView *scrollView) {
            [wSelf personalCenterChildBaseVCScrollViewDidScroll:scrollView];
        };
        
        TeaQuestionVC *threeVC = [[TeaQuestionVC alloc] init];
        threeVC.rsp = ^(UIScrollView *scrollView) {
            [wSelf personalCenterChildBaseVCScrollViewDidScroll:scrollView];
        };
        
        TeaArticleViewController *twoVC2 = [[TeaArticleViewController alloc] init];
        twoVC2.rsp = ^(UIScrollView *scrollView) {
            [wSelf personalCenterChildBaseVCScrollViewDidScroll:scrollView];
        };
        
        
        NSArray *array = @[oneVC,twoVC,threeVC,twoVC2];
        CGFloat contentViewHeight = self.view.frame.size.height - 35;
        _pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:array];
        _pageContentView.delegatePageContentView = self;
    }
    return _pageContentView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.childVCScrollView && _childVCScrollView.contentOffset.y > 0) {
        self.tableView.contentOffset = CGPointMake(0, PersonalCenterVCTopViewHeight);
    }
}

- (void)personalCenterChildBaseVCScrollViewDidScroll:(UIScrollView *)scrollView {
    self.childVCScrollView = scrollView;
    if (self.tableView.contentOffset.y < PersonalCenterVCTopViewHeight) {
        scrollView.contentOffset = CGPointZero;
    } else {
        self.tableView.contentOffset = CGPointMake(0, PersonalCenterVCTopViewHeight);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.contentView addSubview:self.pageContentView];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.pageTitleView;
}

#pragma mark - - - SGPageTitleViewDelegate - SGPageContentViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageContentViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    _tableView.scrollEnabled = NO;
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView offsetX:(CGFloat)offsetX {
    _tableView.scrollEnabled = YES;
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
