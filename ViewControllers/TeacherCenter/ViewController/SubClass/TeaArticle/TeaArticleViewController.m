//
//  TeaArticleViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/23.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TeaArticleViewController.h"
#import "ConfigHeader.h"
#import "TeaArticleCell.h"

static NSString * teacherArticle = @"TeaArticleCell";

@interface TeaArticleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TeaArticleViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    /// 解决方案三
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Anno750(160);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  20;//self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeaArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:teacherArticle];
    if (!cell) {
        cell = [[TeaArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:teacherArticle];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.rsp) {
        self.rsp(scrollView);
    }
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
