//
//  faBuDianPu.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "faBuDianPu.h"
#import "fabudianpuCell.h"
@interface faBuDianPu ()

@end

@implementation faBuDianPu

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.fabutableview.dataSource = self;
    self.fabutableview.delegate = self;
    self.fabutableview.allowsSelection = NO;
    
//    收回键盘
    [self setUpForDismissKeyboard];
}
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}
#pragma mark tableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (s_height > 800) {
        return s_height;
    }else{
        return 734;
    }
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    fabudianpuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fabudianpuCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"fabudianpuCell" owner:self options:nil]lastObject];
    }
//    返回按钮
    [cell.fanhui addTarget:self action:@selector(backDown) forControlEvents:UIControlEventTouchUpInside];
//    提交按钮
    [cell.querentijiao addTarget:self action:@selector(upDown) forControlEvents:UIControlEventTouchUpInside];

    
    
//    textField    Delegate
    cell.shangjiamingcheng.delegate = self;//tag = 0
    cell.xiangxidizhi.delegate = self; //1
    cell.yinyeshijian.delegate = self;//2
    cell.dianhua.delegate = self;//3
 
    cell.zhucehaoma.delegate = self;//4
    cell.xingming.delegate = self;//5
    cell.lianxidianhua.delegate = self;//6
    
    
    
    return cell;
}
-(void)upDown
{
    NSLog(@"提交店铺信息到服务器的接口");
//    提交店铺信息到服务器的接口
}
-(void)backDown
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark textField 的代理们
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    for (int i = 0 ; i < 7; i++) {
        UITextField *text = (UITextField*)[self.view viewWithTag:i];
        if (text == textField) {
            continue;
        }
        [text resignFirstResponder];
    }
    
    if (textField.tag >= 3) {
        self.view.frame = CGRectMake(0, -230, self.view.frame.size.width, self.view.frame.size.height);
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{   
    if (textField.tag >= 3) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
