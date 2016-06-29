//
//  RightSelectCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/28.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightSelectModel.h"
@interface RightSelectCell : UITableViewCell
{

    //名字
    UILabel*titleLabel;
    //价格
    UILabel*priceLabel;
}
-(void)config:(RightSelectModel*)rModel;
@property(nonatomic,assign)RightSelectModel*dataModel;


@end
