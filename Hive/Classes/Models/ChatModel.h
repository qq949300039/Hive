//
//  ChatModel.h
//  
//
//  Created by 那宝军 on 15/5/21.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ChatModel : NSManagedObject

@property (nonatomic, retain) NSString * hasRead;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * messageID;
@property (nonatomic, retain) NSString * msg_distance;
@property (nonatomic, retain) NSString * msg_flag;
@property (nonatomic, retain) NSString * msg_hasStealth;
@property (nonatomic, retain) NSString * msg_hasTime;
@property (nonatomic, retain) NSString * msg_isSend;
@property (nonatomic, retain) NSString * msg_latitude;
@property (nonatomic, retain) NSString * msg_longitude;
@property (nonatomic, retain) NSString * msg_message;
@property (nonatomic, retain) NSString * msg_time;
@property (nonatomic, retain) NSNumber * msg_type;
@property (nonatomic, retain) NSString * msg_userID;
@property (nonatomic, retain) NSString * user_ID;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * msg_send_type;

@end
