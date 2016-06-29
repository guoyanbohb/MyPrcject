//
//  SaleNumViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/22.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "SaleNumViewController.h"
#import "SaleNumModel.h"
#import "SaleNumCell.h"
@interface SaleNumViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView*_tableView;
    
    //网址字符串拼接
    NSString*_type;
}
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation SaleNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    _type=@"0";
    [ [ UINavigationBar appearance] setBarTintColor:[UIColor whiteColor ] ] ;
    [self createHeaderButton];

    self.view.backgroundColor=[UIColor whiteColor];
    [self createTableView];
    
    [self loadData];
    

    // Do any additional setup after loading the view.
}
-(void)createHeaderButton{

    UIView*view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    NSArray*titleArray=@[@"轿车",@"SUV",@"MPV"];
    for (int i=0; i<3; i++) {
        float a=WIDTH/3;
        UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(i*a, 0, a, 40) Target:self Method:@selector(buttonClick:) Title:titleArray[i] ImageName:nil BgImageName:nil];
        button.tag=100+i;
        [view addSubview:button];
    }
    
    
    
}
#pragma mark button点击事件
-(void)buttonClick:(UIButton*)button{

    switch (button.tag) {
        case 100:
            //轿车
        {
            NSLog(@"100");
              _type=@"0";
//            [_tableView reloadData];   注意 此处必须是[self loadData];才能读出数据
            [self loadData];
        }
            break;
        case 101:
            //SUV
        {
            NSLog(@"101");
            _type=@"1";
           [self loadData];
        }
            
            break;
        case 102:
            //MPV
        {
            NSLog(@"102");
            _type=@"2";
            
           [self loadData];
        }
            break;
        default:
            break;
    }
    [_tableView reloadData];
}
-(void)loadData{

    //http://223.99.255.20/app.api.autohome.com.cn/autov5.5.0/Dealer/hotsaleseries-pm1-st1.json
    //[NSString stringWithFormat:SALENUM,_type]
    //@"http://223.99.255.20/app.api.autohome.com.cn/autov5.5.0/Dealer/hotsaleseries-pm1-st2.json"
       HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:SALENUM,_type] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        
        if (isSuccess) {
           
            NSArray*array=[NSArray array];
            
            array =xx.dataDic[@"result"][@"list"];
            
            self.dataArray=xx.dataDic[@"result"][@"list"];

            
           
            [_tableView reloadData];
        }
    }];
    http=nil;
}
#pragma mark 模型转换
//-(void)createDataToModel:(NSArray*)array{
//    
//    if (self.dataArray==nil) {
//        self.dataArray=[NSMutableArray array];
//    }
//    if (self.dataArray) {
//        [self.dataArray removeAllObjects];
//    }
//
//    for (NSDictionary*dic in array) {
//        
//        SaleNumModel*model=[[SaleNumModel alloc]init];
//        [model setValuesForKeysWithDictionary:dic[@"hotseries"]];
//        [self.dataArray addObject:model];
//    }
//    
//}

-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,40, WIDTH, HEIGTH) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.dataArray[section][@"hotseries"] count];
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SaleNumCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[SaleNumCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
//    SaleNumModel*model=self.dataArray[indexPath.section][@"hotseries"][indexPath.row];
    
    [cell config:self.dataArray[indexPath.section][@"hotseries"][indexPath.row]];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
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
