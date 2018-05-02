//
//  HomeVideoViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/29.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "HomeVideoViewController.h"
#import "HomeVideoModel.h"
#import "HomeVideoSegmentView.h"
#import "SubVideoViewController.h"
#import "SubFollowViewController.h"
#import "TitleSelectViewController.h"
#import "SearchViewController.h"
@interface HomeVideoViewController ()<HomeVideoSegmentSelectDelegate,UIScrollViewDelegate>


@property (nonatomic, strong) UIScrollView * mainScroll;
@property (nonatomic, strong) NSMutableArray * viewControllers;
@property (nonatomic, strong) HomeVideoSegmentView * segmentView;
@property (nonatomic, strong) SubFollowViewController * followVC;
@property (nonatomic, strong) SubVideoViewController * homeVC;
@property (nonatomic, strong) UITextField * searchT;

@end

@implementation HomeVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchT = [self creatCommonNavSearch];
    
    [self getData];
    
}
- (void)creatUI{
    
    [self.searchT addTarget:self action:@selector(pushToSearchViewController) forControlEvents:UIControlEventEditingDidBegin];
    
    self.viewControllers = [NSMutableArray new];
    self.segmentView = [[HomeVideoSegmentView alloc]initWithFrame:CGRectMake(0, 0, UI_WIDTH, Anno750(96)) Titles:[HomeVideoModel instance].selectTitles];
    [self.segmentView.optionsButton addTarget:self action:@selector(pushToSelectTitleViewController) forControlEvents:UIControlEventTouchUpInside];
    self.segmentView.delegeate = self;
    [self.view addSubview:self.segmentView];
    float h = self.segmentView.frame.origin.y+ Anno750(96);
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, h, UI_WIDTH, UI_HEGIHT - h)];
    self.mainScroll.pagingEnabled = YES;
    self.mainScroll.delegate = self;
    
    self.homeVC = [[SubVideoViewController alloc] init];
    self.homeVC.VideoCateID = @"1";
    self.homeVC.view.frame = CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT - h);
    
    self.followVC = [[SubFollowViewController alloc]init];
    self.followVC.view.frame = CGRectMake(UI_WIDTH, 0, UI_WIDTH, UI_HEGIHT - h);
    [self addViewController];
    [self.view addSubview:self.mainScroll];
}
- (void)pushToSearchViewController{
    SearchViewController * vc = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)homeSegementSelectAtIndex:(NSInteger)index{
    [self selectViewControllerAtIndex:index isDrag:NO];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x / UI_WIDTH;
    [self selectViewControllerAtIndex:index isDrag:YES];
}
- (void)selectViewControllerAtIndex:(NSInteger)index isDrag:(BOOL)isDrag{
    if (![self.viewControllers[index] isKindOfClass:[UIViewController class]]) {
        float h = self.segmentView.frame.origin.y+ Anno750(96);
        SubVideoViewController * subVideo = [[SubVideoViewController alloc]init];
        subVideo.VideoCateID = [HomeVideoModel instance].selectTitles[index].idStr;
        subVideo.view.frame = CGRectMake(UI_WIDTH * index, 0, UI_WIDTH, UI_HEGIHT - h);
        [self.mainScroll addSubview:subVideo.view];
        [self addChildViewController:subVideo];
        [self.viewControllers addObject:subVideo];
        [self.viewControllers replaceObjectAtIndex:index withObject:subVideo];
    }
    if (isDrag) {
        [self.segmentView collectionView:self.segmentView.titleCollectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    }else{
        [UIView animateWithDuration:0.3f animations:^{
            self.mainScroll.contentOffset = CGPointMake(UI_WIDTH * index, 0);
        }];
        
    }
    
}
- (void)pushToSelectTitleViewController{
    TitleSelectViewController * titleVc = [[TitleSelectViewController alloc]init];
    __weak HomeVideoViewController * weakSelf = self;
    titleVc.callBlock = ^(VideoCateModel * model) {
        NSInteger index = [[HomeVideoModel instance].selectTitles indexOfObject:model];
        [weakSelf updateHomeUI];
        [weakSelf selectViewControllerAtIndex:index isDrag:YES];
    };
    [self.navigationController pushViewController:titleVc animated:YES];
}

- (void)updateHomeUI{
    [self.segmentView updateWithTitles:[HomeVideoModel instance].selectTitles];
    for (int i = 0; i<self.viewControllers.count; i++) {
        id viewController = self.viewControllers[i];
        if ([viewController isKindOfClass:[UIViewController class]]) {
            UIViewController * vc = (UIViewController *)viewController;
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
    }
    [self.viewControllers removeAllObjects];
    [self addViewController];
}
- (void)addViewController{
    [self.mainScroll addSubview:self.homeVC.view];
    [self addChildViewController:self.homeVC];
    [self.viewControllers addObject:self.homeVC];
    [self.mainScroll addSubview:self.followVC.view];
    [self addChildViewController:self.followVC];
    [self.viewControllers addObject:self.followVC];
    for (int i = 0; i<[HomeVideoModel instance].selectTitles.count - 2; i++) {
        [self.viewControllers addObject:@"subViewController"];
    }
    float h = self.segmentView.frame.origin.y+ Anno750(96);
    self.mainScroll.contentSize = CGSizeMake(UI_WIDTH * [HomeVideoModel instance].selectTitles.count, UI_HEGIHT - h);
}

- (void)getData{
    NSDictionary * params = @{
                              @"page":@"0",
                              @"length":@"20"
                              };
    [[NetWorkManager instance] sendReqWithParams:params urlStr:VideoType complete:^(id result) {
        NSDictionary * dic = (NSDictionary *)result;
        NSArray * array = dic[@"list"];
        NSMutableArray<VideoCateModel *> * muarr = [NSMutableArray new];
        for (int i = 0; i<array.count; i++) {
            VideoCateModel * model = [[VideoCateModel alloc]initWithDictionary:array[i]];
            [muarr addObject:model];
        }
        [[HomeVideoModel instance] updateWithArray:muarr];
        [self creatUI];
        [[HomeVideoModel instance] saveDataArrays];
    } errorBlock:^(JSError *error) {
        
    }];
}
@end
