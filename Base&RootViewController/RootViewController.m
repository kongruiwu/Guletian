//
//  RootViewController.m
//  NFL
//
//  Created by 吴孔锐 on 2017/7/4.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "RootViewController.h"
#import "NavRootViewController.h"
#import "HomeVideoViewController.h"
#import "WatchGrailViewController.h"
#import "SecrestsViewController.h"
#import "QuotationViewController.h"
#import "MineViewController.h"
#import "ConfigHeader.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];

}
- (void)creatUI{
    NSArray * titles = @[@"视频",@"盯盘",@"干货",@"自选",@"我的"];
    NSArray * images = @[@"",@"",@"",@"",@""];
    NSArray * selImg = @[@"",@"",@"",@"",@""];
    
    HomeVideoViewController * home = [[HomeVideoViewController alloc]init];
    WatchGrailViewController * watch = [[WatchGrailViewController alloc]init];
    SecrestsViewController * secrest = [[SecrestsViewController alloc]init];
    QuotationViewController * quotation = [[QuotationViewController alloc]init];
    MineViewController * mine = [[MineViewController alloc]init];
    
    NavRootViewController * nav_home = [[NavRootViewController alloc]initWithRootViewController:home];
    NavRootViewController * nav_watch = [[NavRootViewController alloc]initWithRootViewController:watch];
    NavRootViewController * nav_secrest = [[NavRootViewController alloc]initWithRootViewController:secrest];
    NavRootViewController * nav_quotation = [[NavRootViewController alloc]initWithRootViewController:quotation];
    NavRootViewController * nav_mine = [[NavRootViewController alloc]initWithRootViewController:mine];
    self.viewControllers = @[nav_home,nav_watch,nav_secrest,nav_quotation,nav_mine];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:Color_MainBlue, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    for (int i = 0; i<self.viewControllers.count; i++) {
        UINavigationController * nav = self.viewControllers[i];
        nav.title = titles[i];
        nav.tabBarItem.image = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selImg[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
}
- (BOOL)shouldAutorotate{
    return self.selectedViewController.shouldAutorotate;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}


@end
