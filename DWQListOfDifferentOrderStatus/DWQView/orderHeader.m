//
//  orderHeader.m
//  YKHXProject
//
//  Created by 杜文全 on 15/11/1.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "orderHeader.h"

@implementation orderHeader

{
    UIView * _redLine ;
}
-(void)setItems:(NSArray *)items
{
    _items = items;
    
    //先清空当前视图上的所有子视图
    for (UIView * view in self.subviews) {
        [view removeFromSuperview];
    }
    
    //添加按钮
    CGFloat itemWidth = DWQMainScreenWidth/items.count;
    CGFloat itemHeight = self.frame.size.height-2;
    
    for (int i = 0; i< items.count;i++ ) {
        UIButton * buton = [[UIButton alloc]init];
        buton.frame = CGRectMake(i*itemWidth, 0, itemWidth, itemHeight);
        [buton setTitle:items[i] forState:UIControlStateNormal];
        [buton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [buton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [buton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        buton.tag = Button_Origin_Tag+i;
        [self addSubview:buton];
        
        if (i == 0) {
            buton.selected = YES;
        }
    }
    
    //加红线
    _redLine = [[UIView alloc]init];
    _redLine.frame = CGRectMake(0, self.frame.size.height-2, itemWidth, 2);
    _redLine.backgroundColor = [UIColor redColor];
    [self addSubview:_redLine];
}

-(void)buttonClick:(UIButton*)button
{
    //获取点击的是第几个button
    NSInteger index = button.tag - Button_Origin_Tag;
    [self setSelectAtIndex:index];
    
    //2、把事件传递出去
    if (self.itemClickAtIndex) {
        _itemClickAtIndex(index);
    }
}
-(void)setSelectAtIndex:(NSInteger)index
{
    //1、先调整自身的视图显示
    for (int i = 0; i < self.items.count; i++) {
        UIButton * bt = [self viewWithTag:i+Button_Origin_Tag];
        
        if (bt.tag-Button_Origin_Tag == index) {
            bt.selected = YES;
           
        }else{
            bt.selected = NO;
        }
    }
    //调整红线的位置
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = _redLine.frame;
        rect.origin.x = index*rect.size.width;
        _redLine.frame = rect;
    }];
}

@end
