//
//  HeadlineModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/1.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadlineModel : NSObject


//要闻
@property(nonatomic,copy)NSNumber*newsId;
@property(nonatomic,copy)NSString*picCover;
@property(nonatomic,copy)NSString*filePath;
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*src;
@property(nonatomic,copy)NSString*publishTime;
@property(nonatomic,copy)NSString*commentCount;
@property(nonatomic,copy)NSNumber*viewCount;
@property(nonatomic,copy)NSString*itemType;
@property(nonatomic,copy)NSString*lastModify;
@property(nonatomic,copy)NSNumber*type;
@property(nonatomic,copy)NSString*dataVersion;


//说车
@property(nonatomic,copy)NSString*mediaName;


//图片
@property(nonatomic,copy)NSNumber*imageCount;


//视频
@property(nonatomic,copy)NSNumber*VideoId;
@property(nonatomic,copy)NSString*Title;
@property(nonatomic,copy)NSString*Mp4Link;
@property(nonatomic,copy)NSString*Author;
@property(nonatomic,copy)NSString*CreatedOn;
@property(nonatomic,copy)NSNumber*VideoUnique;
@property(nonatomic,copy)NSString*LetvVideoId;
@property(nonatomic,copy)NSString*Duration;
@property(nonatomic,copy)NSString*CategoryName;
@property(nonatomic,copy)NSString*CategoryId;
@property(nonatomic,copy)NSNumber*Row;
@property(nonatomic,copy)NSString*SwfLink;
@property(nonatomic,copy)NSString*PublishTime;
@property(nonatomic,copy)NSString*ModifyTime;
@property(nonatomic,copy)NSString*PlayLink;
@property(nonatomic,copy)NSString*ImageLink;
@property(nonatomic,copy)NSString*RelativeVideoId;
@property(nonatomic,copy)NSNumber*TotalVisit;
@property(nonatomic,copy)NSString*YkVideoId;
@property(nonatomic,copy)NSNumber*UserId;




@property(nonatomic,copy)NSString*newsLink;
@end
