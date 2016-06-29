//
//  SelectViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "SelectViewController.h"
#import "SelectModel.h"
#import "SelectCell.h"
//销量排行
#import "SaleNumViewController.h"
//上市新车
#import "NewCarViewController.h"
//条件选车 5以下
#import "FactorViewController.h"
//5-8
#import "FToEViewController.h"
//8-12
#import "EToTViewController.h"
//12-18
#import "TToEtViewController.h"
//小型车
#import "MinCarViewController.h"
//紧凑型车
#import "SmallCarViewController.h"
//中型车
#import "MidCarViewController.h"
//SUV
#import "SUVViewController.h"
//右侧TableViewCell
#import "RightSelectModel.h"
#import "RightSelectCell.h"
@interface SelectViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView*_tableView;
    
    UITableView*_rightTableView;
    
    //热门推荐的两个数组
    NSArray*array0;
    NSArray*array1;
    
    //右侧cell
    NSArray*array3;
    //获取每个tableViewcell的masterId进行右侧cell的数据请求
    NSString*str;
}
@property(nonatomic,strong)NSMutableArray*dataArray;
//右侧tableView数据
@property(nonatomic,strong)NSMutableArray*rightDataArray;
@end

@implementation SelectViewController
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    
    [self loadData];
    
    
    // Do any additional setup after loading the view.
}

-(void)loadData{
   
    //上方button请求数据
    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:RECOMMEND Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSucess) {
        
        if (isSucess) {
            
            array0=xx.dataDic[@"data"][@"hotMaster"];
            
            array1=xx.dataDic[@"data"][@"hotSerial"];
            
             [self createHeaderButton];
            [_tableView reloadData];
//             NSLog(@"%@~~~~~~%@",array0,array1);
        }
    }];
    http=nil;
    
    //下面tableViewCell的数据请求
    HttpDownLoad*http1=[[HttpDownLoad alloc]initWithURLStr:SELECT Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        
        if (isSuccess) {
            
            NSArray*array=xx.dataDic[@"data"];
            
//            NSLog(@"商标品牌大战~~~~~~%@",array);
            
            [self createDataToModel:array];
            
            [_tableView reloadData];
        }
    }];
    http1=nil;
   
    [_tableView reloadData];
    
    //右侧tableViewCell请求数据
    HttpDownLoad*rHttp=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:RIGHTCELL,str] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        
        if (isSuccess) {
            
            array3=xx.dataDic[@"data"];
//            NSLog(@"右侧cell~~~~~~~~~~~~~%@",array3);
            self.rightDataArray=xx.dataDic[@"data"];
            
             [_rightTableView reloadData];
        }
    }];
    rHttp=nil;
   

   }
-(void)createHeaderButton{
    
    UIImageView*bgImageView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH,500) ImageName:nil];
    
//    bgImageView.backgroundColor=[UIColor redColor];

//创建顶部的4个button
    //名字
        NSArray*titleArray=@[@"车型收藏",@"销量排行",@"上市新车",@"附近看车"];
    NSArray*imageArray=@[@"btn_shoucangjia_nor.png",@"btn_xiaoshoupaihang_nor.png",@"btn_shangshixinche_press.png",@"ic_fujinkanche_nor.png"];
    
    float a=(WIDTH-40)/4;
    
    for (int i=0; i<titleArray.count; i++) {
        
        //创建button
        UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(20+i*a, 10, a-20, 70) Target:self Method:@selector(buttonClick:) Title:nil ImageName:imageArray[i] BgImageName:nil];
        
        button.tag=100+i;
        
        //titleLabel贴到button上
        UILabel*titleLabel=[ZCControl createLabelWithFrame:CGRectMake(12+i*0.3, 55, 80, 20) Font:12 Text:titleArray[i]];
        
        [button addSubview:titleLabel];
        
        [bgImageView addSubview:button];
    }
    
//条件选车
    UILabel*factorLabel=[ZCControl createLabelWithFrame:CGRectMake(10, 100, 80, 15) Font:15 Text:@"条件选车"];
    
    [bgImageView addSubview:factorLabel];
    
    //更多条件
    UIButton*moreButton=[ZCControl createButtonWithFrame:CGRectMake(WIDTH-80, 100, 80, 15) Target:self Method:@selector(moreButtonClick) Title:@"更多条件>" ImageName:nil BgImageName:nil];
    
    moreButton.titleLabel.font=[UIFont systemFontOfSize:12];
    
    [bgImageView addSubview:moreButton];
    
    //更多条件小button
    NSArray*nameArray=@[@"5万以下",@"5-8万",@"8-12万",@"12-18万",@"小型车",@"紧凑型车",@"中型车",@"SUV"];
    
    float b=(WIDTH-20)/4;
    
    for (int i=0; i<nameArray.count; i++) {
        
        UIButton*selectorButton=[ZCControl createButtonWithFrame:CGRectMake(10+b*(i%4), 135+i/4*40, b-10, 35) Target:self Method:@selector(selectorButtonClick:) Title:nameArray[i] ImageName:nil BgImageName:nil];
        
        selectorButton.tag=200+i;
        
        //边框宽度
        [selectorButton.layer setBorderWidth:1.0];
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 0.3 });
        //边框颜色
        [selectorButton.layer setBorderColor:colorref];
        
        
        [bgImageView addSubview:selectorButton];
    }
//热门推荐
    UILabel*recommendLabel=[ZCControl createLabelWithFrame:CGRectMake(10, 230, 60, 15) Font:15 Text:@"热门推荐"];
    [bgImageView addSubview:recommendLabel];
    
    //创建热门推荐第一排button
    
    float c=(WIDTH-40)/5;
    
    for (int i=0; i<array0.count; i++) {
        
        //创建button
        UIButton*brandButton=[ZCControl createButtonWithFrame:CGRectMake(i*c+20, 250, c, 100) Target:self Method:@selector(brandButtonClick:) Title:nil ImageName:nil BgImageName:nil];
        
//        brandButton.backgroundColor=[UIColor grayColor];
        
        brandButton.tag=300+i;
        
        //创建品牌商标imageView
        UIImageView*brandImageView=[ZCControl createImageViewWithFrame:CGRectMake(10, 10, c-20, 60) ImageName:nil];
        
        [brandButton addSubview:brandImageView];
        
        [brandImageView sd_setImageWithURL:array0[i][@"pic_url"]  placeholderImage:nil];

        //创建品牌名label
        UILabel*brandLabel=[ZCControl createLabelWithFrame:CGRectMake(30, 70, 20, 10) Font:10 Text:nil];
        
        brandLabel.text=array0[i][@"masterName"];
        
        [brandButton addSubview:brandLabel];
        
        [bgImageView addSubview:brandButton];
    }
    
//热门推荐第二排button
    float d=(WIDTH-40)/3;
    
    for (int i=0; i<3; i++) {
        //创建button
        UIButton*carButton=[ZCControl createButtonWithFrame:CGRectMake(20+i*d, 355, d, 150) Target:self Method:@selector(carButtonClick:) Title:nil ImageName:nil BgImageName:nil];
        
        carButton.tag=400+i;
        
        [bgImageView addSubview:carButton];
        
        //创建图片
        UIImageView*carImageView=[ZCControl createImageViewWithFrame:CGRectMake(5, 5, d-10, 100) ImageName:nil];
        
        [carImageView sd_setImageWithURL:array1[i][@"pic_url"] placeholderImage:nil];
        
        [carButton addSubview:carImageView];
        
        //创建名字
        UILabel*carLabel=[ZCControl createLabelWithFrame:CGRectMake(40, 120, 50, 10) Font:12 Text:nil];
        
        carLabel.text=array1[i][@"serialName"];
        
        [carButton addSubview:carLabel];
        
        [bgImageView addSubview:carButton];
        
    }
    
    _tableView.tableHeaderView=bgImageView;
    
  

   
}
#pragma mark 推荐第二排button
-(void)carButtonClick:(UIButton*)button{

}
#pragma mark 推荐第一排button
-(void)brandButtonClick:(UIButton*)button{

    
}

#pragma mark 中间8个button
-(void)selectorButtonClick:(UIButton*)button{

    switch (button.tag) {
            
           
        case 200:
            //5万以下
        {
            FactorViewController*vc=[[FactorViewController alloc]init];
            UILabel*titleLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 0, 100, 64) Font:15 Text:@"选车结果"];
            vc.urlArray=@[@"480176545.15789",@"p",@"0-5",@"4"];

            titleLabel.textAlignment=NSTextAlignmentCenter;
            titleLabel.textColor=[UIColor blueColor];
            vc.navigationItem.titleView=titleLabel;
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 201:
            //5-8万
        {
            FToEViewController*vc=[[FToEViewController alloc]init];
            vc.urlArray=@[@"480176673.292734",@"p",@"5-8",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 202:
            //8-12万
        {
            EToTViewController*vc=[[EToTViewController alloc]init];
            vc.urlArray=@[@"480176776.842719",@"p",@"8-12",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 203:
            //12-18万
        {
            TToEtViewController*vc=[[TToEtViewController alloc]init];
            vc.urlArray=@[@"480176828.546682",@"p",@"12-18",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 204:
            //小型车
        {
            MinCarViewController*vc=[[MinCarViewController alloc]init];
            vc.urlArray=@[@"480176977.846297",@"l",@"2",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    
            
            break;
        case 205:
            //紧凑型车
        {
            SmallCarViewController*vc=[[SmallCarViewController alloc]init];
            vc.urlArray=@[@"480177065.994323",@"l",@"3",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
   
            break;
        case 206:
            //中型车
        {
            MidCarViewController*vc=[[MidCarViewController alloc]init];
            vc.urlArray=@[@"480177139.01511",@"l",@"5",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    
            break;
        case 207:
            //SUV
        {
            SUVViewController*vc=[[SUVViewController alloc]init];
            vc.urlArray=@[@"480177201.669973",@"l",@"8",@"4"];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
   
            break;
            
        default:
            break;
    }
    
}
#pragma mark 更多条件
-(void)moreButtonClick{

}
#pragma mark 顶部4个button
-(void)buttonClick:(UIButton*)button{

    switch (button.tag) {
        case 100:
            //车型收藏
            
            break;
        case 101:
            //销量排行
        {
            SaleNumViewController*vc=[[SaleNumViewController alloc]init];
            UILabel*titleLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 0, 100, 64) Font:15 Text:@"销量排行"];
            titleLabel.textAlignment=NSTextAlignmentCenter;
            titleLabel.textColor=[UIColor blueColor];
            vc.navigationItem.titleView=titleLabel;
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 102:
            //上市新车
        {
            NewCarViewController*vc=[[NewCarViewController alloc]init];
            UILabel*titleLabel=[ZCControl createLabelWithFrame:CGRectMake(0, 0, 100, 64) Font:20 Text:@"上市新车"];
            titleLabel.textAlignment=NSTextAlignmentCenter;
            titleLabel.textColor=[UIColor blueColor];
            vc.navigationItem.titleView=titleLabel;

            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 103:
            //附近看车
            
            break;
            
        default:
            break;
    }
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
        SelectModel*model=[[SelectModel alloc]init];
        
        
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    
    //右侧cell
//    if (self.rightDataArray==nil) {
//        self.rightDataArray=[NSMutableArray array];
//    }
//    if (self.rightDataArray) {
//        [self.rightDataArray removeAllObjects];
//    }
//    for (NSDictionary*dic in array) {
//        RightSelectModel*model=[[RightSelectModel alloc]init];
//        [model setValuesForKeysWithDictionary:dic[@"serialList"]];
//        [self.rightDataArray addObject:model];
//    }
    
}

-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-49) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    
    //右侧tableView
//    _rightTableView=[[UITableView alloc]initWithFrame:CGRectMake(WIDTH, 64, 0, HEIGTH-64-49) style:UITableViewStylePlain];
    _rightTableView.dataSource=self;
    _rightTableView.delegate=self;
    _rightTableView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:_rightTableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_tableView]) {
         return self.dataArray.count;
    }else if ([tableView isEqual:_rightTableView]){
        return [self.rightDataArray[section][@"serialList"] count];
    }
    
    return 0;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_tableView]) {
        SelectCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
        if (cell==nil) {
            cell=[[SelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        }
        
        SelectModel*model=self.dataArray[indexPath.row];
        
        [cell config:model];
        
        return cell;

    }else if ([tableView isEqual:_rightTableView]){
    
        RightSelectCell*cell=[tableView dequeueReusableCellWithIdentifier:@"id"];
        if (cell==nil) {
            cell=[[RightSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        }
        
        [cell config:self.rightDataArray[indexPath.section][@"serialList"][indexPath.row]];
       
        
        return cell;

    }
        
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([tableView isEqual:_tableView]) {
        return 80;
    }
    return 0;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if ([tableView isEqual:_tableView]) {
        return [NSString stringWithFormat:@"%c",'A'+section];
    }
    return nil;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if ([tableView isEqual:_tableView]) {
        _rightTableView.frame=CGRectMake(100, 0, WIDTH-100, HEIGTH-49);
        SelectModel*model=self.dataArray[indexPath.row];
         str=[model.masterId stringValue];
//        NSLog(@"%@",str);
        [self loadData];
//        [_rightTableView reloadData];
    }
}
//设置26段
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual:_tableView]) {
        return self.dataArray.count;
    }
    return 0;
}

//索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{

    if ([tableView isEqual:_tableView]) {
        NSMutableArray*array=[NSMutableArray array];
        for (int i=0; i<26; i++) {
            NSString*str=[NSString stringWithFormat:@"%c",'A'+i];
            [array addObject:str];
            
        }
        return array;

    }
    return nil;
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
