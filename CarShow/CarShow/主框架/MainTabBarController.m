//
//  MainTabBarController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "MainTabBarController.h"
#import "HeadlineViewController.h"
#import "CommunityViewController.h"
#import "SelectViewController.h"
#import "FavourableViewController.h"
#import "MyViewController.h"
#import "RootViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViewControllers];
    
    [self createTabBar];
    
    
    // Do any additional setup after loading the view.
}

-(void)backClick{
    
    [self.nc popViewControllerAnimated:YES];
}
-(void)createTabBar{
    
    
    
    NSArray*unSelectImageNameArray=@[[UIImage imageNamed:@"btn_toutiao_nor.9"],[UIImage imageNamed:@"btn_shequ_nor.9"],[UIImage imageNamed:@"btn_xuanche_nor.9"],[UIImage imageNamed:@"btn_jiangjia_nor.9"],[UIImage imageNamed:@"btn_wode_nor.9"]];
    NSArray*selectImageNameArray=@[[UIImage imageNamed:@"btn_toutiao_select.9"],[UIImage imageNamed:@"btn_shequ_select.9"],[UIImage imageNamed:@"btn_xuanche_select.9"],[UIImage imageNamed:@"btn_jiangjia_select.9"],[UIImage imageNamed:@"btn_wode_select.9"]];
    for (int i=0; i<selectImageNameArray.count; i++) {
        UITabBarItem*item=self.tabBar.items[i];
        item=[item initWithTitle:nil image:[unSelectImageNameArray[i]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectImageNameArray[i]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    
}
-(void)createViewControllers{
    
    HeadlineViewController*vc1=[[HeadlineViewController alloc]init];
    UINavigationController*nc1=[[UINavigationController alloc]initWithRootViewController:vc1];
    
    CommunityViewController*vc2=[[CommunityViewController alloc]init];
    UINavigationController*nc2=[[UINavigationController alloc]initWithRootViewController:vc2];
    
    SelectViewController*vc3=[[SelectViewController alloc]init];
    UINavigationController*nc3=[[UINavigationController alloc]initWithRootViewController:vc3];
    
    FavourableViewController*vc4=[[FavourableViewController alloc]init];
    UINavigationController*nc4=[[UINavigationController alloc]initWithRootViewController:vc4];
    
    MyViewController*vc5=[[MyViewController alloc]init];
    
    UINavigationController *nc5=[[UINavigationController alloc]initWithRootViewController:vc5];
    
    self.viewControllers=@[nc1,nc2,nc3,nc4,nc5];
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
