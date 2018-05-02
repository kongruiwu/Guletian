//
//  NSString+Addition.h
//  NewRenWang
//
//  Created by YJ on 17/1/13.
//  Copyright © 2017年 尹争荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)
/**
 *  是否空字符串 没有任何字符
 *
 *  @return BOOL
 */
- (BOOL)isBlank;

/**
 *  是否是有效的字符串  包括空字符串
 *
 *  @return BOOL
 */
- (BOOL)isValid;

/**
 *  无空格和换行的字符串
 */
- (NSString *)noWhiteSpaceString;

/*
 *  判断手机号
 */
- (BOOL)isPhoneNumber;
/**
 *  判断手机号
 */
+ (BOOL)isValidateMobile:(NSString *)mobileNum;
/**
 *  判断邮箱
 */
-(BOOL)isEmailWithString:(NSString *)str;

-(BOOL)isGloabelNumberWithString:(NSString *)str;

/**
 返回处理过的字符串，只保留小数点后两位，结尾0省略
 */
- (instancetype)dealedPriceString;
/**
 * 判断中文和英文字符串的长度
 */
- (int)convertToInt:(NSString*)strtemp;

/**
 *  字符串md5加密
 */
- (NSString *)md5Encrypt;

@end
