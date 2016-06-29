//
//  HeadlineCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/1.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadlineModel.h"
@interface HeadlineCell : UITableViewCell
{
    
    

    //一张小图
    UIImageView*mainImageView;
    UILabel*titleLabel;
    UILabel*nameLabel;
    UIImageView*commentImageView;
    UILabel*commentLabel;
    
 
    //三张小图
    UILabel*TitleLabel;
    UIImageView*MainImageView1;
    UIImageView*MainImageView2;
    UIImageView*MainImageView3;
    UILabel*NameLabel;
    UIImageView*CommentImageView;
    UILabel*CommentLabel;

    //一张大图
    UILabel*titleLabel1;
    UIImageView*mainImageView1;
    UILabel*nameLabel1;
    UIImageView*commentImageView1;
    UILabel*commentLabel1;

//视频
    
    //视频图片
    UIImageView*videoImageView;
    
    //视频名字
    UILabel*videoNameLabel;
    
    //播放次数图片
    UIImageView*videoPlayImageView;
    
    //播放次数
    UILabel*videoPlayLabel;
    
    //时间长度图片
    UIImageView*videoTimeImageView;
    
    //时间长度
    UILabel*videoTimeLabel;
   
    
 
}
-(void)config:(HeadlineModel*)model;
@property(nonatomic,assign)HeadlineModel*dataModel;

@end
