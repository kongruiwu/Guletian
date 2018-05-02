//
//  RankViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/11.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "RankViewController.h"
#import "TeacherViewController.h"
#import "HMSegmentedControl.h"

@interface RankViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) HMSegmentedControl *segmentControl;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController];
    
    [self creatTopView];
    [self setupScrollView];
}

- (void)setupScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,Anno750(88), UI_WIDTH,self.view.mj_h-Anno750(88))];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(UI_WIDTH * 4, 0);
    self.scrollView.delegate = self;
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
    [self.view addSubview:self.scrollView];
}

- (void)creatTopView{
    self.segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, UI_WIDTH, Anno750(88))];
    self.segmentControl.sectionTitles = @[@"关注度",@"打赏次数",@"专栏点击量",@"最新入驻"];
    self.segmentControl.titleTextAttributes = @{NSFontAttributeName:kFont(30),NSForegroundColorAttributeName:UIColorFromRGB(0x333333)};
    self.segmentControl.selectedTitleTextAttributes = @{NSFontAttributeName:kFont(30),NSForegroundColorAttributeName:Color_MainBlue};
    self.segmentControl.backgroundColor = UIColorFromRGB(0xF4F8F9);
    self.segmentControl.type = HMSegmentedControlTypeText;
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.userDraggable = NO;
    self.segmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    [self.segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentControl];
}

- (void)addChildViewController{
    TeacherViewController *zhuanVC = [[TeacherViewController alloc] init];
    [self addChildViewController:zhuanVC];
    
    TeacherViewController *questVC = [[TeacherViewController alloc] init];
    [self addChildViewController:questVC];
    
    TeacherViewController *rankVC = [[TeacherViewController alloc] init];
    [self addChildViewController:rankVC];
    
    TeacherViewController *rankVC1 = [[TeacherViewController alloc] init];
    [self addChildViewController:rankVC1];
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
