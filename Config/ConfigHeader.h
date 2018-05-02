//
//  ConfigHeader.h
//  KeTing
//
//  Created by 吴孔锐 on 2017/6/5.
//  Copyright © 2017年 wurui. All rights reserved.
//

#ifndef ConfigHeader_h
#define ConfigHeader_h

#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ToastView.h"
#import "Factory.h"
#import "YDConfigurationHelper.h"
#import "NetWorkManager.h"
#import "API.h"
#import "UIView+CNKit.h"
#import "MJExtension.h"
#import "Constant.h"
#import "UserInfoManage.h"

//全局返回通用配置选项
typedef NS_ENUM(NSInteger, SelectorBackType){
    SelectorBackTypePopBack = 0,
    SelectorBackTypeDismiss,
    SelectorBackTypePoptoRoot
};

//750状态下字体适配
#define font750(x) ((x)/ 750.0f) * UI_WIDTH
//750状态下像素适配宏
#define Anno750(x) ((x)/ 750.0f) * UI_WIDTH


#define UI_BOUNDS   [UIScreen mainScreen].bounds
#define UI_HEGIHT   [UIScreen mainScreen].bounds.size.height
#define UI_WIDTH    [UIScreen mainScreen].bounds.size.width
#define Nav64       ([UIScreen mainScreen].bounds.size.height == 812.0f ? 88 : 64)
#define Tab49       ([UIScreen mainScreen].bounds.size.height == 812.0f ? 83 : 49)
#define StaBarH     ([UIScreen mainScreen].bounds.size.height == 812.0f ? 44 : 20)


#define WEAKSELF() __weak __typeof(&*self)weakSelf = self;
//规避空值
#define INCASE_EMPTY(str, replace) \
( ([(str) length]==0)?(replace):(str) )

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue,sec) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:sec]


#define Color_MainBlue          UIColorFromRGB(0x1482f0)
#define Color_LightGray         UIColorFromRGB(0x8f8f8f)
#define Color_DarkGray          UIColorFromRGB(0x666666)
#define Color_MainBlack         UIColorFromRGB(0x292929)
#define Color_Line              UIColorFromRGBA(0x000000,0.2)
#define Color_BackGround        UIColorFromRGB(0xf7f7f7)
//进度条
#define Color_SliderOrg         [UIColor colorWithRed:0.97 green:0.30 blue:0.19 alpha:1.00]

#define kFont(x) [UIFont systemFontOfSize:font750(x)]

#endif /* ConfigHeader_h */
