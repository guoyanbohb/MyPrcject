//
//  MyViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/2/29.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView*_tableView;
}
@property(nonatomic,strong)NSArray*dataArray;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
//    self.navigationController.navigationBar.translucent=NO;
    
//    self.extendedLayoutIncludesOpaqueBars=YES;
    
    [self createTableView];
    
    [self loadData];
    // Do any additional setup after loading the view.
}
-(void)loadData{

    self.dataArray=@[@"消息",@"车秀优惠券",@"我的订单",@"每日任务",@"车币商城",@"收藏夹",@"申请认证",@"财运选车",@"邀请好友",@"意见反馈",@"工具"];
    
    [self createShareButton];
    
    [_tableView reloadData];
    
}
-(void)createShareButton{

    //创建背景图片
    UIImageView*bgImageView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, 150) ImageName:@"bgImageView.png"];
    
    
    float a=WIDTH/5;
           
   //创建按钮
    UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(a+30, 50, 50, 50) Target:self Method:@selector(buttonClick:) Title:nil ImageName:@"shareitem_sinaweibo_normal.png" BgImageName:nil];
        button.tag=101;
        //添加名字
        UILabel*nameLabel=[ZCControl createLabelWithFrame:CGRectMake(a+35, 100, 30, 20) Font:15 Text:@"微博"];
    nameLabel.textColor=[UIColor whiteColor];
        [bgImageView addSubview:nameLabel];
        [bgImageView addSubview:button];
    
    //创建右按钮
    UIButton*button1=[ZCControl createButtonWithFrame:CGRectMake(3*a, 50, 50, 50) Target:self Method:@selector(buttonClick:) Title:nil ImageName:@"btn_yiche_press.png" BgImageName:nil];
    button1.tag=102;
    [bgImageView addSubview:button1];
    UILabel*label2=[ZCControl createLabelWithFrame:CGRectMake(3*a+10, 100, 30, 20) Font:15 Text:@"车秀"];
    label2.textColor=[UIColor whiteColor];
    [bgImageView addSubview:label2];
    
    
    //最上面的标题
    UILabel*nameLabel2=[ZCControl createLabelWithFrame:CGRectMake(WIDTH/2-20, 10, 40, 20) Font:20 Text:@"登录"];
    nameLabel2.textColor=[UIColor whiteColor];
    [bgImageView addSubview:nameLabel2];
    
    
    //创建右上角的设置按钮
    UIButton*settingButton=[ZCControl createButtonWithFrame:CGRectMake(WIDTH-30, 10, 20, 20) Target:self Method:@selector(buttonClick:) Title:nil ImageName:@"more_setting_btn_pressed.png" BgImageName:nil];
    settingButton.tag=103;
    [bgImageView addSubview:settingButton];
    
    _tableView.tableHeaderView=bgImageView;
}
-(void)buttonClick:(UIButton*)button{

}
-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text=self.dataArray[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:self.dataArray[indexPath.row]];
    cell.textLabel.textColor=[UIColor blackColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
            //消息
        {
        
            LoginViewController*vc=[[LoginViewController alloc]init];
            vc.title=@"登陆易车";
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 1:
            //车秀优惠券
        {
            
            LoginViewController*vc=[[LoginViewController alloc]init];
            vc.title=@"登陆易车";
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 2:
            //我的订单
            break;
        case 3:
            //每日任务
        {
            
            LoginViewController*vc=[[LoginViewController alloc]init];
            vc.title=@"登陆易车";
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 4:
            //车币商城
        {
            
            LoginViewController*vc=[[LoginViewController alloc]init];
            vc.title=@"登陆易车";
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 5:
            //收藏夹
            break;
        case 6:
            //申请认证
        {
            
            LoginViewController*vc=[[LoginViewController alloc]init];
            vc.title=@"登陆易车";
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 7:
            //财运选车
            break;
        case 8:
            //邀请好友
            break;
        case 9:
            //意见反馈
            break;
        case 10:
            //工具
            break;
        default:
            break;
    }
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
