//
//  SecrestsViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/29.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SecrestsViewController.h"
#import "HMSegmentedControl.h"
#import "ZhuanViewController.h"
#import "QuestViewController.h"
#import "RankViewController.h"

@interface SecrestsViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation SecrestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self addChildViewController];
    
    [self creatLeftLogo];
    [self creatRight];
    [self setupScrollView];
}

- (void)addChildViewController{
    ZhuanViewController *zhuanVC = [[ZhuanViewController alloc] init];
    [self addChildViewController:zhuanVC];
    
    QuestViewController *questVC = [[QuestViewController alloc] init];
    [self addChildViewController:questVC];
    
    RankViewController *rankVC = [[RankViewController alloc] init];
    [self addChildViewController:rankVC];
}

- (void)creatLeftLogo{
    UIImage * image = [[UIImage imageNamed:@"dry_logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:image
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:nil];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)creatRight{
    self.segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, StaBarH, 160, 40)];
    self.segmentControl.sectionTitles = @[@"专栏",@"问答",@"牛人榜"];
    self.segmentControl.titleTextAttributes = @{NSFontAttributeName:kFont(28),NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.segmentControl.selectedTitleTextAttributes = @{NSFontAttributeName:kFont(32),NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.segmentControl.backgroundColor = [UIColor clearColor];
    self.segmentControl.selectionIndicatorColor = [UIColor whiteColor];
    self.segmentControl.type = HMSegmentedControlTypeText;
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.selectionIndicatorHeight = 2;
    self.segmentControl.userDraggable = NO;
    self.segmentControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -5, 0);
    self.segmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    [self.segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithCustomView:self.segmentControl];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void)setupScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT-Nav64-Tab49)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(UI_WIDTH * 3, 0);
    self.scrollView.delegate = self;
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
    [self.view addSubview:self.scrollView];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSInteger index = segmentedControl.selectedSegmentIndex;
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = index * self.scrollView.mj_w;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - UIScrollViewDelegate
//人为拖拽不会调用
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    //获取当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.mj_w;
    //根据角标取出我们的子控制器
    UIViewController * vc = self.childViewControllers[index];
    vc.view.mj_x = scrollView.contentOffset.x;
    vc.view.mj_h = scrollView.mj_h;
    //添加View
    [scrollView addSubview:vc.view];
}

//用户拖拽结束调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.mj_w;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    [self.segmentControl setSelectedSegmentIndex:page animated:YES];
    //主动调用滚动完毕的方法
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
