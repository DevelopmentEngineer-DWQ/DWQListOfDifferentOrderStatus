# DWQListOfDifferentOrderStatus
仿淘宝全部，待付款，待发货，待收货，待评价订单页面的跳转，电商平台通用

![DWQ-LOGO.jpeg](http://upload-images.jianshu.io/upload_images/2231137-2d862192ad24f9cb.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##引述：
&emsp;&emsp;对于每一个电商平台来说，当用户提交订单或者支付完成时，有那么一个用户习惯是不得不考虑的，那就是这时候用户一般比较喜欢去我的订单页面查看下刚刚购买的商品。所以，我的订单成了每个电商平台不可或缺的模块。今天，就分享一个类似淘宝我的订单标签导航页面的控件，帮帮助开发者快速的构建我的订单页面。效果如下图所示【图为初版，细节尚未完善】

![订单列表6.gif](http://upload-images.jianshu.io/upload_images/2231137-7d198c9cb190bcb1.gif?imageMogr2/auto-orient/strip)

##DWQListOfDifferentOrderStatus
 DWQListOfDifferentOrderStatus框架的组成主要包括了几个部分
- 1.orderHeader,头部标签模块，主要包含的属性，声明的block和实现的方法

```objective-c
//外部决定有多少模块
@property (nonatomic,strong) NSArray * items;

//内部选中某一个模块，传递给外部
@property (nonatomic,copy) void(^itemClickAtIndex)(NSInteger index);

//由外部决定选中哪一个模块
-(void)setSelectAtIndex:(NSInteger)index;
-(void)buttonClick:(UIButton*)button;
```
- 2.DWQOrderListViewController，此控制器主要做的事情是：

```objective-c
1.创建scrollview
2.创建heardView
3.将自动启添加到主控制器中
4.通过scrollview调整heardview的选中
5.为了能够流畅的从上一个页面跳转到指定订单列表，如代付款，待收货等，需要注意的是：
  5.1 -(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    if (self.index) {
        
        [self changeScrollview:self.index];
        
        //UIScrollViewDecelerationRateFast;
        }
    
      }
 
  5.2  -(void)changeScrollview:(NSInteger)index{
    
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(index*_scrollView.bounds.size.width, 0);
    }];
    
   }
在页面即将加载时候通过动画的方式，流畅的跳转到指定页面。
```

##使用方法
1.将DWQView和DWQController两个文件夹拖入工程中

2.在DWQOrderListViewController根绝需求删减增加控制器，如增加退换货等。

3.外部跳转到DWQOrderListViewController，需要跳转指定页面的时候，需要传入一个index。

4.控制器列表中的Cell根据自己需要进行编码


请大家关注我的简书，在GitHub上给个Star噢~~~~~~
