//
//  LoginViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/9.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FindPsdViewController.h"
#import "UserModel.h"
#import "ConfigHeader.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma  mark - 显示导航栏
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,UI_WIDTH, StaBarH)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBarView];
    [self setNavAlpha];
    
}

#pragma mark - 账号登录
- (IBAction)loginAccount:(id)sender {
    NSDictionary *params = @{
                            @"username":self.phone.text,
                            @"password":self.password.text
                            };
    [[NetWorkManager instance] sendReqWithParams:params urlStr:UserLogin complete:^(id result) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            [YDConfigurationHelper setStringValueForConfigurationKey:kToken withValue:result[@"token"]];
            [YDConfigurationHelper setBoolValueForConfigurationKey:kLogin withValue:YES];
            NSString *uidStr = [NSString stringWithFormat:@"%@",result[@"uid"]];
            [self requestInfomation:uidStr];
        }
    } errorBlock:^(JSError *error) {
        [YDConfigurationHelper setBoolValueForConfigurationKey:kLogin withValue:NO];
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:error.message duration:2.0];
    }];
}

- (void)requestInfomation:(NSString *)uid{
    NSDictionary *params = @{
                             @"uid":uid
                             };
    [[NetWorkManager instance] sendReqWithParams:params urlStr:UserInfo complete:^(id result) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            UserModel *userModel = [UserModel mj_objectWithKeyValues:result];
            if ([userModel archive]) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"获取用户信息失败" duration:2.0];
            }
        }
    } errorBlock:^(JSError *error) {
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:error.message duration:2.0];
    }];
}

- (IBAction)dismissViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)pushRegister:(id)sender {
    RegisterViewController *regiVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:regiVC animated:YES];
}
- (IBAction)forgetSecret:(id)sender {
    FindPsdViewController *findPsd = [[FindPsdViewController alloc] init];
    [self.navigationController pushViewController:findPsd animated:YES];
}
- (IBAction)weixinLogin:(id)sender {
    NSLog(@"微信登录");
}
- (IBAction)qqLogin:(id)sender {
    NSLog(@"QQ登录");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.phone resignFirstResponder];
    [self.password resignFirstResponder];
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
