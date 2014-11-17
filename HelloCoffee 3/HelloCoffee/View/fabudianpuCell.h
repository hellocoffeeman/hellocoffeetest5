//
//  fabudianpuCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fabudianpuCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *shangjiamingcheng;
@property (weak, nonatomic) IBOutlet UITextField *xiangxidizhi;
@property (weak, nonatomic) IBOutlet UITextField *yinyeshijian;
@property (weak, nonatomic) IBOutlet UITextField *dianhua;
@property (weak, nonatomic) IBOutlet UITextField *zhucehaoma;
@property (weak, nonatomic) IBOutlet UITextField *xingming;

@property (weak, nonatomic) IBOutlet UITextField *lianxidianhua;

- (IBAction)btnDown:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *fanhui;

@property (weak, nonatomic) IBOutlet UIButton *querentijiao;


@end
