//
//  MinCarViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/25.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "MinCarViewController.h"

@interface MinCarViewController ()

@end

@implementation MinCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //重写导航左按钮
    [self createNavLeftButton];
    //重写顶部的3个button
    [self createHeaderButton];
    //把导航重新设置坐标
    _collectionView.frame=CGRectMake(0, 40, WIDTH, HEIGTH-40-64);

    // Do any additional setup after loading the view.
}
-(void)createHeaderButton{
    NSArray*titleArray=@[@"最畅销",@"最贵",@"最便宜"];
    for (int i=0; i<titleArray.count; i++) {
        UIButton* button=[ZCControl createButtonWithFrame:CGRectMake(i*WIDTH/3, 0, WIDTH/3, 40) Target:self Method:@selector(buttonClick:) Title:titleArray[i] ImageName:nil BgImageName:nil];
        button.tag=300+i;
        if (!i) {
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }else{
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
        
        
        [self.view addSubview:button];
    }
    
}
-(void)buttonClick:(UIButton*)button{
    for (int i=0; i<3; i++) {
        UIButton*temp=(UIButton*)[button.superview viewWithTag:200+i];
        [temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //发送通知
    
    NSNotificationCenter*center=[NSNotificationCenter defaultCenter];
    switch (button.tag) {
        case 300:
        {
            //            NSLog(@"00000000000");
            [center postNotificationName:@"notification" object:nil userInfo:@{@"shijian":@"480176977.846297",@"l":@"2",@"s":@"4"}];
        }
            break;
        case 301:
        {
            //            NSLog(@"111111111111");
            
            //第一参数是频道 第二个参数是指定谁接收,第三参数是传输的数据
            [center postNotificationName:@"notification" object:nil userInfo:@{@"shijian":@"480177016.630683",@"l":@"2",@"s":@"3"}];
            
        }
            break;
        case 302:
        {
            //            NSLog(@"222222222222");
            [center postNotificationName:@"notification" object:nil userInfo:@{@"shijian":@"480177038.180566",@"l":@"2",@"s":@"2"}];

            
        }
            
            break;
        default:
            break;
    }
    //    [_collectionView reloadData];
}
-(void)createNavLeftButton{
    
    //navigationButtonReturn
    UIButton*leftButton=[ZCControl createButtonWithFrame:CGRectMake(0, 0, 60, 30) Target:self Method:@selector(leftButtonClick) Title:@"返回" ImageName:@"navigationButtonReturn.png" BgImageName:nil];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    //设置title
    self.navigationItem.titleView=nil;
    self.navigationItem.title=@"选车结果";
}
-(void)leftButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
    
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
