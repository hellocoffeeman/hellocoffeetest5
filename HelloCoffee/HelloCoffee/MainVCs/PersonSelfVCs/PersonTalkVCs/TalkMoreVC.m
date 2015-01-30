//
//  TalkMoreVC.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "TalkMoreVC.h"

@interface TalkMoreVC ()

@end

@implementation TalkMoreVC
//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//    self.navigationController.navigationBarHidden = YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"聊天信息" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    CGFloat top1=self.top1.constant;
    CGFloat top2=self.top2.constant;
    CGFloat top3=self.top3.constant;
    
    if (s_height <= 568) {
        self.top1.constant = top1;
        self.top2.constant = top2;
        self.top3.constant = top3;
            }else if (s_height == 667){
                self.top1.constant = top1*1.171;
                self.top2.constant = top2*1.171;
                self.top3.constant = top3*1.171;
            }else{
                self.top1.constant = top1*1.293;
                self.top2.constant = top2*1.293;
                self.top3.constant = top3*1.293;
            }
[self.view setNeedsUpdateConstraints];

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
