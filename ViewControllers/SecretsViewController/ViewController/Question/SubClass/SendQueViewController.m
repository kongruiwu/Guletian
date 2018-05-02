//
//  SendQueViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/18.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SendQueViewController.h"

@interface SendQueViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *teacherIcon;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) UIView *placeHolder;

@end

@implementation SendQueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavTitle:@"提问"];
    [self drawBackButton];
    
    self.textView.delegate = self;
    [self setupTextView];
    
}

- (void)setupTextView {
    UIView *placeHolder = [[UIView alloc] init];
    placeHolder.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(begin)];
    [placeHolder addGestureRecognizer:tapGesture];
    [self.textView addSubview:placeHolder];
    self.placeHolder = placeHolder;
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"向老师提问";
    placeHolderLabel.font = kFont(28);
    placeHolderLabel.textColor = UIColorFromRGB(0x999999);
    [placeHolderLabel sizeToFit];
    [placeHolder addSubview:placeHolderLabel];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"quiz"];
    [placeHolder addSubview:imgView];
    
    [placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(@0);
        make.height.equalTo(@(Anno750(40)));
        make.width.equalTo(@(Anno750(400)));
    }];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(placeHolder.mas_left).offset(Anno750(30));
        make.top.equalTo(placeHolder.mas_top).offset(Anno750(20));
        make.width.height.equalTo(@(Anno750(28)));
    }];
    
    [placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(Anno750(10));
        make.centerY.equalTo(imgView.mas_centerY);
        make.height.equalTo(@15);
    }];
    [self.textView bringSubviewToFront:placeHolder];
}

- (void)begin {
    self.placeHolder.hidden = YES;
    [self.textView becomeFirstResponder];
}

#pragma mark - UITextViewDelegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView endEditing:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length) {
        self.placeHolder.hidden = YES;
    }else{
        self.placeHolder.hidden = NO;
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    self.placeHolder.hidden = YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length) {
        self.placeHolder.hidden = YES;
    }else{
        self.placeHolder.hidden = NO;
    }
}

#pragma mark - 发送问题
- (IBAction)sendQuestion:(id)sender {
    
}
#pragma mark - 向其他老师提问
- (IBAction)quizOther:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
