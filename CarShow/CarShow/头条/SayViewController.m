//
//  SayViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/19.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "SayViewController.h"
#import "HeadlineViewController.h"
@interface SayViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView*_tabelView;
    
    NSString* type;
}
@property(nonatomic,strong)NSMutableArray*dataArray;

@end

@implementation SayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    type=@"1";
    
    self.navigationController.navigationBarHidden=NO;
    
    [self createNavButton];
    
    [self createTableView];
    
    [self loadData];
    
    
    // Do any additional setup after loading the view.
}
-(void)createNavButton{
    //背景图view
    UIView*bgView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, 200, 44) ImageName:nil];
    bgView.backgroundColor=[UIColor whiteColor];


    //自媒体
    UIButton*leftButton=[ZCControl createButtonWithFrame:CGRectMake(0, 0, 100, 44) Target:self Method:@selector(headerButtonClick:) Title:@"自媒体" ImageName:nil BgImageName:nil];
    leftButton.tag=601;
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font=[UIFont systemFontOfSize:17];
    [bgView addSubview:leftButton];
    
    //机构
    UIButton*rightButton=[ZCControl createButtonWithFrame:CGRectMake(100, 0, 100, 44) Target:self Method:@selector(headerButtonClick:) Title:@"机构" ImageName:nil BgImageName:nil];
    rightButton.tag=602;
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:17];
    [bgView addSubview:rightButton];
    
    if (leftButton) {
        [leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else{
        [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    self.navigationItem.titleView=bgView;
}
#pragma mark 机构
-(void)headerButtonClick:(UIButton*)button{
    
    for (int i=0; i<2; i++) {
        UIButton*temp=(UIButton*)[button.superview viewWithTag:601+i];
        [temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];


    switch (button.tag) {
        case 601:
            type=@"1";
            [self loadData];
            break;
        case 602:
            type=@"2";
            [self loadData];
            
            break;
        default:
            break;
    }
}


#pragma mark 返回按钮
-(void)backButtonClick{
    
    
    HeadlineViewController*vc=[[HeadlineViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
//    [self popoverPresentationController];
    NSLog(@"iquweuewr");
    

    
}
-(void)loadData{

    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:@"http://api.ycapp.yiche.com/media/getmediainfolist?deviceid=22A591F2CA8847F81FAF2F1809CFC593&type=%@&pageindex=1&pagesize=20",type] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        if (isSuccess) {
            NSArray*array=xx.dataDic[@"data"][@"list"];
            
            [self createDataToModel:array];
            
            [_tabelView reloadData];
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
        SayModel*model=[[SayModel alloc]init];
        
        
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
}

-(void)createTableView{

    _tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    _tabelView.delegate=self;
    _tabelView.dataSource=self;
    [self.view addSubview:_tabelView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SayCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[SayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    SayModel*model=self.dataArray[indexPath.row];
    
    [cell config:model];
    
    return cell;
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
