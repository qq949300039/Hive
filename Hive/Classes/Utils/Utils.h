//
//  Utils.h
//  Hive
//
//  Created by BaoJun on 15/3/26.
//  Copyright (c) 2015年 wee. All rights reserved.
//

#ifndef Hive_Utils_h
#define Hive_Utils_h

#import "UIColorUtil.h"
#import "UIFontUtil.h"
#import "UtilDate.h"
#import "NSDataUtil.h"
#import "Statistics.h"
#import "UserDefaultsUtil.h"
#import "UserInfoManager.h"
#import "UILabel+VerticalAlign.h"
#import "UILabel+Size.h"
#import "ResponseManagerModel.h"
#import "UserInfoManager.h"
#import "HttpTool.h"
#include "XMPPManager.h"
#import "MBProgressHUD+Helper.h"

/**
 *  公共宏
 */

// 请求地址
#define HTTP_Request @"http://115.28.51.196:8080"

// ------------------------------------注册提示------------------------------------
// 忘记密码
#define ForgetString @"Forget the password?"
#define ValidationCodeStrin @"Please enter your phone number and get the Validation Code"
#define EnterCodeString @"Enter the validation code"

#define NotificationIntro @"Enable or disable WeChat Notifications via \"Settings\"->\"Notification\" on your iPhone."

#define SettingsFont [UIFont fontWithName:Font_Regular size:17]//设置页字体
// 提示字体
#define HintFont [UIFont fontWithName:Font_Medium size:16]
#define TextFont [UIFont fontWithName:Font_Medium size:18]
#define TitleFont [UIFont fontWithName:Font_Medium size:22]
#define ActionSheetFont [UIFont fontWithName:@"fafafa" size:18]
#define NavTitleFont [UIFont fontWithName:Font_Medium size:18]
// 中号字体
#define Font_Medium @"HelveticaNeue-Medium"
#define Font_Helvetica @"HelveticaNeue"
#define Font_Light @"HelveticaNeue-Light"
#define Font_Regular @"regular"

// 错误提示
#define ErrorText @"似乎已断开了互联网连接"
#define ErrorRequestText @"请求失败，请稍后重试"

// ------------------------------------屏幕------------------------------------
// 屏幕宽度
#define UIWIDTH  [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define UIHEIGHT [UIScreen mainScreen].bounds.size.height

// 判断字符串是否为空
#define IsEmpty(str) (![str respondsToSelector:@selector(isEqualToString:)] || [str isEqualToString:@""])

#pragma mark -
#pragma mark --- 判断是否为ios8
// 判断是否为ios8
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] - 8. >= 0 ? YES : NO)
#define navigation_Y (iOS8 ? 0 : 64)
#define present_Navigation_Y (iOS8 ? 64 : 0)
#endif
