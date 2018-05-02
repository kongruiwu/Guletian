//
//  TeaQuestionVC.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/23.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TeaQuestionVC.h"
#import "ConfigHeader.h"
#import "TeaQuestionCell.h"
#import "QuestionModel.h"

static NSString * TeaQuestion = @"TeaQuestionCell";

@interface TeaQuestionVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray <QuestionModel *> *dataArray;

@end

@implementation TeaQuestionVC

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
    QuestionModel *model = self.dataArray[indexPath.section];
    return Anno750(363) + model.contentH;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeaQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:TeaQuestion];
    if (!cell) {
        cell = [[TeaQuestionCell alloc] initWithStyle:0 reuseIdentifier:TeaQuestion];
    }
    cell.model = self.dataArray[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Anno750(20);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(0xF5F5F5);
    return view;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.rsp) {
        self.rsp(scrollView);
    }
}


- (NSMutableArray<QuestionModel *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i=0; i<10 ; i++) {
            QuestionModel *model = [[QuestionModel alloc] init];
            if (i == 1) {
                model.content = @"最后时刻，一向稳重的保罗居然在最关键的时刻犯错：最后8s。";
            }else if(i == 2){
                model.content = @"火箭领先3分并握有球权";
            }else{
                model.content = @"首节比赛，哈登状态一般，可状态一般的哈登仍令森林狼感到头疼，他在外线顶着吉米-巴特勒防守强投三分命中，当他突破杀到内线吸引卡尔-安东尼-唐斯协防，他总能送出妙传，助攻克林特-卡佩拉完成空接暴扣，哈登能攻能传，这令森林狼防不胜防，锡伯杜虽然是防守大师，可他也拿不出好办法限制哈登";
            }
            [_dataArray addObject:model];
        }
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
