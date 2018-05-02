//
//  NetErrorView.m
//  Doctor
//
//  Created by 吴孔锐 on 2018/1/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "NetErrorView.h"

@implementation NetErrorView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    self.backgroundColor = Color_BackGround;
    NSString * string = @"网络加载失败  点击重试";
    self.ImgView = [Factory creatImageViewWithImage:@"NetError"];
    self.descButton = [Factory creatButtonWithTitle:string
                                    backGroundColor:[UIColor clearColor]
                                          textColor:Color_DarkGray
                                           textSize:font750(32)];
    NSMutableAttributedString * attstring = [[NSMutableAttributedString alloc]initWithString:string];
    [attstring addAttribute:NSForegroundColorAttributeName value:Color_MainBlue range:NSMakeRange(string.length - 4, 4)];
    [self.descButton setAttributedTitle:attstring forState:UIControlStateNormal];
    [self addSubview:self.ImgView];
    [self addSubview:self.descButton];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.ImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.width.equalTo(@(Anno750(240)));
        make.height.equalTo(@(Anno750(240)));
        make.centerY.equalTo(@(-Anno750(120)));
    }];
    [self.descButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.ImgView.mas_bottom).offset(Anno750(10));
    }];
    
}

- (void)setViewType:(NetViewType)viewType{
    _viewType = viewType;
    NSString * string;
    NSRange range;
    switch (_viewType) {
        case NetViewError:
            string = @"网络加载失败  点击重试";
            range = NSMakeRange(string.length - 4, 4);
            break;
        case NetViewBuyService:
            string = @"暂时没有咨询服务包，点击 去购买 吧";
            range = NSMakeRange(string.length - 5, 3);
            break;
        case NetViewServiceHistory:
            string = @"暂时没有历史咨询";
            range = NSMakeRange(0, 0);
            break;
        default:
            break;
    }
    NSMutableAttributedString * attstring = [[NSMutableAttributedString alloc]initWithString:string];
    [attstring addAttribute:NSForegroundColorAttributeName value:Color_MainBlue range:range];
    [self.descButton setAttributedTitle:attstring forState:UIControlStateNormal];
    
}

@end
