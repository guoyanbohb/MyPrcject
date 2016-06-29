//
//  NewCarViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/23.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "NewCarViewController.h"
#import "NewCarModel.h"
#import "NewCarCell.h"
@interface NewCarViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView*_tableView;
}
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation NewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createTableView];
    
    [self loadData];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)loadData{

    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:NEWCAR Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        if (isSuccess) {
            NSMutableArray*array=xx.dataDic[@"data"];
//            NSLog(@"%@",array);
            [self createDataToModel:array];
            [_tableView reloadData];
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
        NewCarModel*model=[[NewCarModel alloc]init];
        
        
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
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
    
    NewCarCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[NewCarCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    NewCarModel*model=self.dataArray[indexPath.row];
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
