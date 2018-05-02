//
//  VersionViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VersionViewController.h"

@interface VersionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *version;

@end

@implementation VersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavTitle:@"关于我们"];
    [self drawBackButton];
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *infoVersion = infoDict[@"CFBundleShortVersionString"];
    self.version.text = [NSString stringWithFormat:@"当前版本号V%@",infoVersion];
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
