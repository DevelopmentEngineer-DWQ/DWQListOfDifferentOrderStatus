//
//  DWQMineOrderButtonController.m
//  DWQListOfDifferentOrderStatus
//
//  Created by 杜文全 on 15/11/1.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "DWQMineOrderButtonController.h"
#import "DWQOrderListViewController.h"
#import "allOrderViewController.h"
#import "waitingEvaluateController.h"
#import "waitingDeliveryController.h"
#import "waitingReceiveController.h"
#import "waitingPayController.h"
@interface DWQMineOrderButtonController ()

@end

@implementation DWQMineOrderButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)toAll:(id)sender {
    DWQOrderListViewController *dwqlistOrder=[[DWQOrderListViewController alloc]init];
    dwqlistOrder.index=0;
    [self.navigationController pushViewController:dwqlistOrder animated:YES];
    
}
- (IBAction)PendingPayment:(id)sender {
    DWQOrderListViewController *dwqlistOrder=[[DWQOrderListViewController alloc]init];
    dwqlistOrder.index=1;
    [self.navigationController pushViewController:dwqlistOrder animated:YES];
}

- (IBAction)waitingFoDelivery:(id)sender {
    
    DWQOrderListViewController *dwqlistOrder=[[DWQOrderListViewController alloc]init];
    dwqlistOrder.index=2;
    [self.navigationController pushViewController:dwqlistOrder animated:YES];
}
- (IBAction)watingReceivingGoods:(id)sender {
    
    DWQOrderListViewController *dwqlistOrder=[[DWQOrderListViewController alloc]init];
    dwqlistOrder.index=3;
    [self.navigationController pushViewController:dwqlistOrder animated:YES];
}
- (IBAction)waitingEvaluate:(id)sender {
    
    DWQOrderListViewController *dwqlistOrder=[[DWQOrderListViewController alloc]init];
    dwqlistOrder.index=4;
    [self.navigationController pushViewController:dwqlistOrder animated:YES];
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
