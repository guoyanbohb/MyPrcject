//
//  SaleNumModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/22.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaleNumModel : NSObject

@property(nonatomic,copy)NSNumber*seriesid;
@property(nonatomic,copy)NSString*seriesname;
@property(nonatomic,copy)NSString*price;
@property(nonatomic,copy)NSString*img;
@property(nonatomic,copy)NSNumber*ordercount;
@property(nonatomic,copy)NSNumber*levelid;
@property(nonatomic,copy)NSString*levelname;
@property(nonatomic,copy)NSArray*hotseries;



@end
