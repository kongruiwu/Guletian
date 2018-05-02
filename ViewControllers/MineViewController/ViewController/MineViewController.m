//
//  MineViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/29.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "MineViewController.h"
#import "LoginCell.h"
#import "MineCell.h"

#import "LoginViewController.h"

#import "CollectionViewController.h"
#import "AttentionViewController.h"
#import "OrderViewController.h"
#import "InformationViewController.h"
#import "SettingViewController.h"
#import "UserInfoViewController.h"

static NSString * CellID1 = @"LoginCell";
static NSString * CellID2 = @"MineCell";

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MineViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.tableView reloadData];
}

#pragma  mark - 显示导航栏
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0,UI_WIDTH, StaBarH)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBarView];
    
    [self.view addSubview:self.tableView];
}


#pragma mark - getter method
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, StaBarH, UI_WIDTH, UI_HEGIHT-StaBarH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *header  = [[UIView alloc] init];
    header.backgroundColor = Color_BackGround;
    return header;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return Anno750(260);
    }
    return Anno750(106);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 0.01;
    }
    return Anno750(20);
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else if (section == 1){
        return 3;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID1];
        if (!cell) {
            cell = [[LoginCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID1];
        }
        [cell updateUI];
        __weak typeof(self) weakSelf = self;
        cell.rsp = ^{
            BOOL isLogin = [YDConfigurationHelper getBoolValueForConfigurationKey:kLogin];
            if (isLogin) {
                //已登录
                UserInfoViewController *collectVC = [[UserInfoViewController alloc] init];
                collectVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:collectVC animated:YES];
            }else{
                //未登录
                [weakSelf presentLoginViewController];
            }
        };
        return cell;
    }else{
        MineCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID2];
        if (!cell) {
            cell = [[MineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID2];
        }
        [cell updateUI:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1){
        BOOL isLogin = [YDConfigurationHelper getBoolValueForConfigurationKey:kLogin];
        if (isLogin) {
            if (indexPath.row == 0) {
                CollectionViewController *collectVC = [[CollectionViewController alloc] init];
                collectVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectVC animated:YES];
            }else if (indexPath.row == 1){
                AttentionViewController *attentionVC = [[AttentionViewController alloc] init];
                attentionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:attentionVC animated:YES];
            }else if (indexPath.row == 2){
                OrderViewController *orderVC = [[OrderViewController alloc] init];
                orderVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:orderVC animated:YES];
            }
        }else{
            [self presentLoginViewController];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            InformationViewController *informationVC = [[InformationViewController alloc] init];
            informationVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:informationVC animated:YES];
        }else if (indexPath.row == 1){
            SettingViewController *settingVC = [[SettingViewController alloc] init];
            settingVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:settingVC animated:YES];
        }
    }
}

#pragma mark -- private  进入登录页面
- (void)presentLoginViewController{
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
    [self presentViewController:loginNav animated:YES completion:nil];
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
