//
//  HeadlineViewController.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "HeadlineViewController.h"
#import "HeadlineModel.h"
#import "HeadlineCell.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
//button详情
#import "BodyButtonDetailViewController.h"
//说车button
#import "SayViewController.h"
//视频
#import "VideoViewController.h"
@interface HeadlineViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{

    UITableView*_tableView;
    
    UIButton*button1;
    
    //最上面button
    UIScrollView*headerScView;
    int headerButton;
    NSArray*titleArray;
    
    //主题页面sc
    UIScrollView*sc;
    NSMutableArray*scArray;
    
    //中间button的数组
    NSArray*bodyButtonArray;
    
    //小白点
    UIPageControl*numPage;
    
    //记录滚动条页数
    int page;
    //上拉刷新关键字
    int num;
    NSTimer*timer;
    
    
    UICollectionView*_collectionView;
    int cNum;
   
}
@property(nonatomic,strong)NSMutableArray*dataArray;
//字符串拼接
@property(nonatomic,strong)NSString*type;


@end

@implementation HeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    num=1;
    _type=@"api.ycapp.yiche.com/appnews/toutiaov64/?page=1&length=20&platform=2";
    
    self.navigationController.navigationBar.translucent=NO;
    [self createHeaderSc];

    
    [self createTableView];
    
    [self loadData];
    
   

    // Do any additional setup after loading the view.
}

-(void)loadData{
    
    
    if ([_type isEqualToString:@"api.ycapp.yiche.com/appnews/toutiaov64/?page=%d&length=20&platform=2"]) {
        
        _type =[NSString stringWithFormat:@"api.ycapp.yiche.com/appnews/toutiaov64/?page=%d&length=20&platform=2",num];
        
        NSLog(@"%@",_type);
    }
    

    
    //为中间的button界面进行数据请求
    HttpDownLoad*http1=[[HttpDownLoad alloc]initWithURLStr:BODYURL Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        
        if (isSuccess) {
            
            bodyButtonArray=xx.dataDic[@"data"][@"list"];
            
            [_tableView reloadData];
        }
    }];
    http1=nil;
    
    
    
    
    //为cell进行数据请求
    HttpDownLoad*http=[[HttpDownLoad alloc]initWithURLStr:[NSString stringWithFormat:@"%@%@",API,_type] Post:NO DataDic:nil Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        if (isSuccess) {
            if ([_type isEqualToString:[NSString stringWithFormat:@"api.ycapp.yiche.com/AppNews/GetAppNewsAlbumList?page=%d&length=20&platform=2",num]]) {
                
                NSArray*array=xx.dataDic[@"data"];
                [self createDataToModel:array];
            }else{
                NSArray*array=xx.dataDic[@"data"][@"list"];
                [self createDataToModel:array];
                
            }
//            NSArray*array=xx.dataDic[@"data"][@"list"];
            
            if ([_type isEqualToString:@"api.ycapp.yiche.com/appnews/toutiaov64/?page=1&length=20&platform=2"]) {
                //要闻
                [self createAdScView];
                
                [_tableView reloadData];
            }else if([_type isEqualToString:@"api.ycapp.yiche.com/media/getnewslist?pageindex=1&pagesize=20"]){
                // 说车  先指空
                _tableView.tableHeaderView=nil;
                //说车headerView创建2个button
                [self createHeaderButton];
                
                [_tableView reloadData];
            }else if([_type isEqualToString:@"api.ycapp.yiche.com/video/getvideolist?categoryid=13&pageindex=1&pagesize=20"]){
                // 视频  先指空
                _tableView.tableHeaderView=nil;
                //说车headerView创建2个button
                [self createVideoHeaderButton];
                
                [_tableView reloadData];
            }else{
            //其他 指空
                _tableView.tableHeaderView=nil;
                
                [_tableView reloadData];
            }
            
            
            [_tableView reloadData];
            
            [header endRefreshing];
            [footer endRefreshing];
        }
    }];
    
    
    http=nil;
    

}
-(void)createDataToModel:(NSArray*)array{
    
//    if (self.dataArray==nil) {
//        self.dataArray=[NSMutableArray array];
//    }
    if (num==1) {
        self.dataArray=[NSMutableArray array];
        
    }else{
    
        
    }
    for (NSDictionary*dic in array) {
        HeadlineModel*model=[[HeadlineModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
}

-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH)style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
//    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    __weak HeadlineViewController*vc=self;
    header=[MJRefreshHeaderView header];
    header.beginRefreshingBlock=^(MJRefreshBaseView*xx){
        num=1;
  
//        [timer invalidate];
//        timer=nil;
        
        [vc loadData];
    };
    header.scrollView=_tableView;
    
    footer=[MJRefreshFooterView footer];
    
    footer.beginRefreshingBlock=^(MJRefreshBaseView*xx){
    //上拉加载
        num+=1;
        
        [vc loadData];
        
        
    };
    footer.scrollView=_tableView;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HeadlineCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[HeadlineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        if ([_type isEqualToString:@"api.ycapp.yiche.com/video/getvideolist?categoryid=-2&pagesize=4"]) {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text = @"全部";
            cell.detailTextLabel.textColor=[UIColor grayColor];
        }
    }
    HeadlineModel*model=self.dataArray[indexPath.row];
    //    NSLog(@"%@",self.dataArray[indexPath.row]);
    
    [cell config:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HeadlineModel*model=self.dataArray[indexPath.row];
    
    CGFloat a;
    if (model.VideoId) {
        //视频
        a=100;
    }else{
        //其他
    if ((model.filePath.length==0||model.mediaName)&&!model.imageCount) {
         //一张小图
        a=100;
    }else{
        //一张大图或三张小图
        if (model.picCover.length>150) {
        //三张小图
        a=140;
        }else{
        //一张大图
            a=180;
            }
        }
    }
    return a;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController*vc=[[DetailViewController alloc]init];
    vc.model=self.dataArray[indexPath.row];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)createHeaderSc{
//    UIImageView*bgImageView=[ZCControl createImageViewWithFrame:CGRectMake(0, 0, WIDTH, 64) ImageName:nil];
//    bgImageView.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:bgImageView];
    
    headerScView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 49)];
    //    sc.pagingEnabled=YES;
    headerScView.bounces=NO;
    //设置下滑条不显示
    [headerScView setShowsHorizontalScrollIndicator:NO];
    headerScView.showsHorizontalScrollIndicator=NO;
    
    titleArray=@[@"要闻",@"说车",@"图片",@"视频",@"推荐",@"新车",@"评测",@"导购"];
    float a=WIDTH/6.8;
    headerScView.contentSize=CGSizeMake(a*titleArray.count, 49);
    
    for (int i=0; i<titleArray.count; i++) {
        button1=[ZCControl createButtonWithFrame:CGRectMake(i*a, 0, a , 49) Target:self Method:@selector(buttonClick:) Title:titleArray[i] ImageName:nil BgImageName:nil];
        button1.backgroundColor=[UIColor whiteColor];
        
        if (!i) {
            [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }else{
            [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
        button1.tag=100+i;
        [headerScView addSubview:button1];
    }
    headerScView.backgroundColor=[UIColor yellowColor];
    self.navigationItem.titleView=headerScView;
//    [bgImageView addSubview:headerScView];
    
}
-(void)buttonClick:(UIButton*)button{
    
    for (int i=0; i<8; i++) {
        UIButton*temp=(UIButton*)[button.superview viewWithTag:100+i];
        [temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if (button.tag==100) {
        //要闻
        _tableView.hidden=NO;
        _type=[NSString stringWithFormat:@"api.ycapp.yiche.com/appnews/toutiaov64/?page=1&length=20&platform=2"];
        [self loadData];
    }else if (button.tag==101){
        //说车
        _tableView.hidden=NO;
        _type=@"api.ycapp.yiche.com/media/getnewslist?pageindex=1&pagesize=20";
        [self loadData];
    }else if (button.tag==102){
        //图片
        _tableView.hidden=NO;
        _type=@"api.ycapp.yiche.com/AppNews/GetAppNewsAlbumList?page=1&length=20&platform=2";
        
//        //删除小白点
//        [numPage removeFromSuperview];
         [self loadData];
    }else if (button.tag==103){
        //视频

        _tableView.hidden=NO;
        
        
//        VideoViewController*vc=[[VideoViewController alloc]init];
//        [self presentViewController:vc animated:NO completion:nil];
        _type=@"api.ycapp.yiche.com/video/getvideolist?categoryid=13&pageindex=1&pagesize=20";
        
        [self loadData];
    }else if (button.tag==104){
        //推荐
        [_tableView.tableHeaderView removeFromSuperview];
        _tableView.hidden=NO;
        _type=@"extapi.ycapp.yiche.com/appnews/getrecommendnewslist?platform=2&deviceid=22A591F2CA8847F81FAF2F1809CFC593&cacheTime=0";
      [self loadData];
    }else if (button.tag==105){
        //新车
        _tableView.tableHeaderView=nil;
        _tableView.hidden=NO;
        _type=@"api.ycapp.yiche.com/news/GetNewsList?categoryid=3&serialid=&pageindex=1&pagesize=20&appver=6.8";
         [self loadData];
    }else if (button.tag==106){
        //评测
        _tableView.tableHeaderView=nil;
        _tableView.hidden=NO;
        _type=@"api.ycapp.yiche.com/news/GetNewsList?categoryid=1&serialid=&pageindex=1&pagesize=20&appver=6.8";
         [self loadData];
    }else if (button.tag==107){
        //导购
        _tableView.tableHeaderView=nil;
        _tableView.hidden=NO;
        _type=@"api.ycapp.yiche.com/news/GetNewsList?categoryid=2&serialid=&pageindex=1&pagesize=20&appver=6.8";
         [self loadData];
    }
    [self loadData];
    
    //下拉刷新
    [header beginRefreshing];
    
}
-(void)createAdScView{
    //创建底层view
    UIView*bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 335)];
    bgView.userInteractionEnabled=YES;
    
    //添加搜索框
    UISearchBar*search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    search.placeholder=@"新闻搜索";
    //显示取消按钮
    search.showsCancelButton=YES;
    search.delegate=self;
    [bgView addSubview:search];
    
    
    //创建sc
    sc=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 45, WIDTH, 200)];
    //分页设置
    sc.pagingEnabled=YES;
    //禁止反弹
    sc.bounces=NO;
    //设置下滑条不显示
    sc.showsHorizontalScrollIndicator=NO;
    
    scArray=[NSMutableArray array];
    
//加上小白点
//    numPage=[[UIPageControl alloc]initWithFrame:CGRectMake(WIDTH-60, 220, 60, 10)];
    numPage.numberOfPages=3;
    
    [self.view addSubview:numPage];
    
    //设置小白点颜色
    numPage.pageIndicatorTintColor=[UIColor lightGrayColor];
    
    //设置当前页小白点颜色
    numPage.currentPageIndicatorTintColor=[UIColor whiteColor];
    
    NSMutableArray* TitleArray=[NSMutableArray array];
    //读取数据
    for (int i=0; i<3; i++) {
        
        HeadlineModel*model=self.dataArray[i];
        [scArray addObject:model.picCover];
        [TitleArray addObject:model.title];
    }
    //设置sc大小
    sc.contentSize=CGSizeMake(WIDTH*scArray.count, 200);
    
    //循环创建imageView
    for (int i=0; i<scArray.count; i++) {
        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, 200)];
        //加载图片
        [imageView sd_setImageWithURL:[NSURL URLWithString:scArray[i]]];
        //新闻标题
        UILabel*titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 170, WIDTH, 30)];
        titleLabel.text=TitleArray[i];
        titleLabel.textColor=[UIColor whiteColor];
        [imageView addSubview:titleLabel];
        [sc addSubview:imageView];
    }
    [bgView addSubview:sc];
    
    //设置sc自动播放
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(adScrollViewClick) userInfo:nil repeats:YES];
    
    //创建下面button
    
    //循环创建button
    for (int i=0; i<bodyButtonArray.count; i++) {
        //创建button
        bodyButton=[ZCControl createButtonWithFrame:CGRectMake(i*WIDTH/5+10, 235,WIDTH/5-20, 100) Target:self Method:@selector(bodyButtonClick:) Title:nil ImageName:nil BgImageName:nil];
       
        bodyButton.tag=250+i;
        
        //创建button的图片
        UIImageView*imageView=[ZCControl createImageViewWithFrame:CGRectMake(i*WIDTH/5+20, 255, 40, 40) ImageName:nil];
        [imageView sd_setImageWithURL:bodyButtonArray[i][@"converImg"] placeholderImage:nil];
        
        [bgView addSubview:imageView];
        
        UILabel*label=[ZCControl createLabelWithFrame:CGRectMake(0, 70,60, 10) Font:12 Text:nil];
        
        label.text=bodyButtonArray[i][@"title"];
        
        //文字居中
        label.textAlignment=NSTextAlignmentCenter;
        
        label.textColor=[UIColor blackColor];
        
        //label加载到button上
        [bodyButton addSubview:label];
        
        //加载到view
        [bgView addSubview:bodyButton];
        
        
    }
    
    //都加在到tableHeaderView
    _tableView.tableHeaderView=bgView;
}
#pragma mark 设置自动播放
-(void)adScrollViewClick{

    //设置偏移量
    page++;
    if (page==2) {
        page=0;
    }
    sc.contentOffset=CGPointMake(page*WIDTH, 0);
}
#pragma mark 随动小白点
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    numPage.currentPage=scrollView.contentOffset.x/WIDTH;
}
#pragma mark 中间button
-(void)bodyButtonClick:(UIButton*)bodyButton1{
    
    switch (bodyButton1.tag) {
        case 250:
            //贷款买车
        {
            BodyButtonDetailViewController*vc=[[BodyButtonDetailViewController alloc]init];
            vc.hidesBottomBarWhenPushed=YES;
            vc.url=@"http://chedai.m.yiche.com/?from=yca7";
            vc.title=@"易车车贷";
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 251:
            //直销车型
        {
            BodyButtonDetailViewController*vc=[[BodyButtonDetailViewController alloc]init];
            vc.hidesBottomBarWhenPushed=YES;
            vc.title=@"易车商城";
            vc.url=@"http://m.yichemall.com/?source=ycapp-zxcar-1";
            
            [self.navigationController pushViewController:vc animated:YES];
        }

            
            break;
        case 252:
            //低价买车
            
        {
            BodyButtonDetailViewController*vc=[[BodyButtonDetailViewController alloc]init];
            vc.hidesBottomBarWhenPushed=YES;
            vc.title=@"惠买车";
            vc.url=@"http://m.ycapp.huimaiche.com/?tracker_u=33_ycappty";
            
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 253:
            //二手车
            
        {
            BodyButtonDetailViewController*vc=[[BodyButtonDetailViewController alloc]init];
            vc.hidesBottomBarWhenPushed=YES;
            vc.url=@"http://m.taoche.com/yicheapp/all/";
            vc.title=@"二手车";
            [self.navigationController pushViewController:vc animated:YES];
        }
    
            break;
        case 254:
            //车型对比
            
            break;
        default:
            break;
    }
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
//    NSLog(@"%@",searchBar.text);
    //变成第一相应对象
    [searchBar resignFirstResponder];
    
    SearchViewController*vc=[[SearchViewController alloc]init];
    vc.title=searchBar.text;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    searchBar.text=nil;
    
    [searchBar resignFirstResponder];
}
//说车headerView创建2个button
-(void)createHeaderButton{
    
    UIView*view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];

    NSArray*titleArray2=@[@"我的订阅",@"发现更多"];
    
    NSArray*imageArray=@[@"ic_wodedingyue.png",@"ic_faxiangengduo.png"];
    
    for (int i=0; i<imageArray.count; i++) {
        UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(i*WIDTH/2, 0, WIDTH/2-0.5, 80) Target:self Method:@selector(headerButtonClick:) Title:nil ImageName:imageArray[i] BgImageName:nil];
        button.tag=500+i;
        
        UILabel*titleLabel=[ZCControl createLabelWithFrame:CGRectMake(72, 75, 60, 15) Font:15 Text:titleArray2[i]];
        
        titleLabel.textAlignment=NSTextAlignmentCenter;
        [button addSubview:titleLabel];
        
        [view addSubview:button];
        
    }
    
    _tableView.tableHeaderView=view;
}
//说车headerView的button实现
-(void)headerButtonClick:(UIButton*)button{


    switch (button.tag) {
        case 500:
        {
            
        }
            break;
        case 501:
        {
            SayViewController*vc=[[SayViewController alloc]init];
            self.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
    
}
#pragma mark 创建视频button
-(void)createVideoHeaderButton{

    
    UIView*bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    bgview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgview];

    NSArray*titleArray1=@[@"原创节目",@"视频社区",@"网络精选"];
    
    
    for (int i=0; i<titleArray1.count; i++) {
        UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(i*WIDTH/3, 0, WIDTH/3, 44) Target:self Method:@selector(videoHeaderButtonClick:) Title:titleArray1[i] ImageName:nil BgImageName:nil];
        button.tag=700+i;
        UIView*upView=[[UIView alloc]initWithFrame:CGRectMake(0, 2, WIDTH, 1)];
        upView.backgroundColor=[UIColor blueColor];
        [button addSubview:upView];
        UIView*downView=[[UIView alloc]initWithFrame:CGRectMake(0, 43, WIDTH, 1)];
        downView.backgroundColor=[UIColor blueColor];
        [button addSubview:downView];
        if (!i) {
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }else{
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }

        
        [bgview addSubview:button];
        
    }
//    _tableView.frame=CGRectMake(0, 44, WIDTH, HEIGTH-44);
    _tableView.tableHeaderView=bgview;
    
}
#pragma mark 视频button实现
-(void)videoHeaderButtonClick:(UIButton*)videoButton{

    for (int i=0; i<3; i++) {
        UIButton*temp=(UIButton*)[videoButton.superview viewWithTag:700+i];
        [temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    [videoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    switch (videoButton.tag) {
        case 700:
            //原创节目
        {
            _type=@"api.ycapp.yiche.com/video/getvideolist?categoryid=13&pageindex=1&pagesize=20";
            [self loadData];

        }
            break;
        case 701:
            //视频社区
        {
            _type=@"api.ycapp.yiche.com/video/getvideolist?categoryid=14&pageindex=1&pagesize=20";
            [self loadData];
            
        }
            break;
        case 702:
            //网络精选
        {
            _type=@"api.ycapp.yiche.com/video/getvideolist?categoryid=15&pageindex=1&pagesize=20";
            [self loadData];
            
        }
            break;
        default:
            break;
    }
    //下拉刷新
    [header beginRefreshing];

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
