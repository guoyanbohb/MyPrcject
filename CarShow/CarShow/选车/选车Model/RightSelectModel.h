//
//  RightSelectModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/28.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RightSelectModel : NSObject
@property(nonatomic,copy)NSNumber*brandId;
@property(nonatomic,copy)NSString*brandName;
@property(nonatomic)BOOL foreign;
@property(nonatomic,copy)NSArray*serialList;
@property(nonatomic,copy)NSNumber*serialId;
@property(nonatomic,copy)NSString*serialName;
@property(nonatomic,copy)NSString*Picture;
@property(nonatomic,copy)NSNumber*uv;
@property(nonatomic,copy)NSNumber*saleStatus;
@property(nonatomic,copy)NSString*dealerPrice;





@end
