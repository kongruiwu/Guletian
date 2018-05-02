//
//  FindPsdViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/9.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "FindPsdViewController.h"
#import "SettingPsdViewController.h"
#import "ConfigHeader.h"
#import "NSString+Addition.h"
#import "UILabel+CountDown.h"

@interface FindPsdViewController (){
    NSString *_send_token;
    NSString *_hash;
    NSString *_send_time;
}
@property (weak, nonatomic) IBOutlet UIImageView *phone;
@property (weak, nonatomic) IBOutlet UITextField *authCode;
@property (weak, nonatomic) IBOutlet UILabel *countDown;
@property (weak, nonatomic) IBOutlet UITextField *phoneTexf;

@end

@implementation FindPsdViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,UI_WIDTH, StaBarH)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBarView];
    
    self.countDown.userInteractionEnabled = YES;
    self.countDown.textColor  = UIColorFromRGB(0x999999);
    [self.countDown addActionWithTarget:self action:@selector(startCountDown)];
}

#pragma mark - 发送验证码
- (void)startCountDown {
    if (![self.phoneTexf.text isPhoneNumber] || [self.phoneTexf.text isBlank]) {
        return;
    }
    
    NSDictionary *params = @{
                             @"mobile":self.phoneTexf.text,
                             @"type":@2
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

- (IBAction)nextStep:(id)sender {
    if (![self.phoneTexf.text isPhoneNumber] || [self.authCode.text isBlank]) {
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"请输入正确的号码" duration:2.0];
    }else{
        NSString *str = [NSString stringWithFormat:@"%@%@111111",self.authCode.text,_send_time];
        NSString *md5Str = [str md5Encrypt];
        if ([md5Str isEqualToString:[_hash lowercaseString]]) {
            SettingPsdViewController *setPsd = [[SettingPsdViewController alloc] init];
            setPsd.send_token = _send_token;
            setPsd.code = self.authCode.text;
            setPsd.phone = self.phoneTexf.text;
            [self.navigationController pushViewController:setPsd animated:YES];
        }else{
            [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"验证码错误" duration:2.0];
        }
    }
}

- (IBAction)popBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.phone resignFirstResponder];
    [self.authCode resignFirstResponder];
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
