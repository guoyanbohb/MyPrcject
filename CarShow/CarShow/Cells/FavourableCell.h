//
//  FavourableCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavourableModel.h"
@interface FavourableCell : UITableViewCell
{
    //活动
    //主图片
    UIImageView*imageView;
    //新闻标题
    UILabel*titleLabel;
    //著作方
    UILabel*nameLabel;
    //开始时间
    UILabel*startLabel;
    //结束时间
    UILabel*stopLabel;
    //右边button
    UIButton*applyButton;
    
    //降价
    
    //主图片
    UIImageView*mainImageView;
    //车名
    UILabel*carNameLabel;
    //现车价格
    UILabel*actPrice;
    //原车价格
    UILabel*referPrice;
    //绿色的小箭头
    UIImageView*lowImageView;
    //降价幅度
    UILabel*favPrice;
    //4s
    UILabel*redLabel;
    //4s店名
    UILabel*dealerNameLabel;
    //现车充足
    UILabel*numLabel;
    //售全国
    UILabel*saleLabel;
    //手机号
    UIButton*phoneButton;
    //手机号
    UILabel*phoneLabel;
    //询底价
    UIButton*lowPriceButton;


}
//详细内容
@property(nonatomic,copy)NSString*str;
-(void)config:(FavourableModel*)model;
@property(nonatomic,assign)FavourableModel*dataModel;

@end
