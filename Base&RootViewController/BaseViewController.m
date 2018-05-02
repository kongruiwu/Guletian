//
//  BaseViewController.m
//  KeTing
//
//  Created by 吴孔锐 on 2017/6/5.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_BackGround;
    [self creatNetErrorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (void)doBack{
    switch (self.backType) {
        case SelectorBackTypeDismiss:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case SelectorBackTypePopBack:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case SelectorBackTypePoptoRoot:
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}
- (void)creatNetErrorView{
    self.netErrorView = [[NetErrorView alloc]initWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT)];
    [self.view addSubview:self.netErrorView];
    [self.netErrorView.descButton addTarget:self action:@selector(netErrorViewClick) forControlEvents:UIControlEventTouchUpInside];
    self.netErrorView.hidden = YES;
}
- (void)netErrorViewClick{
    [self getData];
}

- (void)showNetErrorView{
    [self showNetErrorViewWithType:0];
}
- (void)showNetErrorViewWithType:(NetViewType)type{
    self.netErrorView.viewType = type;
    self.netErrorView.hidden = NO;
    [self.view bringSubviewToFront:self.netErrorView];
}
- (void)hiddenNetErrorView{
    self.netErrorView.hidden =YES;
}

- (void)setNavAlpha{
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.translucent = YES;
    UIView * clearView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UI_WIDTH, 20)];
    [self.view addSubview:clearView];
    //    导航栏变为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //    让黑线消失的方法
    self.navigationController.navigationBar.shadowImage=[UIImage new];
}

- (void)setNavUnAlpha{
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage = nil;
}
- (void)RefreshSetting{
    [self.refreshHeader setTitle:@"继续下拉" forState:MJRefreshStateIdle];
    [self.refreshHeader setTitle:@"松开就刷新" forState:MJRefreshStatePulling];
    [self.refreshHeader setTitle:@"刷新中 ..." forState:MJRefreshStateRefreshing];
    self.refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    
    [self.refreshFooter setTitle:@"" forState:MJRefreshStateIdle];
    [self.refreshFooter setTitle:@"就是要加载" forState:MJRefreshStateWillRefresh];
    [self.refreshFooter setTitle:@"加载中 ..." forState:MJRefreshStateRefreshing];
    [self.refreshFooter setTitle:@"已经全部加载完毕" forState:MJRefreshStateNoMoreData];
}
- (void)setNavTitle:(NSString *)title{
    UILabel * titleLabel = [Factory creatLabelWithText:title
                                               fontValue:font750(34)
                                               textColor:[UIColor whiteColor]
                                           textAlignment:NSTextAlignmentCenter];
    titleLabel.frame = CGRectMake(0, 0, 100, 40);
    self.navigationItem.titleView = titleLabel;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)getData{
    
}

- (void)drawBackButton{
    UIImage * img = [[UIImage imageNamed:@"nav_icon_back_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(doBack)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)creatLeftLogo{
    
    UIImage * image = [[UIImage imageNamed:@"icon-logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:image
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:nil];
    self.navigationItem.leftBarButtonItem = left;
}
- (void)creatRightNavBarItem{
    UIImage * image = [[UIImage imageNamed:@"icon-xiaoxi"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:image
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:nil];
    self.navigationItem.rightBarButtonItem = right;
}
- (UITextField *)creatNavSearchBar{
    UITextField * search = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, Anno750(512), Anno750(52))];
    search.leftViewMode = UITextFieldViewModeAlways;

    UIView * view = [Factory creatViewWithColor:[UIColor clearColor]];
    view.frame = CGRectMake(0, 0, Anno750(66), Anno750(52));
    UIImageView * img = [Factory creatImageViewWithImage:@"icon-sousuo"];
    img.frame = CGRectMake(Anno750(26), Anno750(13), Anno750(23), Anno750(25));
    [view addSubview:img];
    search.leftView = view;
    search.backgroundColor = [UIColor whiteColor];
    search.layer.masksToBounds = YES;
    search.layer.cornerRadius = Anno750(26);
    search.placeholder = @"输入你感兴趣的内容";
    search.font = [UIFont systemFontOfSize:font750(28)];
    self.navigationItem.titleView = search;
    return search;
}
- (UITextField *)creatCommonNavSearch{
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    [self creatLeftLogo];
    [self creatRightNavBarItem];
    UITextField *textf = [self creatNavSearchBar];
    return textf;
}
- (BOOL)shouldAutorotate{
    return NO;
}

@end
