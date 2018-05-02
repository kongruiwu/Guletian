//
//  TopView.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TopView.h"
#import "UIView+Layer.h"
#import "ConfigHeader.h"

@implementation TopView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.attentionBtn setLayerCornerRadius:3.0f borderWidth:1 borderColor:UIColorFromRGB(0x3A89F4)];
}

+ (TopView *)instance
{
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"TopView" owner:nil options:nil];
    return array[0];
}


- (IBAction)attentionTeacher:(id)sender {
    if (self.rsp) {
        self.rsp(@"白冰");
    }
    
}

@end
