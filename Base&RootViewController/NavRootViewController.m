//
//  NavRootViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/11.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "NavRootViewController.h"

@interface NavRootViewController ()

@end

@implementation NavRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

@end
