//
//  LoginCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/2.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "LoginCell.h"
#import "ConfigHeader.h"

@interface LoginCell()<UITextFieldDelegate>

@property (nonatomic, weak) UIImageView *userLogo;
@property (nonatomic, weak) UITextField *userName;     //登录状态下显示
@property (nonatomic, weak) UIButton *editBtn;         //登录状态下显示
@property (nonatomic, weak) UILabel *loginLabel;       //未登录状态下显示

@end

@implementation LoginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

- (void)updateUI{
    BOOL isLogin = [YDConfigurationHelper getBoolValueForConfigurationKey:kLogin];
    if (isLogin) {
        [self.userLogo sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"userLogo"]];
        self.userName.text = [UserInfoManage sharedManager].currentUserInfo.nickname;
        self.loginLabel.hidden = YES;
        self.userName.hidden = NO;
        self.editBtn.hidden = NO;
    }else{
        self.loginLabel.hidden = NO;
        self.userName.hidden = YES;
        self.editBtn.hidden = YES;
    }
}

- (void)createUI{
    UIImageView *userLogo = [[UIImageView alloc] init];
    userLogo.image = [UIImage imageNamed:@"userLogo"];
    userLogo.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushUserInfo)];
    [userLogo addGestureRecognizer:tapGesture];
    [self.contentView addSubview:userLogo];
    self.userLogo = userLogo;

    UITextField *userName = [[UITextField alloc] init];
    userName.font = kFont(28);
    userName.borderStyle = UITextBorderStyleNone;
    userName.textColor = Color_MainBlack;
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    userName.enabled = NO;
    userName.delegate = self;
    [self.contentView addSubview:userName];
    self.userName = userName;
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [editBtn setImage:[UIImage imageNamed:@"userEdit"] forState:0];
    [editBtn addTarget:self action:@selector(editUserName) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:editBtn];
    self.editBtn = editBtn;
    
    UILabel *loginLabel = [[UILabel alloc] init];
    loginLabel.textColor = Color_MainBlack;
    loginLabel.text = @"点击登录";
    loginLabel.font = kFont(28);
    [self.contentView addSubview:loginLabel];
    self.loginLabel = loginLabel;
    
    [userLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(46));
        make.width.height.equalTo(@(Anno750(115)));
    }];
    
    [loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(userLogo.mas_bottom).offset(Anno750(24));
    }];
    
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(userLogo.mas_bottom).offset(Anno750(24));
        make.height.equalTo(@(Anno750(28)));
    }];

    [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(userName.mas_centerY);
        make.left.equalTo(userName.mas_right).offset(Anno750(10));
        make.width.equalTo(@(Anno750(26)));
        make.height.equalTo(@(Anno750(28)));
    }];
}

#pragma mark - 点击头像
- (void)pushUserInfo{
    if (self.rsp) {
        self.rsp();
    }
}

#pragma mark - 用户名编辑按钮
- (void)editUserName{
    self.userName.enabled = YES;
    [self.userName becomeFirstResponder];
}

//结束编辑时保存用户名
- (void)textFieldDidEndEditing:(UITextField *)textField{
    UserModel *user = [UserInfoManage sharedManager].currentUserInfo;
    user.nickname = textField.text;
    if ([user archive]) {
        NSLog(@"修改成功");
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.userName.enabled = NO;
    [self.userName resignFirstResponder];
}


@end
