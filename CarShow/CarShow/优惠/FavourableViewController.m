//
//  FavourableViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "FavourableViewController.h"
#import "FavourableCell.h"
#import "FavourableModel.h"
#import "FavourableDetailViewController.h"
@interface FavourableViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView*_tableView;
}
@property(nonatomic,strong)NSMutableArray*dataArray;


@end

@implementation FavourableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //活动
    _type=@"hd.bitauto.com/baojia/?appid=540ff6b5db742&appkey=b5de92a2c74ade114c08e6ee63f01210&city_id=201&device_id=6C3D4C20A363D3BB7BF6FDF981344EF5&device_type=2&latitude=40.052186&longitude=116.342592&page_num=1&result_count=20&token=049abac1fb520904c8ad029099c0f142";
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createHeaderButton];
    
    [self createTableView];
    
    [self loadData];
    // Do any additional setup after loading the view.
}
-(void)loadData{

    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:@"%@%@",FAVOURABLE,_type] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        if (isSuccess) {
            
            if ([_type isEqualToString:@"hd.bitauto.com/baojia/?appid=540ff6b5db742&appkey=b5de92a2c74ade114c08e6ee63f01210&city_id=201&device_id=6C3D4C20A363D3BB7BF6FDF981344EF5&device_type=2&latitude=40.052186&longitude=116.342592&page_num=1&result_count=20&token=049abac1fb520904c8ad029099c0f142"]) {
//                NSLog(@"11111");
                
                NSArray*array=xx.dataDic[@"data"][@"items"];
                [self createDataToModel:array];
                [_tableView reloadData];
            }else{
            
//                NSLog(@"222");
                
                NSArray*array=xx.dataDic[@"data"][@"list"];
                [self createDataToModel:array];
                [_tableView reloadData];
            }
            
        }
    }];
    http=nil;
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
        
        FavourableModel*model=[[FavourableModel alloc]init];
        
        
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
}
-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-49) style:UITableViewStylePlain];
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
    
    FavourableCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[FavourableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    FavourableModel*model=self.dataArray[indexPath.row];
    
    [cell config:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    FavourableModel*model=self.dataArray[indexPath.row];
    CGFloat a;
    if (model.title) {
//        NSLog(@"我是11111");
        a=WIDTH*0.8+75;
    }else{
//    NSLog(@"我是2222222");
        a=160;
    }
    
    return a;
}
#pragma mark 创建上导航按钮
-(void)createHeaderButton{
    //创建背景图片
    UIImageView*bgImageView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, 64) ImageName:nil];
    UIView*view=[[UIView alloc]initWithFrame:CGRectMake(0, 54, WIDTH, 1)];
    view.backgroundColor=[UIColor blueColor];
    [bgImageView addSubview:view];
  
    //创建右上角地点按钮
    UIButton*addressButton=[ZCControl createButtonWithFrame:CGRectMake(0, 25, 30, 20) Target:self Method:@selector(buttonClick:) Title:@"北京" ImageName:nil BgImageName:nil];
    addressButton.tag=0;
    //设置文字颜色
    [addressButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //设置字体大小
    addressButton.titleLabel.font=[UIFont systemFontOfSize:12];
    
    [bgImageView addSubview:addressButton];
    
    //创建中间两个按钮
    button1=[ZCControl createButtonWithFrame:CGRectMake(WIDTH/2-60, 25, 30, 20) Target:self Method:@selector(buttonClick:) Title:@"活动" ImageName:nil BgImageName:nil];
    button1.titleLabel.font=[UIFont systemFontOfSize:15];
    button1.tag=1;
    [bgImageView addSubview:button1];
    
    
    button2=[ZCControl createButtonWithFrame:CGRectMake(WIDTH/2+20, 25, 30, 20) Target:self Method:@selector(buttonClick:) Title:@"降价" ImageName:nil BgImageName:nil];
    button2.tag=2;
    button2.titleLabel.font=[UIFont systemFontOfSize:15];
    [bgImageView addSubview:button2];
    
    if (button1) {
        [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else{
        [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }

    
    self.navigationItem.titleView=bgImageView;
    
}
#pragma mark 地点
-(void)buttonClick:(UIButton*)button{
    
    for (int i=0; i<2; i++) {
        UIButton*temp=(UIButton*)[button.superview viewWithTag:1+i];
        [temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if (button.tag==1) {
        //活动
//         NSLog(@"活动");
        _type=@"hd.bitauto.com/baojia/?appid=540ff6b5db742&appkey=b5de92a2c74ade114c08e6ee63f01210&city_id=201&device_id=6C3D4C20A363D3BB7BF6FDF981344EF5&device_type=2&latitude=40.052186&longitude=116.342592&page_num=1&result_count=20&token=049abac1fb520904c8ad029099c0f142";
        
        [self loadData];
    }else if (button.tag==2){
    
        //优惠
//        NSLog(@"降价");
        _type=@"ycapp.yiche.com/vendor/getpromotionlist/?cityid=201&sort=0&pageindex=1&pagesize=20&skip=1&p=0-9999&l=0&token=87bc2589c116ae3fdb17533200b326fd";
       
        [self loadData];
    }
    [_tableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    FavourableDetailViewController*vc=[[FavourableDetailViewController alloc]init];
    vc.model=self.dataArray[indexPath.row];
    vc.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:vc animated:YES];
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
