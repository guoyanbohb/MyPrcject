//
//  BodyButtonDetailViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/19.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "BodyButtonDetailViewController.h"

@interface BodyButtonDetailViewController ()

@end

@implementation BodyButtonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=NO;
    
    UIWebView*webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-49)];
    
    
    if ([_url isEqualToString:@"http://chedai.m.yiche.com/?from=yca7"]) {
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    }else if ([_url isEqualToString:@"http://m.yichemall.com/?source=ycapp-zxcar-1"]){
    
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    }else if ([_url isEqualToString:@"http://m.ycapp.huimaiche.com/?tracker_u=33_ycappty"]){
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    }else if ([_url isEqualToString:@"http://m.taoche.com/yicheapp/all/"]){
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
        
    }
    
    
    
    [self.view addSubview:webView];

    // Do any additional setup after loading the view.
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
