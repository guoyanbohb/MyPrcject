//
//  DetailViewController.h
//  CarShow
//
//  Created by 郭彦博 on 16/3/3.
//  Copyright © 2016年 guoyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadlineModel.h"
@interface DetailViewController : UIViewController
@property(nonatomic,assign)HeadlineModel*model;
@property(nonatomic,copy)NSString*type;
@property(nonatomic,copy)NSString*type1;

@end
