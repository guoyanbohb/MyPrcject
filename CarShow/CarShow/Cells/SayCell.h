//
//  SayCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/19.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SayModel.h"
@interface SayCell : UITableViewCell
{

    //头像
    UIImageView*imageView;
    //名字
    UILabel*titleLabel;
    //详情
    UILabel*nameLabel;
    //订阅次数
    UILabel*readLabel;
    //订阅button
    UIButton*button;
}
-(void)config:(SayModel*)model;
@property(nonatomic,assign)SayModel*dataModel;


@end
