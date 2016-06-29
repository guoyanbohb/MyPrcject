//
//  HeadlineViewController.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "RootViewController.h"

@interface HeadlineViewController : RootViewController
{

    //下拉刷新
    MJRefreshHeaderView*header;
    //上拉加载
    MJRefreshFooterView*footer;
    //中间button
    UIButton*bodyButton;
}
@end
