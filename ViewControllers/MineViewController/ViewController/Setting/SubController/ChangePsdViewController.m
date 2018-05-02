//
//  ChangePsdViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "ChangePsdViewController.h"
#import "UIView+Layer.h"
#import "ConfigHeader.h"
#import "NSString+Addition.h"

@interface ChangePsdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPsd;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *aginPsd;

@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@end

@implementation ChangePsdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavTitle:@"修改密码"];
    [self drawBackButton];
    [self.okBtn setLayerCornerRadius:3.0f borderWidth:1.0f borderColor:UIColorFromRGB(0x1482f0)];
}

#pragma makr - 确认
- (IBAction)changePsd:(id)sender {
    if ([self.oldPsd.text isBlank] ||[self.password.text isBlank] ||[self.aginPsd.text isBlank]) {
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"请输入相应密码" duration:1.0];
    }else if (![self.password.text isEqualToString:self.aginPsd.text]) {
        [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"确认密码和新密码不一致" duration:1.0];
    }else {
        NSString *token = [YDConfigurationHelper getStringValueForConfigurationKey:kToken];
        NSDictionary *params = @{
                                 @"password":self.oldPsd.text,
                                 @"newPassword":self.password.text,
                                 @"token":token
                                 };
        [[NetWorkManager instance] sendReqWithParams:params urlStr:ChangePsd complete:^(id result) {
            [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:@"修改成功" duration:2.0 completion:^{
                [self.navigationController popViewControllerAnimated:YES];
            }];
            
        } errorBlock:^(JSError *error) {
            [ToastView presentToastWithin:[UIApplication sharedApplication].keyWindow withIcon:APToastIconNone text:error.message duration:1.0];
        }];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.oldPsd resignFirstResponder];
    [self.password resignFirstResponder];
    [self.aginPsd resignFirstResponder];
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
