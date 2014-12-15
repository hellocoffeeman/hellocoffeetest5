//
//  ReserveBoxViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ReserveBoxViewController.h"

@interface ReserveBoxViewController ()

@end

@implementation ReserveBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"预定包厢";
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    // 设置 返回键 Title
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
    
    
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
