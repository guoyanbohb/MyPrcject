//
//  FactorCell.m
//  CarShow
//
//  Created by 郭彦博 on 16/3/23.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import "FactorCell.h"
#import "FactorModel.h"
@implementation FactorCell
-(id)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"FactorCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    
    
    return self;
}


@end

