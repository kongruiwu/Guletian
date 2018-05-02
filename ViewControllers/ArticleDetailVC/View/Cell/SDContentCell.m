//
//  SDContentCell.m
//  KeWan
//
//  Created by guofeng on 17/8/29.
//  Copyright © 2017年 zsc. All rights reserved.
//

#import "SDContentCell.h"

@implementation SDContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _webView.delegate = self;
}
- (void)setContent:(NSString *)content
{
    if (content && ![_content isEqualToString:content]) {
        _content = content;
        [_webView loadHTMLString:_content baseURL:nil];
    }
    
//    <div style="color: #3f3f3f;line-height: 200%;text-align: justify; font-size: 18px;"><p>妮妮<img src="http://gushang888.com//nrhgcms/data/upload/ueditor/20171226/5a41f2df96f50.jpg" title="发发发.jpg" alt="发发发.jpg"/></p></div>
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    float h = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    _webView.hidden = NO;
    if (_rsp) {
        _rsp(h);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
