//
//  CommunityModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/15.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommunityModel : NSObject
@property(nonatomic,copy)NSNumber*topicId;
@property(nonatomic,copy)NSNumber*userId;
@property(nonatomic,copy)NSString*userName;
@property(nonatomic,copy)NSString*nickName;
@property(nonatomic,copy)NSString*userAvatar;
@property(nonatomic,copy)NSNumber*serialId;
@property(nonatomic,copy)NSNumber*masterId;
@property(nonatomic,copy)NSString*publishTime;
@property(nonatomic,copy)NSString*content;
@property(nonatomic,copy)NSArray*imageList;
@property(nonatomic,copy)NSString*location;
@property(nonatomic,copy)NSNumber*agreeCount;
@property(nonatomic,copy)NSNumber*commentCount;
@property(nonatomic,copy)NSNumber*followType;
@property(nonatomic)BOOL agreed;
@property(nonatomic,copy)NSNumber*topicMode;
@property(nonatomic,copy)NSNumber*isGood;
@property(nonatomic,copy)NSNumber*isTop;
@property(nonatomic)BOOL viewMore;
@property(nonatomic,copy)NSNumber*forumId;
@property(nonatomic,copy)NSString*forumName;
@property(nonatomic,copy)NSString*forumLogo;
@property(nonatomic,copy)NSNumber*forumType;
@property(nonatomic)BOOL followed;
@property(nonatomic,copy)NSString*summary;
@property(nonatomic)BOOL identified;
@property(nonatomic,copy)NSString*serialName;
@property(nonatomic,copy)NSString*masterName;
@property(nonatomic,copy)NSNumber*type;
//@property(nonatomic,copy)NSString*description;
@property(nonatomic,copy)NSNumber*status;
@property(nonatomic,copy)NSString*dataVersion;
@property(nonatomic,copy)NSNumber*isHot;



@end
