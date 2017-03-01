//
//  orderHeader.h
//  YKHXProject
//
//  Created by 杜文全 on 15/11/1.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//
#define DWQMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define DWQMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define DWQMainScreenBounds [UIScreen mainScreen].bounds
#define Button_Origin_Tag 78

#import <UIKit/UIKit.h>

@interface orderHeader : UIView
//外部决定有多少模块
@property (nonatomic,strong) NSArray * items;

//内部选中某一个模块，传递给外部
@property (nonatomic,copy) void(^itemClickAtIndex)(NSInteger index);

//由外部决定选中哪一个模块
-(void)setSelectAtIndex:(NSInteger)index;
-(void)buttonClick:(UIButton*)button;
@end
