//
//  NewCarCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/23.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCarModel.h"
@interface NewCarCell : UITableViewCell
{

    //图片
    UIImageView*imageView;
    //名字
    UILabel*titleLabel;
    //价格
    UILabel*priceLabel;
    
}
-(void)config:(NewCarModel*)model;
@property(nonatomic,assign)NewCarModel*dataModel;

@end
