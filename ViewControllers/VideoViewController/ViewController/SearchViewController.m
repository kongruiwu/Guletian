//
//  SearchViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/27.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITextField * searchTf;
@property (nonatomic, strong) UITableView * tabview;
@property (nonatomic, assign) BOOL showResult;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawRightBarButton];
    [self drawBackButton];
    self.searchTf = [self creatNavSearchBar];
    
    
}
- (void)drawRightBarButton{
    UIButton * cannceBtn = [Factory creatButtonWithTitle:@"搜索"
                                    backGroundColor:[UIColor clearColor]
                                          textColor:[UIColor whiteColor]
                                           textSize:font750(28)];
    [cannceBtn addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:cannceBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}



- (void)creatUI{
    self.dataArray = [NSMutableArray new];
    self.tabview = [Factory creatTabviewWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT) style:UITableViewStyleGrouped delegate:self];
    [self.view addSubview:self.tabview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.showResult ? 1 : self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.showResult ? Anno750(88) : Anno750(165);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Anno750(65);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = [Factory creatViewWithColor:[UIColor whiteColor]];
    headView.frame = CGRectMake(0, 0, UI_WIDTH, Anno750(80));
    NSString * title = @"历史记录";
    UILabel * label = [Factory creatLabelWithText:title
                                        fontValue:font750(28)
                                        textColor:Color_MainBlack
                                    textAlignment:NSTextAlignmentLeft];
    [headView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(24)));
        make.centerY.equalTo(@0);
    }];
    return headView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.showResult) {
//
//    }else{
//
//    }
    return nil;
}

@end
