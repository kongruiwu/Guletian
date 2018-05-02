//
//  API.h
//  KeTing
//
//  Created by 吴孔锐 on 2017/6/6.
//  Copyright © 2017年 wurui. All rights reserved.
//

#ifndef API_h
#define API_h
#ifdef DEBUG
    #define Base_Url    @"http://47.104.185.94:7000/api/app/index.html"
#else
    #define Base_Url    @"http://47.104.185.94:7000/api/app/index.html"
#endif


#define VideoList       @"video.list"
#define VideoType       @"video.type"
#define TeacherList     @"teacher.list"
#define TeacherDetail   @"teacher.detail"
#define VideoDetail     @"video.detail"


#define UserLogin           @"user.login"                   //账号登录
#define UserRegist          @"user.register"                //注册
#define UserInfo            @"user.info"                    //个人资料
#define UserMoney           @"user.account"                 //用户资金
#define ChangePsd           @"user.modifyPassword"          //修改密码
#define FindPsd             @"user.findPassword"            //找回密码
#define SMSSend             @"sms.send"                     //短信发送   1、注册   2、找回密码  3其他
#define Logout              @"user.logout"   

#define MyAttention         @"attention.list"               //我的关注
#define MyOrder             @"order.list"                   //我的订单


#endif /* API_h */
