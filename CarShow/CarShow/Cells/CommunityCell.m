//
//  CommunityCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/15.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "CommunityCell.h"

@implementation CommunityCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    return self;
}
-(void)makeUI{

//定义不变的
        //头像
    avatarImagView=[ZCControl createImageViewWithFrame:CGRectMake(10, 10, 40, 40) ImageName:nil];
    avatarImagView.layer.cornerRadius=30;
    avatarImagView.layer.masksToBounds=YES;
    [self.contentView addSubview:avatarImagView];
    
    //昵称
    nickNameLabel=[ZCControl createLabelWithFrame:CGRectMake(60, 15, 100, 15) Font:15 Text:nil];
    [self.contentView addSubview:nickNameLabel];
    
    //内容
    contentLabel=[ZCControl createLabelWithFrame:CGRectZero Font:12 Text:nil];
    [self.contentView addSubview:contentLabel];
    
   
    
}
-(void)config:(CommunityModel*)model{

    //头像
    [avatarImagView sd_setImageWithURL:[NSURL URLWithString:model.userAvatar] placeholderImage:nil];
    //昵称
    nickNameLabel.text=model.nickName;
    
    //内容 计算大小
    CGSize size=[model.content boundingRectWithSize:CGSizeMake(200, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    contentLabel.frame=CGRectMake(10, 60, size.width, size.height+10);
    contentLabel.text=model.content;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
