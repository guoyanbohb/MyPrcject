//
//  DetailViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/3.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "DetailViewController.h"
#import "HeadlineModel.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBarHidden=NO;
    
    UIWebView*webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-49)];
    if (_model.VideoId) {
        //视频
        //读取网址成功则直接读取webView
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_model.PlayLink]]];
    }else{
        //其他
        //网络数据请求
        HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:@"http://api.ycapp.yiche.com/struct/GetStructNews?newsId=%@&ts=%@&plat=2",self.model.newsId,self.model.lastModify] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
            //如果成功
            if (isSuccess) {
                //读取网址
                NSString*url=xx.dataDic[@"data"][@"shareData"][@"newsLink"];
                //如果网址为空
                if (!url) {
                    //重新请求数据
                    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:@"http://api.ycapp.yiche.com/struct/GetStructYCNews?newsId=%@&ts=%@&plat=2",self.model.newsId,self.model.lastModify] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
                        //读取网址
                        NSString*url=xx.dataDic[@"data"][@"shareData"][@"newsLink"];
                        //读取webView
                        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
                    }];
                    http=nil;
                }
                //读取网址成功则直接读取webView
                [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
            }
        }];
        http=nil;

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
