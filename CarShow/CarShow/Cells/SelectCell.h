//
//  SelectCell.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/14.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectModel.h"
@interface SelectCell : UITableViewCell
{

    //主照片
    UIImageView*imageView;
    //名字
    UILabel*namelabel;
    
}
-(void)config:(SelectModel*)model;

@property(nonatomic,assign)SelectModel*dataModel;
@end
