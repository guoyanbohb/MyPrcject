//
//  SaleNumCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/22.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaleNumModel.h"
@interface SaleNumCell : UITableViewCell
{

    //主图片
    UIImageView*mainImageView;
    //名字
    UILabel*titleLabel;
    //价格
    UILabel*priceLabel;
    //右上角图片
    UIImageView*numImageView;
    //右上角计数
    UILabel*numLabel;
}
-(void)config:(NSDictionary*)model;
@property(nonatomic,assign)SaleNumModel*dataModel;
@end
