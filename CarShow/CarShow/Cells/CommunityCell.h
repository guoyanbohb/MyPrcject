//
//  CommunityCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/15.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunityModel.h"
@interface CommunityCell : UITableViewCell
{

    //用户头像
    UIImageView*avatarImagView;
    
    //用户名
    UILabel*nickNameLabel;
    
    //内容
    UILabel*contentLabel;
    
    //展示图片
    UIImageView*detailImageView;
    
    
}
-(void)config:(CommunityModel*)model;
@property(nonatomic,assign)CommunityModel*dataModel;

@end
