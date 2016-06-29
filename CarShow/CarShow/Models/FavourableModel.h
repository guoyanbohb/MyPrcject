//
//  FavourableModel.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavourableModel : NSObject
//活动

@property(nonatomic,copy)NSNumber*total_num;
@property(nonatomic,copy)NSString*id;
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*title_as;
@property(nonatomic,copy)NSString*images;
@property(nonatomic,copy)NSString*sponsor;
@property(nonatomic,copy)NSString*start_date;
@property(nonatomic,copy)NSString*end_date;
@property(nonatomic,copy)NSNumber*show_time;
@property(nonatomic,copy)NSNumber*area_id;
@property(nonatomic,copy)NSString*url;
@property(nonatomic,copy)NSString*dealer_activity_id;
@property(nonatomic,copy)NSString*range;
@property(nonatomic,copy)NSString*source;
@property(nonatomic,copy)NSString*order_sn;
@property(nonatomic,copy)NSString*regstart_date;
@property(nonatomic,copy)NSString*regend_date;
@property(nonatomic,copy)NSString*atype;
@property(nonatomic,copy)NSString*aprice;
@property(nonatomic,copy)NSString*pnum;
@property(nonatomic,copy)NSString*regnum;
@property(nonatomic,copy)NSString*contact;
@property(nonatomic,copy)NSString*tel;
@property(nonatomic,copy)NSString*create_date;
@property(nonatomic,copy)NSString*edit_date;
@property(nonatomic,copy)NSString*publish_date;
@property(nonatomic,copy)NSString*custom_url;
@property(nonatomic,copy)NSString*static_url;
@property(nonatomic,copy)NSString*stitle;
@property(nonatomic,copy)NSString*keys;
@property(nonatomic,copy)NSString*desc;
@property(nonatomic,copy)NSString*toshop;
@property(nonatomic,copy)NSString*fixedtime;
@property(nonatomic,copy)NSString*smscontent;
@property(nonatomic,copy)NSString*special_topic_push;
@property(nonatomic,copy)NSString*randnum;
@property(nonatomic,copy)NSString*prefer_info;
@property(nonatomic,copy)NSString*email;
@property(nonatomic,copy)NSString*flag;
@property(nonatomic,copy)NSString*send_user;
@property(nonatomic,copy)NSString*send_time;
@property(nonatomic,copy)NSString*send_status;
@property(nonatomic,copy)NSString*brand_show;
@property(nonatomic,copy)NSString*designer;
@property(nonatomic,copy)NSString*sign_flag;
@property(nonatomic,copy)NSString*call_center;
@property(nonatomic,copy)NSString*api_id;
@property(nonatomic,copy)NSString*is_export;
@property(nonatomic,copy)NSString*all_model;
@property(nonatomic,copy)NSString*button_word;

//降价

@property(nonatomic,copy)NSNumber*VendorID;
@property(nonatomic,copy)NSNumber*DealerBizMode;
@property(nonatomic,copy)NSNumber*DealerID;
@property(nonatomic,copy)NSString*DealerName;
@property(nonatomic,copy)NSString*CallCenterNumber;
@property(nonatomic,copy)NSNumber*Is4S;
@property(nonatomic,copy)NSNumber*NewsID;
@property(nonatomic,copy)NSString*NewsUrl;
@property(nonatomic,copy)NSNumber*CityID;
@property(nonatomic,copy)NSNumber*CarID;
@property(nonatomic,copy)NSString*CarName;
@property(nonatomic,copy)NSString*CarImage;
@property(nonatomic,copy)NSString*AlbumImage;
@property(nonatomic,copy)NSNumber*SerialID;
@property(nonatomic,copy)NSNumber*ReferPrice;
@property(nonatomic,copy)NSNumber*ActPrice;
@property(nonatomic,copy)NSNumber*FavPrice;
@property(nonatomic,copy)NSNumber*Discoun;
@property(nonatomic,copy)NSNumber*IsPresent;
@property(nonatomic,copy)NSNumber*PrePrice;
@property(nonatomic,copy)NSString*PreInfo;
@property(nonatomic,copy)NSString*StartDateTime;
@property(nonatomic,copy)NSString*EndDateTime;
@property(nonatomic,copy)NSNumber*RemainDay;
@property(nonatomic,copy)NSString*SaleRegion;
@property(nonatomic,copy)NSString*StoreState;
@property(nonatomic,copy)NSString*UpdateTime;
@property(nonatomic,copy)NSNumber*ProvinceID;


@end
