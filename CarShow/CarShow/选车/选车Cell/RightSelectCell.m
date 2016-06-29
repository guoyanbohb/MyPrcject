//
//  RightSelectCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/28.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "RightSelectCell.h"

@implementation RightSelectCell

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

    //名字
    titleLabel=[ZCControl createLabelWithFrame:CGRectMake(100, 20, 150, 15) Font:15 Text:nil];
    [self.contentView addSubview:titleLabel];
    
    //价格
    priceLabel=[ZCControl createLabelWithFrame:CGRectMake(100, 55, 200, 10) Font:10 Text:nil];
    [self.contentView addSubview:priceLabel];
}
-(void)config:(RightSelectModel*)rModel{

    titleLabel.text=rModel.serialName;
    
    priceLabel.text=rModel.dealerPrice;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
