//
//  FavourableDetailViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/10.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "FavourableDetailViewController.h"

@interface FavourableDetailViewController ()

@end

@implementation FavourableDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    
    UIWebView*webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH)];
    if (_model.title) {
        
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.url]]];
    }else{
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.NewsUrl]]];
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
