//
//  OfficialViewController.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "OfficialViewController.h"
#import "OfficalImgCell.h"
#import "OfficalCell.h"

static NSString * CellID = @"OfficalCell";
static NSString * ImgCellID = @"OfficalImgCell";

@interface OfficialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation OfficialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTableView];
}

- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.mj_w,self.view.mj_h-Nav64-Anno750(88)) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Anno750(146);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;//self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    OfficalCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
//    if (!cell) {
//        cell = [[OfficalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
//    }
    OfficalImgCell *cell = [tableView dequeueReusableCellWithIdentifier:ImgCellID];
    if (!cell) {
        cell = [[OfficalImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImgCellID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
