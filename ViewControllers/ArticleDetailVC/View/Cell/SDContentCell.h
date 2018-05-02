//
//  SDContentCell.h
//  KeWan
//
//  Created by guofeng on 17/8/29.
//  Copyright © 2017年 zsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDContentCell : UITableViewCell <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@property (nonatomic,copy) void (^rsp)(float h);
@property (nonatomic,strong) NSString * content;

@end
