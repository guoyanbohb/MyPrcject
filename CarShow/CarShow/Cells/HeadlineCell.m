//
//  HeadlineCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/1.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "HeadlineCell.h"

@implementation HeadlineCell

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
   

 
   
//一张小图
    float a=(WIDTH-40)/3;
   
    mainImageView=[ZCControl createImageViewWithFrame:CGRectMake(10, 10, a, 80) ImageName:nil];
    [self.contentView addSubview:mainImageView];
    
    titleLabel=[ZCControl createLabelWithFrame:CGRectMake(a+20, 10, WIDTH-a-30, 40) Font:15 Text:nil];
    titleLabel.textColor=[UIColor blackColor];
    //设置自动这行
//    titleLabel.lineBreakMode=UILineBreakModeCharacterWrap;
    titleLabel.numberOfLines=0;
    [self.contentView addSubview:titleLabel];
    
    nameLabel=[ZCControl createLabelWithFrame:CGRectMake(a+20, 75, 150, 15) Font:12 Text:nil];
    nameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:nameLabel];
    
    commentImageView=[ZCControl createImageViewWithFrame:CGRectMake(WIDTH-60, 75, 15, 15) ImageName:nil];
    [self.contentView addSubview:commentImageView];
    
    commentLabel=[ZCControl createLabelWithFrame:CGRectMake(WIDTH-40, 78, 30, 10) Font:12 Text:nil];
    commentLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:commentLabel];
      
    
    
//三张小图
    
    TitleLabel=[ZCControl createLabelWithFrame:CGRectMake(10, 10, WIDTH-20, 15) Font:15 Text:nil];
    TitleLabel.textColor=[UIColor blackColor];
    [self.contentView addSubview:TitleLabel];
    
    MainImageView1=[ZCControl createImageViewWithFrame:CGRectMake(10, 30, a, 80) ImageName:nil];
    [self.contentView addSubview:MainImageView1];
    
    MainImageView2=[ZCControl createImageViewWithFrame:CGRectMake(a+20, 30, a, 80) ImageName:nil];
    [self.contentView addSubview:MainImageView2];
    
    MainImageView3=[ZCControl createImageViewWithFrame:CGRectMake(2*a+30, 30, a, 80) ImageName:nil];
    [self.contentView addSubview:MainImageView3];
    
    NameLabel=[ZCControl createLabelWithFrame:CGRectMake(10, 120, 150, 15) Font:12 Text:nil];
    NameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:NameLabel];
    
    CommentImageView=[ZCControl createImageViewWithFrame:CGRectMake(WIDTH-60, 120, 15, 15) ImageName:nil];
    [self.contentView addSubview:CommentImageView];
    
    
    CommentLabel=[ZCControl createLabelWithFrame:CGRectMake(WIDTH-40, 120, 30, 15) Font:12 Text:nil];
    CommentLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:CommentLabel];
    
    
    
//一张大图
    
    
    titleLabel1=[ZCControl createLabelWithFrame:CGRectMake(10, 10, WIDTH-20, 15) Font:15 Text:nil];
    titleLabel1.textColor=[UIColor blackColor];
    [self.contentView addSubview:titleLabel1];
    
    
    mainImageView1=[ZCControl createImageViewWithFrame:CGRectMake(10, 30, WIDTH-20, 120) ImageName:nil];
    [self.contentView addSubview:mainImageView1];
    
    nameLabel1=[ZCControl createLabelWithFrame:CGRectMake(10, 160, 150, 15) Font:12 Text:nil];
    nameLabel1.textColor=[UIColor grayColor];
    [self.contentView addSubview:nameLabel1];
    
    commentImageView1=[ZCControl createImageViewWithFrame:CGRectMake(WIDTH-60, 160, 15, 15) ImageName:nil];
    [self.contentView addSubview:commentImageView1];
    commentLabel1=[ZCControl createLabelWithFrame:CGRectMake(WIDTH-40, 160, 30, 15) Font:12 Text:nil];
    commentLabel1.textColor=[UIColor grayColor];
    [self.contentView addSubview:commentLabel1];
    
    
//视频
    //视频
    //视频图片
    videoImageView=[ZCControl createImageViewWithFrame:CGRectMake(10, 10, a, 80) ImageName:nil];
    [self.contentView addSubview:videoImageView];
    //视频名字
    videoNameLabel=[ZCControl createLabelWithFrame:CGRectMake(a+20, 10, WIDTH-a-30, 40) Font:15 Text:nil];
    videoNameLabel.textColor=[UIColor blackColor];
    //设置自动这行
    videoNameLabel.numberOfLines=0;
    [self.contentView addSubview:videoNameLabel];
    //播放次数图片
    videoPlayImageView=[ZCControl createImageViewWithFrame:CGRectMake(a+20, 75, 15, 15) ImageName:nil];
    [self.contentView addSubview:videoPlayImageView];
    //播放次数
    videoPlayLabel=[ZCControl createLabelWithFrame:CGRectMake(a+33, 78, 60, 10) Font:12 Text:nil];
    videoPlayLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:videoPlayLabel];
    
    //时间长度图片
    videoTimeImageView=[ZCControl createImageViewWithFrame:CGRectMake(WIDTH-60, 75, 15, 15) ImageName:nil];
    [self.contentView addSubview:videoTimeImageView];
    //时间长度
    videoTimeLabel=[ZCControl createLabelWithFrame:CGRectMake(WIDTH-40, 78, 40, 10) Font:12 Text:nil];
    videoTimeLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:videoTimeLabel];
}
-(void)config:(HeadlineModel*)model{
    self.dataModel=model;
    
    if (model.VideoId) {
        //视频
        //视频
        videoImageView.hidden=NO;
        videoNameLabel.hidden=NO;
        videoPlayImageView.hidden=NO;
        videoPlayLabel.hidden=NO;
        videoTimeImageView.hidden=NO;
        videoTimeLabel.hidden=NO;
        //一张小图
        mainImageView.hidden=YES;
        titleLabel.hidden=YES;
        nameLabel.hidden=YES;
        commentImageView.hidden=YES;
        commentLabel.hidden=YES;
        //三张小图
        TitleLabel.hidden=YES;
        MainImageView1.hidden=YES;
        MainImageView2.hidden=YES;
        MainImageView3.hidden=YES;
        CommentImageView.hidden=YES;
        NameLabel.hidden=YES;
        CommentLabel.hidden=YES;
        //一张大图
        mainImageView1.hidden=YES;
        nameLabel1.hidden=YES;
        commentImageView1.hidden=YES;
        commentLabel1.hidden=YES;
        titleLabel1.hidden=YES;
        
        
        
       
        //视频的图片网址截取
        if (model.ImageLink) {
            //如果存在
            NSString*str=model.ImageLink;
            //去掉这段字符串
            NSArray*array=[str componentsSeparatedByString:@"wapimg-{0}-{1}/"];
            //拼接字符串
            NSString*newUrl=[NSString stringWithFormat:@"%@%@",array[0],array[1]];
           
            [videoImageView sd_setImageWithURL:[NSURL URLWithString:newUrl] placeholderImage:nil];
        }
        
        videoImageView.hidden=NO;
        videoNameLabel.text=model.title;
        
        NSLog(@"~~~~~~~~%@",model.Title);
        videoPlayImageView.image=[UIImage imageNamed:@"ic_bofang.png"];
        videoPlayLabel.text=[NSString stringWithFormat:@"%@次",model.TotalVisit];
        videoTimeImageView.image=[UIImage imageNamed:@"ic_emotion_history.png"];
        videoTimeLabel.text=[NSString stringWithFormat:@"%@",model.Duration];
    }else{
        //其他
   
    if ((model.filePath.length==0||model.mediaName)&&!model.imageCount) {
        
        
//        NSLog(@"一张小照片%@",model.picCover);
        //一张小图
        mainImageView.hidden=NO;
        titleLabel.hidden=NO;
        nameLabel.hidden=NO;
        commentImageView.hidden=NO;
        commentLabel.hidden=NO;
        //三张小图
        TitleLabel.hidden=YES;
        MainImageView1.hidden=YES;
        MainImageView2.hidden=YES;
        MainImageView3.hidden=YES;
        CommentImageView.hidden=YES;
        NameLabel.hidden=YES;
        CommentLabel.hidden=YES;
        //一张大图
        mainImageView1.hidden=YES;
        nameLabel1.hidden=YES;
        commentImageView1.hidden=YES;
        commentLabel1.hidden=YES;
        titleLabel1.hidden=YES;
        //视频
        videoImageView.hidden=YES;
        videoNameLabel.hidden=YES;
        videoPlayImageView.hidden=YES;
        videoPlayLabel.hidden=YES;
        videoTimeImageView.hidden=YES;
        videoTimeLabel.hidden=YES;

        //新车 评测 导购的图片网址截取
        if ([model.picCover rangeOfString:@"-{0}-{1}"].location!=NSNotFound) {
            //如果存在
            NSString*str=model.picCover;
            //去掉这段字符串
            NSArray*array=[str componentsSeparatedByString:@"wapimg-{0}-{1}/"];
            //拼接字符串
            NSString*newUrl=[NSString stringWithFormat:@"%@%@",array[0],array[1]];
            //读取
             [mainImageView sd_setImageWithURL:[NSURL URLWithString:newUrl] placeholderImage:nil];
            
        }else{
            //如果不存在 直接读取
            [mainImageView sd_setImageWithURL:[NSURL URLWithString:model.picCover] placeholderImage:nil];

            
        }
        
       
        titleLabel.text=model.title;
        if (model.mediaName) {
            nameLabel.text=model.mediaName;
        }else{
        nameLabel.text=model.src;
        }
        commentImageView.image=[UIImage imageNamed:@"btn_xiaoxi_press"];
        commentLabel.text=[NSString stringWithFormat:@"%@",model.commentCount];
        
    }else{
        //一张大图或三张小图
        if (model.picCover.length>150) {
            
            
//            NSLog(@"%ld",model.picCover.length);
            //三张小图
            
            //一张小图
            mainImageView.hidden=YES;
            titleLabel.hidden=YES;
            nameLabel.hidden=YES;
            commentImageView.hidden=YES;
            commentLabel.hidden=YES;
            //三张小图
            TitleLabel.hidden=NO;
            MainImageView1.hidden=NO;
            MainImageView2.hidden=NO;
            MainImageView3.hidden=NO;
            CommentImageView.hidden=NO;
            NameLabel.hidden=NO;
            CommentLabel.hidden=NO;
            //一张大图
            mainImageView1.hidden=YES;
            nameLabel1.hidden=YES;
            commentImageView1.hidden=YES;
            commentLabel1.hidden=YES;
            titleLabel1.hidden=YES;
            //视频
            videoImageView.hidden=YES;
            videoNameLabel.hidden=YES;
            videoPlayImageView.hidden=YES;
            videoPlayLabel.hidden=YES;
            videoTimeImageView.hidden=YES;
            videoTimeLabel.hidden=YES;

            
            NSString*str=model.picCover;
            NSArray*array=[str componentsSeparatedByString:@";"];
//            NSLog(@"切割照片网址%@",array);
            
            [MainImageView1 sd_setImageWithURL:[NSURL URLWithString:array[0]] placeholderImage:nil];
            [MainImageView2 sd_setImageWithURL:[NSURL URLWithString:array[1]] placeholderImage:nil];
            [MainImageView3 sd_setImageWithURL:[NSURL URLWithString:array[2]] placeholderImage:nil];
            TitleLabel.text=model.title;
            NameLabel.text=model.src;
            CommentImageView.image=[UIImage imageNamed:@"btn_xiaoxi_press"];
            CommentLabel.text=[NSString stringWithFormat:@"%@",model.commentCount];
            
            
        }else{
            //一张大图
//            NSLog(@"一张大图片%@",model.picCover);
            
            //一张小图
            mainImageView.hidden=YES;
            titleLabel.hidden=YES;
            nameLabel.hidden=YES;
            commentImageView.hidden=YES;
            commentLabel.hidden=YES;
            //三张小图
            TitleLabel.hidden=YES;
            MainImageView1.hidden=YES;
            MainImageView2.hidden=YES;
            MainImageView3.hidden=YES;
            CommentImageView.hidden=YES;
            NameLabel.hidden=YES;
            CommentLabel.hidden=YES;
            //一张大图
            mainImageView1.hidden=NO;
            nameLabel1.hidden=NO;
            commentImageView1.hidden=NO;
            commentLabel1.hidden=NO;
            titleLabel1.hidden=NO;
            //视频
            videoImageView.hidden=YES;
            videoNameLabel.hidden=YES;
            videoPlayImageView.hidden=YES;
            videoPlayLabel.hidden=YES;
            videoTimeImageView.hidden=YES;
            videoTimeLabel.hidden=YES;

            
            
            titleLabel1.text=model.title;
            [mainImageView1 sd_setImageWithURL:[NSURL URLWithString:model.picCover] placeholderImage:nil];
            nameLabel1.text=model.src;
            commentImageView1.image=[UIImage imageNamed:@"btn_xiaoxi_press"];
            commentLabel1.text=[NSString stringWithFormat:@"%@",model.commentCount];
            
            
            }
   
        
    
        }
    
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
