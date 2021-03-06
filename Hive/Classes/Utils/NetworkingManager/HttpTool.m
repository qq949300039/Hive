//
//  HttpTool.m
//  Hive
//
//  Created by BaoJun on 15/3/30.
//  Copyright (c) 2015年 wee. All rights reserved.
//

#import "HttpTool.h"
#import "Utils.h"

#define APPEND_Login @"/log/login.do"// 登陆
#define APPEND_NearBy @"/info/loadCrowd.do" // 附近人
#define APPEND_NearBy_Follow @"/info/addFriend.do" // 关注
#define APPEND_NearBy_CancelFollow @"/info/removeFriend.do" // 关注
#define APPEND_NearBy_Block @"/info/commitBlackList.do"// 屏蔽用户

#define APPEND_BlockList @"/info/loadBlacklist.do"// 屏蔽列表
#define APPEND_FriendList @"/info/loadFriends.do"// 关注列表

#define APPEND_Register_PhoneNum @"/log/sendMessage.do"// 注册 手机号
#define APPEND_Register_Code @"/log/verifySMSCode.do" // 注册 验证码
#define APPEND_Register @"/log/register.do" // 注册
#define APPEND_Register_EmailExist @"/log/isEmailExist.do" // 邮箱验证
#define APPEND_Register_UpdateProfile @"/info/updateProfile.do" // 修改信息
#define APPEND_Register_UpdateUserHead @"/info/uploadUserIcon.do" // 修改头像

#define APPEND_UpdateProfileUserName @"/info/updateProfile.do" // 修改用户名
#define APPEND_SettingsNotification @"/info/loadPushSetting.do" // 拉取推送设置

@implementation HttpTool
#pragma -mark 登陆
/**
 *  封装 登陆请求接口 字段
 *
 *  @param userName 用户名
 *  @param password 密码
 *
 *  @return 返回 字典
 */
+ (NSMutableDictionary *)parameterWithUserName:(NSString *)userName Passwor:(NSString *)password
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:userName forKey:@"email"];
    [parameters setObject:password forKey:@"password"];
    return parameters;
}
// 登陆
+ (void)sendRequestWithUserName:(NSString *)userName
                       Password:(NSString *)password
                        success:(ResponseSuccBlcok)success
                        faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Login];
    NSMutableDictionary *dict = [HttpTool parameterWithUserName:userName Passwor:password];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}
#pragma -mark 附近人
/**
 *  封装 登陆请求接口 字段
 *
 *  @param longitude 经度
 *  @param latitude  纬度
 *
 *  @return 返回 字典
 */
+ (NSMutableDictionary *)parameterWithLongitude:(NSString *)longitude Latitude:(NSString *)latitude Gender:(NSString *)gender
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    [parameters setObject:longitude forKey:@"longitude"];
    [parameters setObject:gender forKey:@"gender"];
    [parameters setObject:latitude forKey:@"latitude"];
    return parameters;
}
// 附近人
+ (void)sendRequestWithLongitude:(NSString *)longitude
                        Latitude:(NSString *)latitude
                          Gender:(NSString *)gender // 性别
                         success:(ResponseSuccBlcok)success
                         faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_NearBy];
    NSMutableDictionary *dict = [HttpTool parameterWithLongitude:longitude Latitude:latitude Gender:gender];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 附近人 关注
+ (NSMutableDictionary *)parameterWithFollowFriend:(NSString *)friendID
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    [parameters setObject:friendID forKey:@"friendId"];
    return parameters;
}
// 关注附近人
+ (void)sendRequestWithFollow:(NSString *)friendID
                      success:(ResponseSuccBlcok)success
                      faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_NearBy_Follow];
    NSMutableDictionary *dict = [HttpTool parameterWithFollowFriend:friendID];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}
// 取消关注
+ (void)sendRequestWithCancelFollow:(NSString *)friendID
                            success:(ResponseSuccBlcok)success
                            faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_NearBy_CancelFollow];
    NSMutableDictionary *dict = [HttpTool parameterWithFollowFriend:friendID];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 阻止（屏蔽）用户
+ (void)sendRequestWithBLockUser:(NSString *)friendID
                         success:(ResponseSuccBlcok)success
                         faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_NearBy_Block];
    NSMutableDictionary *dict = [HttpTool parameterWithFollowFriend:friendID];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}
#pragma -mark 修改用户名
/**
 *  封装 修改用户名
 *
 *  @param userName 新的用户名
 *
 *  @return 返回 字典
 */
+ (NSMutableDictionary *)parameterWithUserName:(NSString *)userName
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    [parameters setObject:userName forKey:@"userName"];
    return parameters;
}

+ (void)sendRequestWithUpdateProfile:(NSString *)new_userName
                             success:(ResponseSuccBlcok)success
                             faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_UpdateProfileUserName];
    NSMutableDictionary *dict = [HttpTool parameterWithUserName:new_userName];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 拉取推送设置
/**
 *  封装 推送设置
 *
 *  @return 返回 字典
 */
+ (NSMutableDictionary *)parameterUserID
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    return parameters;
}

+ (void)sendRequestSettingsNotificationSuccess:(ResponseSuccBlcok)success
                                       faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_SettingsNotification];
    NSMutableDictionary *dict = [HttpTool parameterUserID];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}


#pragma -mark 注册 手机号
+ (NSMutableDictionary *)parameterPhoneNum:(NSString *)phoneNum
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:phoneNum forKey:@"phonenum"];
    return parameters;
}

+ (void)sendRequestRegisterPhoneNum:(NSString *)phoneNum
                            success:(ResponseSuccBlcok)success
                            faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register_PhoneNum];
    NSMutableDictionary *dict = [HttpTool parameterPhoneNum:phoneNum];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 注册 验证码
+ (NSMutableDictionary *)parameterCode:(NSString *)code
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:code forKey:@"code"];
    return parameters;
}
+ (void)sendRequestRegisterCode:(NSString *)code
                        success:(ResponseSuccBlcok)success
                        faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register_Code];
    NSMutableDictionary *dict = [HttpTool parameterCode:code];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}
#pragma -mark 注册
+ (NSMutableDictionary *)parameterEmail:(NSString *)email UserName:(NSString *)username Password:(NSString *)password
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:email forKey:@"email"];
    [parameters setObject:username forKey:@"userName"];
    [parameters setObject:password forKey:@"password"];
    return parameters;
}
+ (void)sendRequestRegisterEmail:(NSString *)email
                        UserName:(NSString *)username
                        Passwowd:(NSString *)password
                         success:(ResponseSuccBlcok)success
                         faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register];
    [HttpManager postRequestWithBaseUrl:urlString params:[HttpTool parameterEmail:email UserName:username Password:password] success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 邮箱验证
+ (NSMutableDictionary *)parameterEmailExist:(NSString *)email
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:email forKey:@"email"];
    return parameters;
}
+ (void)sendRequestRegisterEmailExist:(NSString *)email
                              success:(ResponseSuccBlcok)success
                              faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register_EmailExist];
    [HttpManager postRequestWithBaseUrl:urlString params:[HttpTool parameterEmailExist:email] success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}
#pragma -mark 修改用户信息
+ (NSMutableDictionary *)parameterUpdateProfile:(NSString *)username Label:(NSString *)label Gender:(NSString *)gender
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    [parameters setObject:username forKey:@"username"];
    [parameters setObject:label forKey:@"label"];
    [parameters setObject:gender forKey:@"gender"];
    return parameters;
}
+ (void)sendRequestUpdateProfileUserName:(NSString *)username
                                   Label:(NSString *)label
                                  Gender:(NSString *)gender
                                 success:(ResponseSuccBlcok)success
                                 faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register_UpdateProfile];
    [HttpManager postRequestWithBaseUrl:urlString params:[HttpTool parameterUpdateProfile:username Label:label Gender:gender] success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}
#pragma -mark 修改用户头像
//+ (NSMutableDictionary *)parameterUpdateProfileIcon:(NSString *)

#pragma -mark 隐身  
+ (NSMutableDictionary *)parameterHiding:(NSString *)hiding
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    [parameters setObject:hiding forKey:@"hide"];
    return parameters;

}
+ (void)sendRequestHiding:(NSString *)hiding
                  success:(ResponseSuccBlcok)success
                  faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register_UpdateProfile];
    [HttpManager postRequestWithBaseUrl:urlString params:[HttpTool parameterHiding:hiding] success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 禁止关注 
+ (NSMutableDictionary *)parameterBeFollow:(NSString *)follow
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:[[UserInfoManager sharedInstance] getCurrentUserInfo].userID forKey:@"userId"];
    [parameters setObject:follow forKey:@"canbefollow"];
    return parameters;
    
}
+ (void)sendRequestBeFollow:(NSString *)follow
                    success:(ResponseSuccBlcok)success
                    faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_Register_UpdateProfile];
    [HttpManager postRequestWithBaseUrl:urlString params:[HttpTool parameterBeFollow:follow] success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 屏蔽列表
+ (void)sendRequestBlockListSuccess:(ResponseSuccBlcok)success
                            faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_BlockList];
    NSMutableDictionary *dict = [HttpTool parameterUserID];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

#pragma -mark 关注列表
+ (void)sendRequestFollowListSuccess:(ResponseSuccBlcok)success
                             faliure:(HttpFailBlcok)faliure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTTP_Request,APPEND_FriendList];
    NSMutableDictionary *dict = [HttpTool parameterUserID];
    [HttpManager postRequestWithBaseUrl:urlString params:dict success:^(id response) {
        success(response);
    } Fail:^(NSError *error) {
        faliure(error);
    }];
}

@end
