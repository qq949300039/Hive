//
//  ResponseManagerModel.h
//  Hive
//
//  Created by 那宝军 on 15/4/7.
//  Copyright (c) 2015年 wee. All rights reserved.
//

#import "JSONModel.h"
#import "LoginModel.h"
#import "NearByModel.h"

@interface ResponseManagerModel : JSONModel

@end

#pragma -mark 登陆
@interface ResponseLoginModel : JSONModel
@property (nonatomic, assign) int RETURN_CODE;
@property (nonatomic, strong) LoginModel *content;
@end
#pragma -mark 附近人
@protocol NearByModel;
@interface ResponseNearByModel : JSONModel
@property (nonatomic, assign) int RETURN_CODE;
@property (nonatomic, strong) NSArray <NearByModel>*content;
@end
#pragma -mark 附近人 关注 
@interface ResponseFollowModel : JSONModel
@property (nonatomic, assign) int RETURN_CODE;
@property (nonatomic, strong) NSDictionary *RETURN_OBJ;
@end
