//
//  NewCarCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/23.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "NewCarCell.h"

@implementation NewCarCell

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

    //图片
    imageView=[ZCControl createImageViewWithFrame:CGRectMake(20, 20, 100, 80) ImageName:nil];
    [self.contentView addSubview:imageView];
    //名字
    titleLabel=[ZCControl createLabelWithFrame:CGRectMake(130, 25, 100, 15) Font:15 Text:nil];
    [self.contentView addSubview:titleLabel];
    //价格
    priceLabel=[ZCControl createLabelWithFrame:CGRectMake(130, 70, 150, 10) Font:12 Text:nil];
    priceLabel.textColor=[UIColor redColor];
    [self.contentView addSubview:priceLabel];
    
}
-(void)config:(NewCarModel*)model{

    self.dataModel=model;
    //图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.Img] placeholderImage:nil];
    //名字
    titleLabel.text=model.ShowName;
    //价格
    priceLabel.text=model.Price;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
