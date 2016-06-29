//
//  SelectModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectModel : NSObject
@property(nonatomic,copy)NSNumber*masterId;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*logoUrl;
@property(nonatomic,copy)NSString*initial;
@property(nonatomic,copy)NSNumber*uv;
@property(nonatomic,copy)NSNumber*saleStatus;
@property(nonatomic,copy)NSArray*hotseries;

@end
