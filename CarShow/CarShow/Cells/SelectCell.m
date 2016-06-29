//
//  SelectCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "SelectCell.h"

@implementation SelectCell

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

    //主图片
    imageView=[ZCControl createImageViewWithFrame:CGRectMake(20, 5, 60, 60) ImageName:nil];
    [self.contentView addSubview:imageView];
    
    //名字
    namelabel=[ZCControl createLabelWithFrame:CGRectMake(100, 30, 150, 20) Font:20 Text:nil];
    [self.contentView addSubview:namelabel];
    
}
-(void)config:(SelectModel*)model{

    [imageView sd_setImageWithURL:[NSURL URLWithString:model.logoUrl] placeholderImage:nil];
    
    
    namelabel.text=model.name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
