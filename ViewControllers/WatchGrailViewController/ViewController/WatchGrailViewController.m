//
//  WatchGrailViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/29.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "WatchGrailViewController.h"
#import "WatchGrailCell.h"
#import "WatchGrailListModel.h"
#import "SelectTimeView.h"
@interface WatchGrailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabview;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) SelectTimeView * timeView;

@end

@implementation WatchGrailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatCommonNavSearch];
    [self creatUI];
}

- (void)creatUI{
    
    [self setTestData];
    
    [self creatHeadTimeView];
    
    self.tabview = [Factory creatTabviewWithFrame:CGRectMake(0, Anno750(96), UI_WIDTH, UI_HEGIHT - Anno750(96) - Tab49 - Anno750(30)) style:UITableViewStylePlain delegate:self];
    [self.view addSubview:self.tabview];
    
    self.timeView = [[SelectTimeView alloc]initWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT)];
    [self.view addSubview:self.timeView];
    [self.timeView.sureBtn addTarget:self action:@selector(selectTimeDate) forControlEvents:UIControlEventTouchUpInside];
    self.timeLabel.text = self.timeView.timeLabel.text;
    
}
- (void)creatHeadTimeView{
    UIView * timeView = [Factory creatViewWithColor:[UIColor blackColor]];
    timeView.frame = CGRectMake(0, 0, UI_WIDTH, Anno750(96));
    [self.view addSubview:timeView];
    
    self.timeLabel = [Factory creatLabelWithText:@"2018年4月3日 星期三"
                                       fontValue:font750(26)
                                       textColor:[UIColor whiteColor]
                                   textAlignment:NSTextAlignmentLeft];
    [timeView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.centerY.equalTo(@0);
    }];
    UIButton * timeButton = [Factory creatButtonWithNormalImage:@"icon-selecttime" selectImage:@""];
    [timeView addSubview:timeButton];
    [timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@(-Anno750(30)));
    }];
    [timeButton addTarget:self action:@selector(selectTime) forControlEvents:UIControlEventTouchUpInside];
}
- (void)selectTime{
    [self.timeView show];
}
- (void)selectTimeDate{
    [self.timeView disMiss];
    self.timeLabel.text = self.timeView.timeLabel.text;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //是否有图片 是否是大图
    WatchGrailListModel * model = self.dataArray[indexPath.row];
    float picH = 0;
    if (model.cellType == WatchGrailOnePic) {
        picH = Anno750(235) + Anno750(24);
    }else if(model.cellType == WatchGrailThreePic){
        picH = Anno750(95) + Anno750(24);
    }
    return Anno750(36.5 * 2 + Anno750(24)) + model.heigh + picH;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"WatchGrailCell";
    WatchGrailCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[WatchGrailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    [cell updateWithModel:self.dataArray[indexPath.row]];
    
    return cell;
    
}
- (void)setTestData{
    self.dataArray = [NSMutableArray new];
    NSArray * times = @[@"13:00",@"12:00",@"11:00",@"10:00",@"9:00"];
    NSArray * contents = @[@"高驱鬼，高法连冲突，同时出现，驱鬼在最后一位，法连在魔心后面，反震前面。反之同上！高低冲突的技能:高反震",@"，隐身 高感知 鬼混，高夜战 连击，高吸血 感知，高鬼魂，必杀，高隐身 弱点水，高驱鬼 幸运，力劈 高神 慧根，高连和高盾气，高吸 盾气 感知，冥思 弱点土，高强力 高反击，高敏捷 雷击，高偷 烈火！高法波 敏捷。死亡召唤，水攻。",@"只适用于6JN以上宝宝，有冲突技能在，技能就会跳位，或者直接覆盖！掌握这些冲突技能对于打书最大的帮助就是，冲突的技能就很容易掉一个",@"！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生",@"！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生！而且是首先会掉的特殊技能冲突：力劈 高神 慧根，善恶 雷吸收 奔雷咒，须弥真言 再生"];
    NSArray * onePic = @[@"",@"",@"",@"asdasdjashdjahsdjkhaskjd",@""];
    NSArray * threpics = @[@[],@[],@[@"123",@"123",@"123"],@[],@[]];
    NSArray * voices = @[@"123123123",@"12312312",@"",@"1231231",@""];
    for (int i = 0; i<times.count; i++) {
        NSDictionary * dic = @{
                               @"time":times[i],
                               @"content":contents[i],
                               @"pic":onePic[i],
                               @"pics":threpics[i],
                               @"voiceUrl":voices[i]
                               };
        WatchGrailListModel * model = [[WatchGrailListModel alloc]initWithDictionary:dic];
        [self.dataArray addObject:model];
    }
}

@end
