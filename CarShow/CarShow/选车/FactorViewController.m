//
//  FactorViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/23.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "FactorViewController.h"
#import "FactorModel.h"
#import "FactorCell.h"
#import "FToEViewController.h"
@interface FactorViewController ()
{
    int num;
    
    
    //网络请求数据
    NSMutableArray*array1;
    
    
    
}
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation FactorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    

    self.navigationController.navigationBarHidden=NO;

    [self createHeaderButton];
    
    [self createCollectionView];
    
    [self loadData];
    
   
    
    //在3中接收到广播
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationClick:) name:@"notification" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationClick:) name:@"notification1" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationClick:) name:@"notification2" object:nil];
       // Do any additional setup after loading the view.
}
-(void)notificationClick:(NSNotification*)notification{

    NSDictionary*dic=notification.userInfo;
    if (_urlArray) {
        _urlArray=nil ;
    }
    NSArray*array=[dic allKeys];
    //p l
    NSArray*array7=[dic allValues];
  
    _urlArray=@[array7[0],array[1],array7[1],array7[2]];
//    NSLog(@"%@",_urlArray);
//    NSLog(@"在vc3中接收的内容~~%@",_urlArray);
    [self loadData];

}
-(void)loadData{
//    NSArray*urlArray=nil;
    
    
    NSMutableArray*tempUrlArray=[NSMutableArray arrayWithArray:_urlArray];
//    [tempUrlArray setArray:urlArray];


    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:FACTOR,tempUrlArray[0],tempUrlArray[1],tempUrlArray[2],tempUrlArray[3]] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        if (isSuccess) {
            array1=xx.dataDic[@"data"][@"List"];
//            NSLog(@"%@",array);
//            self.dataArray=array;
            
            [self createDataToModel:array1];
            
            [_collectionView reloadData];
            
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
        
        FactorModel*model=[[FactorModel alloc]init];
        
        
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
}

-(void)createCollectionView{

    
    //创建约束 系统默认约束
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 40, WIDTH, HEIGTH-40-64)collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor lightGrayColor];
    //纵向滑动
   layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    //设置每个item的大小
    float w=WIDTH/2;
    float h=w*0.9;
    
    layout.itemSize=CGSizeMake(w, h);
    
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    
    //注册cell
    [_collectionView registerClass:[FactorCell class] forCellWithReuseIdentifier:@"ID"];
    [self.view addSubview:_collectionView];
    
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    //设置每个item的大小
    float w=WIDTH/2;
    float h=w*1.2;
    return CGSizeMake(WIDTH/2-10, h);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
//每个UICollectionView展示的内容
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FactorCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    FactorModel*model=self.dataArray[indexPath.row];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.Picture] placeholderImage:nil];
    cell.titleLabel.text=model.Name;
    cell.priceLabel.text=model.DealerPrice;

    return cell;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)createHeaderButton{

    NSArray*titleArray=@[@"最畅销",@"最贵",@"最便宜"];
    for (int i=0; i<titleArray.count; i++) {
        headerButton=[ZCControl createButtonWithFrame:CGRectMake(i*WIDTH/3, 0, WIDTH/3, 40) Target:self Method:@selector(headerButtonClick:) Title:titleArray[i] ImageName:nil BgImageName:nil];
        headerButton.tag=200+i;
        if (!i) {
            [headerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }else{
            [headerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }

        [self.view addSubview:headerButton];
    }
  }
-(void)headerButtonClick:(UIButton*)button{

       
    for (int i=0; i<3; i++) {
        UIButton*temp=(UIButton*)[button.superview viewWithTag:200+i];
        [temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    switch (button.tag) {
        case 200:
            //最畅销
        {
//            NSLog(@"200");
            _urlArray=@[@"480176545.15789",@"p",@"0-5",@"4"];
        [self loadData];
        }
            break;
        case 201:
            //最贵
        {
//            NSLog(@"201");
            _urlArray=@[@"480176593.522968",@"p",@"0-5",@"3"];
        [self loadData];
        }
            break;
        case 202:
            //最便宜
        {
//            NSLog(@"202");
            _urlArray=@[@"480176618.672258",@"p",@"0-5",@"2"];
        [self loadData];
        }
            break;
        default:
            break;
    }
    [self loadData];
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
