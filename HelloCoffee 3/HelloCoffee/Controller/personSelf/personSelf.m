//
//  personSelf.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "personSelf.h"

@interface personSelf ()

@end

@implementation personSelf

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [super viewDidLoad];
    
    
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
