//
//  SaleNumCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/22.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "SaleNumCell.h"

@implementation SaleNumCell

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
    mainImageView=[ZCControl createImageViewWithFrame:CGRectMake(10, 10, 100, 80) ImageName:nil];
    [self.contentView addSubview:mainImageView];
    //名字
    titleLabel=[ZCControl createLabelWithFrame:CGRectMake(120, 30, 150, 15) Font:15 Text:nil];
    [self.contentView addSubview:titleLabel];
    //价格
    priceLabel=[ZCControl createLabelWithFrame:CGRectMake(120, 65, 200, 10) Font:12 Text:nil];
    priceLabel.textColor=[UIColor redColor];
    [self.contentView addSubview:priceLabel];
    //右上角图片
//    numImageView=[ZCControl createImageViewWithFrame:CGRectMake(WIDTH-60, 0, 40, 60) ImageName:nil];
//    [self.contentView addSubview:numImageView];
//    //右上角计数
//    numLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 0, 40, 40) Font:10 Text:nil];
//    numLabel.textAlignment=NSTextAlignmentCenter;
//    numLabel.textColor=[UIColor whiteColor];
//    [numImageView addSubview:numLabel];
}
-(void)config:(NSDictionary *)model{
//    self.dataModel=model;
    //主图片
    [mainImageView sd_setImageWithURL:[NSURL URLWithString:model[@"img"]] placeholderImage:nil];
    //名字
    titleLabel.text=model[@"seriesname"];
    //价格
    priceLabel.text=model[@"price"];
    //右上角图片
    numImageView.image=[UIImage imageNamed:@"car_red_ranking.png"];
    //右上角计数
//   
//        int a=0;
//        ++a;
//        numLabel.text=[NSString stringWithFormat:@"%d",a];

    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
