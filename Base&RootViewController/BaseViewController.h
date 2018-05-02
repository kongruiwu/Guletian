//
//  BaseViewController.h
//  KeTing
//
//  Created by 吴孔锐 on 2017/6/5.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#import <MJRefresh.h>
#import "NetErrorView.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) MJRefreshNormalHeader * refreshHeader;
@property (nonatomic, strong) MJRefreshAutoNormalFooter * refreshFooter;
@property (nonatomic) SelectorBackType backType;
@property (nonatomic, strong) NetErrorView * netErrorView;

- (void)doBack;
- (void)setNavAlpha;
- (void)setNavUnAlpha;
- (void)RefreshSetting;
/**展示 网络错误底图*/
- (void)showNetErrorView;
/**展示 不同类型底图*/
- (void)showNetErrorViewWithType:(NetViewType)type;

- (void)hiddenNetErrorView;
/**网络错误底图 点击事件，默认响应 getdata 其他界面重写此方法*/
- (void)netErrorViewClick;
/**默认数据请求类*/
- (void)getData;

- (void)setNavTitle:(NSString *)title;
- (void)drawBackButton;

- (void)creatLeftLogo;
- (void)creatRightNavBarItem;
- (UITextField *)creatNavSearchBar;
- (UITextField *)creatCommonNavSearch;
@end
