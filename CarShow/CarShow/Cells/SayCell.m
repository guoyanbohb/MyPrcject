//
//  SayCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/19.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "SayCell.h"

@implementation SayCell

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

    //头像
    imageView=[ZCControl createImageViewWithFrame:CGRectMake(20, 30, 50, 50) ImageName:nil];
    imageView.layer.cornerRadius=25;
    imageView.layer.masksToBounds=YES;
    [self.contentView addSubview:imageView];
    
    //名字
    titleLabel=[ZCControl createLabelWithFrame:CGRectMake(80, 15, 150, 17) Font:15 Text:nil];
    [self.contentView addSubview:titleLabel];
    
    //详情
    nameLabel=[ZCControl createLabelWithFrame:CGRectMake(80, 50, WIDTH-180, 10) Font:12 Text:nil];
    nameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:nameLabel];
    
    //订阅次数
    readLabel=[ZCControl createLabelWithFrame:CGRectMake(80, 70, 100, 10) Font:12 Text:nil];
    readLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:readLabel];
    
    //订阅button
    button=[ZCControl createButtonWithFrame:CGRectMake(WIDTH-80, 40, 60, 40) Target:self Method:@selector(readButtonCliCk) Title:@"订阅" ImageName:nil BgImageName:nil];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.contentView addSubview:button];
    
    
    
    
}
#pragma mark 订阅button实现
-(void)readButtonCliCk{

}
-(void)config:(SayModel*)model{

    
    //头像
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.mediaHeadImg] placeholderImage:nil];
    
    //名字
    titleLabel.text=model.mediaName;
    
    //详情
    nameLabel.text=model.mediaSummary;
    
    //阅读次数
    readLabel.text=[NSString stringWithFormat:@"已订阅%@次",model.subscribeCount];
    
    //button
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
