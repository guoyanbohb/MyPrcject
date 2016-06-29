//
//  CommunityViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityCell.h"
#import "CommunityModel.h"

#import "UMCommunity.h"
@interface CommunityViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView*_tableView;
    
    //中间2个button
    NSArray*array0;
    NSArray*array1;
    
}
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation CommunityViewController
-(void)viewWillAppear:(BOOL)animated{

    UIViewController*communityController=[UMCommunity getFeedsViewController];
    [self.navigationController pushViewController:communityController animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=NO;
    
//    [self createHeaderButton];
    
//    [self createTableView];
    
    [self loadData];
    // Do any additional setup after loading the view.
}
-(void)loadData{

    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:COMMUNITYRECOMMEND Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        
        if (isSuccess) {
            array0=xx.dataDic[@"data"][@"banners"];
            
            array1=xx.dataDic[@"data"][@"talks"];
            
//            NSLog(@"%@~~~~~~~~~%@",array0,array1);
        }
    }];
    http=nil;
    
    HttpDownLoad*http1=[[HttpDownLoad alloc]initWithURLStr:COMMUNITYCELL Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        
        if (isSuccess) {
            NSArray*array=xx.dataDic[@"data"][@"list"];
            
            [self createDataToModel:array];
            
            [_tableView reloadData];
        }
    }];
    http1=nil;
    
    [self createColectionView];
    
    
    
//    [_tableView reloadData];
}

#pragma mark 模型转换
-(void)createDataToModel:(NSArray*)array{
    
    if (self.dataArray==nil) {
        self.dataArray=[NSMutableArray array];
    }
    if (self.dataArray) {
        [self.dataArray removeAllObjects];
    }
    for (NSDictionary*dic in array) {
        CommunityModel*model=[[CommunityModel alloc]init];
        
        
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
}

-(void)createColectionView{
    //创建背景图片
    UIImageView*bgImageView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, 2*(WIDTH-5)/4.0*1.2+2) ImageName:nil];

//创建第一排sc
    self.dataArray=[NSMutableArray array];
    
    for (int i=0; i<4; i++) {
        //计算宽高
        float width=(WIDTH-5)/4.0;
      
        
        UIView*bgView=[ZCControl createViewWithFrame:CGRectMake(1+i%4*width, 1, width-1, width*1.2-1)];
//        bgView.backgroundColor=[UIColor redColor];
        
        [bgImageView addSubview:bgView];
        
        //主图片
        UIImageView*imageView=[ZCControl createImageViewWithFrame:CGRectMake(20, 10, 60, 60) ImageName:nil];
        
        [imageView sd_setImageWithURL:array0[i][@"icon"] placeholderImage:nil];
        
        [bgView addSubview:imageView];
        
        //创建名字label
        UILabel*nameLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 75, 100, 20) Font:15 Text:array0[i][@"name"]];
        
        //文字居中
        nameLabel.textAlignment=NSTextAlignmentCenter;
        
        [bgView addSubview:nameLabel];
        
        //详情label
        UILabel*detailLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 95, 100, 15) Font:12 Text:nil];
        if (i==0) {
            detailLabel.text=[NSString stringWithFormat:@"%@篇帖子",array0[i][@"count"]];
        }else if (i==1){
             detailLabel.text=[NSString stringWithFormat:@"%@个话题",array0[i][@"count"]];
        }else if (i==2){
            detailLabel.text=[NSString stringWithFormat:@"%@篇帖子",array0[i][@"count"]];
        }else if (i==3){
        
            detailLabel.text=[NSString stringWithFormat:@"%@万篇投票",array0[i][@"count"]];
        }
        
        
        detailLabel.textColor=[UIColor grayColor];
        
        detailLabel.textAlignment=NSTextAlignmentCenter;
        
        [bgView addSubview:detailLabel];
        
    }
    
//创建第二排button
    for (int i=0; i<4; i++) {
        //计算宽高
        float width=(WIDTH-5)/4.0;
        
        
        UIView*bgView1=[ZCControl createViewWithFrame:CGRectMake(1+i%4*width, width*1.2+1, width-1, width*1.2-1)];
//        bgView1.backgroundColor=[UIColor redColor];
        
        [bgImageView addSubview:bgView1];
        
        //主图片
        UIImageView*imageView=[ZCControl createImageViewWithFrame:CGRectMake(20, 10, 60, 60) ImageName:nil];
        if (i<3) {
             [imageView sd_setImageWithURL:array1[i][@"icon"] placeholderImage:nil];
        }else{
        
            imageView.image=[UIImage imageNamed:@"subscribe_rectangle.png"];
        }
       
        
        [bgView1 addSubview:imageView];
        
        //创建名字label
        UILabel*nameLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 75, 100, 20) Font:15 Text:nil];
        if (i<3) {
            nameLabel.text=array1[i][@"shortName"];
        }else{
            nameLabel.text=@"添加社区";
        }
        
        //文字居中
        nameLabel.textAlignment=NSTextAlignmentCenter;
        
        [bgView1 addSubview:nameLabel];
        
        //详情label
        UILabel*detailLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 95, 100, 15) Font:12 Text:nil];
        if (i<3) {
//            float a=[array1[i][@"count"]stringValue]/10000;
                        
            
             detailLabel.text=[NSString stringWithFormat:@"%@人讨论",array1[i][@"count"]];
        }
        
        
        detailLabel.textColor=[UIColor grayColor];
        
        detailLabel.textAlignment=NSTextAlignmentCenter;
        
        [bgView1 addSubview:detailLabel];
        
    }

    [_tableView reloadData];
    
    _tableView.tableHeaderView=bgImageView;
}
-(void)createHeaderButton{

    //创建背景图片
    UIImageView*bgImageView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, 64) ImageName:nil];
    
    //创建左上角button
    UIButton*leftButton=[ZCControl createButtonWithFrame:CGRectMake(15, 15, 30, 30) Target:self Method:@selector(leftButtonClick) Title:nil ImageName:@"cheyou_forum_menu_selector_new" BgImageName:nil];
    
    [bgImageView addSubview:leftButton];
    
    //创建右上角button
    UIButton*rightButton=[ZCControl createButtonWithFrame:CGRectMake(WIDTH-65, 15, 30, 30) Target:self Method:@selector(rightButtonClick) Title:nil ImageName:@"ic_fatie_nor.png" BgImageName:nil];
    
    [bgImageView addSubview:rightButton];
    
    
    //创建中间3个button
    NSArray*titleArray=@[@"推荐",@"问答",@"最新"];
    
    for (int i=0; i<titleArray.count; i++) {
        UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(110+i*65, 0, 40, 64) Target:self Method:@selector(buttonClick:) Title:titleArray[i] ImageName:nil BgImageName:nil];
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        button.tag=100+i;
        
        [bgImageView addSubview:button];
    }
    
    
    
    self.navigationItem.titleView=bgImageView;
}
#pragma mark 中间button
-(void)buttonClick:(UIButton*)button{

}

#pragma mark 右上角button
-(void)rightButtonClick{

}
#pragma mark 左上角button
-(void)leftButtonClick{

    
}

-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommunityCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[CommunityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    CommunityModel*model=self.dataArray[indexPath.row];
    
    [cell config:model];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
