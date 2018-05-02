//
//  SettingViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"

#import "VersionViewController.h"
#import "ChangePsdViewController.h"
#import "UIView+Layer.h"
#import "ConfigHeader.h"
#import "LoginViewController.h"


static NSString * CellID = @"SettingCell";

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)UIButton *loginOut;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavTitle:@"设置中心"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawBackButton];
    [self setupTableView];
    BOOL isLogin = [YDConfigurationHelper getBoolValueForConfigurationKey:kLogin];
    if (isLogin) {
        [self setupLoginOut];
    }
}

- (void)setupLoginOut{
    _loginOut = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_loginOut setLayerCornerRadius:4.0f borderWidth:1.0f borderColor:Color_MainBlue];
    [_loginOut setTitleColor:Color_MainBlue forState:UIControlStateNormal];
    _loginOut.titleLabel.font = kFont(28);
    [_loginOut setTitle:@"退出登录" forState:UIControlStateNormal];
    [_loginOut addTarget:self action:@selector(loginout) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_loginOut];
    
    [_loginOut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(Anno750(30));
        make.right.equalTo(self.view.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(88)));
        make.top.equalTo(self.tableView.mas_bottom).offset(Anno750(80));
    }];
}

- (void)loginout{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出登录" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSDictionary *params = @{
                                 @"token":[YDConfigurationHelper getStringValueForConfigurationKey:kToken]
                                 };
        [[NetWorkManager instance] sendReqWithParams:params urlStr:Logout complete:^(id result) {
            
        } errorBlock:^(JSError *error) {
            
        }];
        [[UserInfoManage sharedManager] didLoginOut];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:action];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - getter method
- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.mj_w,Anno750(300)) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Anno750(96);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    [cell updateUI:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSLog(@"意见反馈");
    }else if (indexPath.row == 1){
        BOOL isLogin = [YDConfigurationHelper getBoolValueForConfigurationKey:kLogin];
        if (isLogin) {
            ChangePsdViewController *changeVC = [[ChangePsdViewController alloc] init];
            changeVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:changeVC animated:YES];
        }else{
            UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
            [self presentViewController:loginNav animated:YES completion:nil];
        }
    }else if (indexPath.row == 2){
        VersionViewController *versionVC = [[VersionViewController alloc] init];
        versionVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:versionVC animated:YES];
    }
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
