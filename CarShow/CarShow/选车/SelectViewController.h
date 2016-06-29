//
//  SelectViewController.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "RootViewController.h"

@interface SelectViewController : RootViewController
@property(nonatomic,copy)NSString*masterName;
@property(nonatomic,copy)NSString*masterId;
@property(nonatomic,copy)NSString*pic_url;
@property(nonatomic,copy)NSString*pinyou;
@property(nonatomic,copy)NSString*img_size;
@property(nonatomic,copy)NSNumber*sequence;

@property(nonatomic,copy)NSString*serialName;
@property(nonatomic,copy)NSString*serialId;
@property(nonatomic,copy)NSString*price;


@property(nonatomic,strong)NSDictionary*dic;

//复用传值
//@property(nonatomic,strong)NSArray*urlArray;
@end
