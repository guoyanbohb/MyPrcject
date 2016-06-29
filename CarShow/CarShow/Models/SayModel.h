//
//  SayModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/19.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SayModel : NSObject
//自媒体 机构
@property(nonatomic,copy)NSNumber*id;
@property(nonatomic,copy)NSString*mediaName;
@property(nonatomic,copy)NSString*mediaSummary;
@property(nonatomic,copy)NSString*mediaHeadImg;
@property(nonatomic,copy)NSNumber*subscribeCount;
@property(nonatomic)BOOL subscribed;

@end
