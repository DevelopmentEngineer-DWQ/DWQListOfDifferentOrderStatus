//
//  DWQOrderListViewController.m
//  DWQListOfDifferentOrderStatus
//
//  Created by 杜文全 on 15/11/1.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//
#define DWQMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define DWQMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define DWQMainScreenBounds [UIScreen mainScreen].bounds
#define Button_Origin_Tag 78

#import "DWQOrderListViewController.h"
#import "orderHeader.h"
#import "waitingPayController.h"
#import "waitingReceiveController.h"
#import "waitingDeliveryController.h"
#import "waitingEvaluateController.h"
#import "allOrderViewController.h"
@interface DWQOrderListViewController ()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    orderHeader *_headView;
    BOOL _isup;
}


@end

@implementation DWQOrderListViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    if (self.index) {
        
        [self changeScrollview:self.index];
        
        //UIScrollViewDecelerationRateFast;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
-(void)createUI{
    self.title=@"订单中心";
    self.view.backgroundColor=[UIColor whiteColor];
    //消除强引用
    __weak typeof(self) weakSelf = self;
    _headView = [[orderHeader alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 40)];
    _headView.items = @[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"];
    
 
    _headView.itemClickAtIndex = ^(NSInteger index){
        [weakSelf adjustScrollView:index];
    };
    [self.view addSubview:_headView];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headView.frame),DWQMainScreenWidth,DWQMainScreenHeight-64-40)];
    _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*5, _scrollView.bounds.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.directionalLockEnabled = YES;
    [self.view addSubview:_scrollView];
    
    [self addViewControllsToScrollView];

}
#pragma mark-将4个controller添加到applecontroller上
-(void)addViewControllsToScrollView
{
    allOrderViewController * allvc = [[allOrderViewController alloc]init];
    allvc.view.backgroundColor = [UIColor redColor];
    allvc.view.frame = CGRectMake(0, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    [_scrollView addSubview:allvc.view];
    [self addChildViewController:allvc];
    
    waitingPayController * daifkvc = [[waitingPayController alloc]init];
    daifkvc.view.frame = CGRectMake(_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    daifkvc.view.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:daifkvc.view];
    [self addChildViewController:daifkvc];
    
    waitingDeliveryController * daifhvc = [[waitingDeliveryController alloc]init];
    
    daifhvc.view.frame = CGRectMake(_scrollView.bounds.size.width*2, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    daifhvc.view.backgroundColor = [UIColor yellowColor];
    [_scrollView addSubview:daifhvc.view];
    [self addChildViewController:daifhvc];
    
    waitingReceiveController * daishvc = [[waitingReceiveController alloc]init];
    daishvc.view.frame = CGRectMake(_scrollView.bounds.size.width*3, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    daishvc.view.backgroundColor = [UIColor purpleColor];
    [_scrollView addSubview:daishvc.view];
    [self addChildViewController:daishvc];
    
    waitingEvaluateController * daipjvc = [[waitingEvaluateController alloc]init];
    daipjvc.view.frame = CGRectMake(_scrollView.bounds.size.width*4, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    daipjvc.view.backgroundColor = [UIColor purpleColor];
    [_scrollView addSubview:daipjvc.view];
    [self addChildViewController:daipjvc];
    
}
#pragma mark-通过点击button来改变scrollview的偏移量
-(void)adjustScrollView:(NSInteger)index
{
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = CGPointMake(index*_scrollView.bounds.size.width, 0);
    }];
}

#pragma mark-选中scorllview来调整headvie的选中
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    [_headView setSelectAtIndex:index];
    
    
}


#pragma mark 测试用
-(void)changeScrollview:(NSInteger)index{
    
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(index*_scrollView.bounds.size.width, 0);
    }];
    
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
