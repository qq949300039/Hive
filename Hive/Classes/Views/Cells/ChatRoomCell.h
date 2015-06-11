//
//  chatViewCell.h
//  Hive
//
//  Created by mac on 15/4/28.
//  Copyright (c) 2015年 wee. All rights reserved.
//

#import "ChatRoomBaseCell.h"

@class ChatRoomModel;
@protocol ChatRoomViewCellDelegate;
#define SEND_STATUS_SIZE 20 // 发送状态View的Size
#define ACTIVTIYVIEW_BUBBLE_PADDING 5 // 菊花和bubbleView之间的间距

@interface ChatRoomCell : ChatRoomBaseCell
@property (nonatomic, weak) id<ChatRoomViewCellDelegate>delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIImageView *activtiyImg;
@property (nonatomic, strong) UIView *activityView;
@property (nonatomic, strong) UIButton *retryButton;

+ (instancetype)cellWithTableView:(UITableView *)tableView Delegate:(id<ChatRoomViewCellDelegate>)delegate;

@end

@protocol ChatRoomViewCellDelegate <NSObject>

- (void)tapHeadImgSendActionWithMessage:(ChatRoomModel *)message;

- (void)tapBubbleSendActionWithMessage:(ChatRoomModel *)message;

- (void)resendMessage:(ChatRoomModel *)message;
@end