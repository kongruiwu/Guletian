//
//  RegisterViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/9.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "RegisterViewController.h"
#import "NSString+Addition.h"
#import "ConfigHeader.h"
#import "UILabel+CountDown.h"

@interface RegisterViewController (){
    NSString *_send_token;
    NSString *_hash;
    NSString *_send_time;
}
@property (weak, nonatomic) IBOutlet UILabel *countDown;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *authCode;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma  mark - 显示导航栏
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,UI_WIDTH, StaBarH)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBarView];
    self.countDown.userInteractionEnabled = YES;
    [self.countDown addActionWithTarget:self action:@selector(startCountDown)];
}
- (IBAction)agreement:(id)sender {
    
}

- (IBAction)registerOK:(id)sender {
    if (![self.phone.text isPhoneNumber] || [self.authCode.text isBlank]) {
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"请输入存在错误" duration:2.0];
    }else{
        WEAKSELF();
        NSString *str = [NSString stringWithFormat:@"%@%@111111",self.authCode.text,_send_time];
        NSString *md5Str = [str md5Encrypt];
        if ([md5Str isEqualToString:[_hash lowercaseString]]) {
            NSDictionary *params = @{
                                     @"username":self.phone.text,
                                     @"smscode":self.authCode.text,
                                     @"password":self.password.text,
                                     @"send_token":_send_token
                                     };
            [[NetWorkManager instance] sendReqWithParams:params urlStr:UserRegist complete:^(id result) {
                
                [ToastView presentModalToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"注册成功" duration:2.0 completion:^{
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }];
            } errorBlock:^(JSError *error) {
                [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:error.message duration:2.0];
            }];
        }else{
            [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"验证码错误" duration:2.0];
        }
    }
}

#pragma mark - 发送验证码
- (void)startCountDown {
    if (![self.phone.text isPhoneNumber] || [self.phone.text isBlank]) {
        return;
    }
    NSDictionary *params = @{
                             @"mobile":self.phone.text,
                             @"type":@1
                             };
    [[NetWorkManager instance] sendReqWithParams:params urlStr:SMSSend complete:^(id result) {
        [self.countDown startWithTime:59 title:@"发送验证码" countDownTitle:@"重新获取" mainColor:[UIColor clearColor] countColor:[UIColor clearColor]];
        if ([result isKindOfClass:[NSDictionary class]]) {
            _send_token = result[@"send_token"];
            _hash       = result[@"hash"];
            _send_time  = result[@"send_time"];
        }
    } errorBlock:^(JSError *error) {
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:error.message duration:2.0];
    }];
}

- (IBAction)backPop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.phone resignFirstResponder];
    [self.authCode resignFirstResponder];
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
