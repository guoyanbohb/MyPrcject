//
//  FavourableCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "FavourableCell.h"
#import "FavourableViewController.h"
@implementation FavourableCell

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
    //活动
    float a=WIDTH*0.8;
    //主图片
    imageView=[ZCControl createImageViewWithFrame:CGRectMake(10, 5, WIDTH-20, a) ImageName:nil];
    [self.contentView addSubview:imageView];
    //新闻标题
    titleLabel=[ZCControl createLabelWithFrame:CGRectMake(15, a+10, WIDTH-30, 15) Font:15 Text:nil];
    titleLabel.textColor=[UIColor blackColor];
    [self.contentView addSubview:titleLabel];
    
    //著作方
    nameLabel=[ZCControl createLabelWithFrame:CGRectMake(15, a+30, WIDTH-30, 15) Font:10 Text:nil];
    nameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:nameLabel];
    
    //开始时间
    startLabel=[ZCControl createLabelWithFrame:CGRectMake(15, a+50, 85, 15) Font:10 Text:nil];
    
    startLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:startLabel];
    
    
    //结束时间
    stopLabel=[ZCControl createLabelWithFrame:CGRectMake(100, a+50, 85, 15) Font:10 Text:nil];
    stopLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:stopLabel];
    
    //创建button
    applyButton=[ZCControl createButtonWithFrame:CGRectMake(WIDTH-120, a+35, 100, 20) Target:self Method:@selector(buttonClick) Title:nil ImageName:@"baoming_btn_press.png" BgImageName:nil];
    [self.contentView addSubview:applyButton];
    
    
    //降价
    
    //主图片
    mainImageView=[ZCControl createImageViewWithFrame:CGRectMake(20, 20, 100, 80) ImageName:nil];
    [self.contentView addSubview:mainImageView];
    //车名
    carNameLabel=[ZCControl createLabelWithFrame:CGRectMake(140, 20, WIDTH-160, 40) Font:15 Text:nil];
    carNameLabel.textColor=[UIColor blackColor];
    [self.contentView addSubview:carNameLabel];
    //现车价格
    actPrice=[ZCControl createLabelWithFrame:CGRectMake(140, 70, 40, 15) Font:12 Text:nil];
    actPrice.textColor=[UIColor redColor];
    [self.contentView addSubview:actPrice];
    //原车价格
    referPrice=[ZCControl createLabelWithFrame:CGRectMake(200, 70, 40, 15) Font:10 Text:nil];
    referPrice.textColor=[UIColor grayColor];
    
    [self.contentView addSubview:referPrice];
    //在原车价格上面贴一个一像素的imageView
    UIImageView*igView=[ZCControl createImageViewWithFrame:CGRectMake(0, 7.5, 32, 1) ImageName:nil];
    igView.backgroundColor=[UIColor grayColor];
    [referPrice addSubview:igView];
    
    
    //绿色的小箭头
    lowImageView=[ZCControl createImageViewWithFrame:CGRectMake(250, 70, 15, 15) ImageName:@"jiantou.png"];
    [self.contentView addSubview:lowImageView];
    //降价幅度
    favPrice=[ZCControl createLabelWithFrame:CGRectMake(270, 70, 65, 15) Font:10 Text:nil];
    favPrice.textColor=[UIColor greenColor];
    [self.contentView addSubview:favPrice];
    //4s
    redLabel=[ZCControl createLabelWithFrame:CGRectMake(140, 95, 25, 10) Font:12 Text:@"4S-"];
    redLabel.textColor=[UIColor redColor];
    [self.contentView addSubview:redLabel];
    //4s店名
    dealerNameLabel=[ZCControl createLabelWithFrame:CGRectMake(165, 95, 100, 10) Font:12 Text:nil];
    dealerNameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:dealerNameLabel];
    //现车充足
    numLabel=[ZCControl createLabelWithFrame:CGRectMake(270, 97, 50, 17) Font:12 Text:nil];
    numLabel.textColor=[UIColor grayColor];
    numLabel.layer.borderColor=[[UIColor grayColor]CGColor];
    numLabel.layer.borderWidth = 0.5f;
    numLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:numLabel];
    //售全国
    saleLabel=[ZCControl createLabelWithFrame:CGRectMake(335, 97, 25, 15) Font:12 Text:nil];
    saleLabel.textColor=[UIColor grayColor];
    saleLabel.layer.borderColor=[[UIColor grayColor]CGColor];
    saleLabel.layer.borderWidth = 0.5f;
    saleLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:saleLabel];
    //手机号
    phoneButton=[ZCControl createButtonWithFrame:CGRectMake(0, 120, WIDTH/2, 40) Target:self Method:@selector(phoneButtonClick) Title:nil ImageName:@"phone.png" BgImageName:nil];
    [self.contentView addSubview:phoneButton];
    
    phoneLabel=[ZCControl createLabelWithFrame:CGRectMake(110, 10, 150, 15) Font:12 Text:nil];
    phoneLabel.textColor=[UIColor blackColor];
    [phoneButton addSubview:phoneLabel];
    //询底价
    lowPriceButton=[ZCControl createButtonWithFrame:CGRectMake(WIDTH/2, 120, WIDTH/2, 40) Target:self Method:@selector(lowPriceButtonClick) Title:@"  询底价" ImageName:@"ic_dijia_nor.png" BgImageName:nil];
    lowPriceButton.titleLabel.font=[UIFont systemFontOfSize:12];
    [lowPriceButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.contentView addSubview:lowPriceButton];

}

#pragma mark 降价 询底价
-(void)lowPriceButtonClick{
    
}
#pragma mark 降价 电话
-(void)phoneButtonClick{
    
    
       UIAlertView*al=[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"%@",phoneLabel.text] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    
    [al show];
    
    
}
#pragma mark 活动 马上报名
-(void)buttonClick{
    
    NSLog(@"点击button");
}
-(void)config:(FavourableModel*)model{
    
    if (model.title) {
        
        mainImageView.hidden=YES;
        carNameLabel.hidden=YES;
        actPrice.hidden=YES;
        referPrice.hidden=YES;
        lowImageView.hidden=YES;
        favPrice.hidden=YES;
        redLabel.hidden=YES;
        dealerNameLabel.hidden=YES;
        numLabel.hidden=YES;
        saleLabel.hidden=YES;
        phoneButton.hidden=YES;
        lowPriceButton.hidden=YES;
        
        imageView.hidden=NO;
        titleLabel.hidden=NO;
        nameLabel.hidden=NO;
        startLabel.hidden=NO;
        stopLabel.hidden=NO;
        applyButton.hidden=NO;

    
//    NSLog(@"button1");
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.images] placeholderImage:nil];
    titleLabel.text=model.title;
    nameLabel.text=model.sponsor;
    NSString*str=model.start_date;
    NSString*starTime=[[str componentsSeparatedByString:@" "]firstObject];
    startLabel.text=[NSString stringWithFormat:@"时间:%@",starTime];
    NSString*str1=model.end_date;
    NSString*stopTime=[[str1 componentsSeparatedByString:@" "]firstObject];
    stopLabel.text=[NSString stringWithFormat:@"至:%@",stopTime];
    
    }else{
//        NSLog(@"button2");

        imageView.hidden=YES;
        titleLabel.hidden=YES;
        nameLabel.hidden=YES;
        startLabel.hidden=YES;
        stopLabel.hidden=YES;
        applyButton.hidden=YES;
        
        mainImageView.hidden=NO;
        carNameLabel.hidden=NO;
        actPrice.hidden=NO;
        referPrice.hidden=NO;
        lowImageView.hidden=NO;
        favPrice.hidden=NO;
        redLabel.hidden=NO;
        dealerNameLabel.hidden=NO;
        numLabel.hidden=NO;
        saleLabel.hidden=NO;
        phoneButton.hidden=NO;
        lowPriceButton.hidden=NO;
        
    //车图名
    [mainImageView sd_setImageWithURL:[NSURL URLWithString:model.CarImage] placeholderImage:nil];
    //车名
    carNameLabel.text=model.CarName;
    //现车价格
    actPrice.text=[NSString stringWithFormat:@"%@万",[model.ActPrice stringValue]];
    //原车价格
    referPrice.text=[NSString stringWithFormat:@"%@万",[model.ReferPrice stringValue]];
    //降价幅度
    favPrice.text=[NSString stringWithFormat:@"%@万",[model.FavPrice stringValue]];
    //4s名
    dealerNameLabel.text=model.DealerName;
    //现车充足
    numLabel.text=model.StoreState;
    //售全国
    saleLabel.text=model.SaleRegion;
    //手机号
    phoneLabel.text=model.CallCenterNumber;
        
        
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
