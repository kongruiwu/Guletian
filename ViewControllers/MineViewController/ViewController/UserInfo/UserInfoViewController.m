//
//  UserInfoViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoManage.h"

@interface UserInfoViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *rightArrow;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *tureName;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *inster;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setNavTitle:@"个人资料"];
    [self drawBackButton];
    self.nickName.text = [UserInfoManage sharedManager].currentUserInfo.nickname;
    self.tureName.text = [UserInfoManage sharedManager].currentUserInfo.name;
    self.gender.text   = [UserInfoManage sharedManager].currentUserInfo.gender;
    self.email.text    = [UserInfoManage sharedManager].currentUserInfo.email;
    self.address.text  = [UserInfoManage sharedManager].currentUserInfo.address;
    self.inster.text   = [UserInfoManage sharedManager].currentUserInfo.hobby;
}

//结束编辑时保存用户名
- (void)textFieldDidEndEditing:(UITextField *)textField{
    UserModel *user = [UserInfoManage sharedManager].currentUserInfo;
    if (textField == self.nickName) {
        user.nickname = textField.text;
        [user archive];
    }else if (textField == self.tureName) {
        user.name = textField.text;
        [user archive];
    }else if (textField == self.gender) {
        user.gender = textField.text;
        [user archive];
    }else if (textField == self.email) {
        user.email = textField.text;
        [user archive];
    }else if (textField == self.address) {
        user.address = textField.text;
        [user archive];
    }else if (textField == self.inster) {
        user.hobby = textField.text;
        [user archive];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.nickName resignFirstResponder];
    [self.tureName resignFirstResponder];
    [self.gender resignFirstResponder];
    [self.email resignFirstResponder];
    [self.address resignFirstResponder];
    [self.inster resignFirstResponder];
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
