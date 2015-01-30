//
//  CreatArticleViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/14.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "CreatArticleViewController.h"

@interface CreatArticleViewController ()
- (IBAction)pickerBtnClick:(id)sender;
- (IBAction)imgBtnClick:(id)sender;




@end

@implementation CreatArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"创建文章" withRightBtn:YES rightButtonTitle:@"提交" rightBtnImageURL:nil target:nil rightBtnAction:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.view.backgroundColor = kBackColor;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  - 视图控件 -
//    self.suggestTextView.delegate = self;
//    self.contactTextField.delegate = self;
    
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

- (IBAction)pickerBtnClick:(id)sender {
}

- (IBAction)imgBtnClick:(id)sender {
}
@end
