//
//  SettingPsdViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/9.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SettingPsdViewController.h"
#import "NSString+Addition.h"

@interface SettingPsdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *aginPassword;

@end

@implementation SettingPsdViewController

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
}
- (IBAction)backPop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)settingOk:(id)sender {
    if ([self.password.text isBlank] || [self.aginPassword.text isBlank]) {
        
    }else if (![self.password.text isEqualToString:self.aginPassword.text]){
        
    }else{
        WEAKSELF();
        NSDictionary *params = @{
                                 @"username":self.phone,
                                 @"smscode":self.code,
                                 @"newPassword":self.password.text,
                                 @"send_token":self.send_token
                                 };
        [[NetWorkManager instance] sendReqWithParams:params urlStr:FindPsd complete:^(id result) {
            [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"密码设置成功" duration:2.0 completion:^{
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            }];
        } errorBlock:^(JSError *error) {
             [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:error.message duration:2.0];
        }];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.password resignFirstResponder];
    [self.aginPassword resignFirstResponder];
    
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
