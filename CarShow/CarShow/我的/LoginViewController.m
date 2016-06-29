//
//  LoginViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/29.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{

    //用户名
    UITextField*_userNameTextField;
    //密码
    UITextField*_passWordTextField;

}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBarHidden=NO;
    
    [self createNav];
    
    [self createLogin];
    // Do any additional setup after loading the view.
}
-(void)createLogin{

    //微博登陆
    UIButton*weiboButton=[ZCControl createButtonWithFrame:CGRectMake(WIDTH/2-27, 100, 80, 80) Target:self Method:@selector(buttonClick:) Title:nil ImageName:@"btn_login_weibo_nor" BgImageName:nil];
    weiboButton.tag=100;
    [self.view addSubview:weiboButton];
    
    UILabel*nameLabel=[ZCControl createLabelWithFrame:CGRectMake(WIDTH/2, 190, 30, 15) Font:12 Text:@"微博"];
    [self.view addSubview:nameLabel];
    

    
    //用户名
    UIImageView*_userNameIcon=[ZCControl createImageViewWithFrame:CGRectMake(10, 10, 20, 20) ImageName:@"userName.png"];
    
    //设置临时的一个层
    UIImageView*_tempUserNameIcon=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, 40, 40) ImageName:nil];
    [_tempUserNameIcon addSubview:_userNameIcon];
    
//    //加载在输入框内
//   _userNameTextField=[ZCControl createTextFieldWithFrame:CGRectMake(0, 300, WIDTH, 40) Placeholder:@"" Text:<#(NSString *)#> LeftView:<#(UIImageView *)#> RightView:<#(UIImageView *)#> BgImageName:<#(NSString *)#>]
//    _userNameTextField.delegate=self;
//    
//    //设置键盘
//    _userNameTextField.returnKeyType=UIReturnKeyNext;
//    [bgImageView addSubview:_userNameTextField];

}
-(void)buttonClick:(UIButton*)button{

}
-(void)createNav{

    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    headerView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:headerView];
    //名字
    UILabel*titleLabel=[ZCControl createLabelWithFrame:CGRectMake(WIDTH/2-30, 30, 60, 20) Font:15 Text:@"登录易车"];
    titleLabel.textColor=[UIColor blueColor];
    [headerView addSubview:titleLabel];
    
    //返回button
    UIButton*back=[ZCControl createButtonWithFrame:CGRectMake(WIDTH-30, 30, 20, 20) Target:self Method:@selector(buttonClick) Title:@"X" ImageName:nil BgImageName:nil];
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [headerView addSubview:back];
}
-(void)buttonClick{

    [self dismissViewControllerAnimated:self completion:nil];
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
