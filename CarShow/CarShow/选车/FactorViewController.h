//
//  FactorViewController.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/23.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactorViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
{
    UICollectionView*_collectionView;
    //顶部的3个button
    UIButton*headerButton;
    
    NSIndexPath*tempIndexPath;
    
    
}
@property(nonatomic,copy)NSString*page;
//传入参数
@property(nonatomic,strong)NSArray*urlArray;

@end
