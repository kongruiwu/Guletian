//
//  InformationViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "InformationViewController.h"
#import "OfficialViewController.h"
#import "SysInfoViewController.h"
#import "ConfigHeader.h"



@interface InformationViewController ()<UIScrollViewDelegate>

/** 选中按钮  */
@property(nonatomic,weak)UIButton * selectBtn;
/** 内容ScrollView  */
@property(nonatomic,weak)UIScrollView * contentView;

@property(nonatomic,weak)UIView * titleView;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavTitle:@"消息通知"];
    [self drawBackButton];
    
    SysInfoViewController *oneVC = [[SysInfoViewController alloc] init];
    [self addChildViewController:oneVC];
    
    OfficialViewController *twoVC = [[OfficialViewController alloc] init];
    [self addChildViewController:twoVC];
    
    [self setupTitle];
    
    [self setupScrollView];
}

- (void)setupScrollView{
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = CGRectMake(0, Anno750(88), UI_WIDTH, UI_HEGIHT-Nav64-Anno750(88));
    contentView.contentSize = CGSizeMake(self.childViewControllers.count*contentView.mj_w, 0);
    contentView.delegate = self;
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    self.contentView = contentView;
    [self scrollViewDidEndScrollingAnimation:contentView];
}

- (void)setupTitle {
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,UI_WIDTH, Anno750(88))];
    titleView.backgroundColor = UIColorFromRGB(0xF5F8F9);
    [self.view addSubview:titleView];
    self.titleView = titleView;

    NSArray *title_arr = @[@"系统消息", @"官方消息"];
    NSInteger indext = title_arr.count;
    CGFloat titleW = (UI_WIDTH-Anno750(200))/2;
    CGFloat titleH = Anno750(88);
    CGFloat originX = Anno750(100);
    CGFloat originY = 0;
    for (int i = 0; i<indext; i++) {
        CGFloat titleX = originX  + (titleW + originX) * i;
        UIButton * title = [UIButton buttonWithType:UIButtonTypeCustom];
        title.frame = CGRectMake(titleX, originY, titleW, titleH);
        title.tag = i;
        [title setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [title setTitleColor:UIColorFromRGB(0x1482f0) forState:UIControlStateDisabled];
        title.titleLabel.font = kFont(30);
        [title addTarget:self action:@selector(titleSelect:) forControlEvents:UIControlEventTouchUpInside];
        [title setTitle:title_arr[i] forState:UIControlStateNormal];
        [titleView addSubview:title];
        
        if (i == 0) {
            [title layoutIfNeeded];
            [self titleSelect:title];
        }
    }
}

- (void)titleSelect:(UIButton *)button{
    self.selectBtn.enabled = YES;
    button.enabled = NO;
    self.selectBtn = button;
    
    //滚动我的contentView
    CGPoint offset = self.contentView.contentOffset;
    NSInteger index = button.tag;
    offset.x = index * self.contentView.mj_w;
    [self.contentView setContentOffset:offset animated:YES];
}

/*
 * 滚动动画完毕调用(人为拖拽不会调用)
 * 创建自控制器的View
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //获取当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.mj_w;
    //根据角标取出我们的子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.mj_x = scrollView.contentOffset.x;
    vc.view.mj_h = scrollView.mj_h;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //点击对应按钮
    //取出对应的角标
    NSInteger index = scrollView.contentOffset.x / scrollView.mj_w;
    UIButton *button = self.titleView.subviews[index];
    [self titleSelect:button];
//    self.view.mj_h = scrollView.mj_h;
    [self scrollViewDidEndScrollingAnimation:scrollView];
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
