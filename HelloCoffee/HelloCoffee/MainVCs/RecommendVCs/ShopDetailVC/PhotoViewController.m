//
//  PhotoViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 添加手势 : 单击退出相册
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapAction:)];
    [self.view addGestureRecognizer:backTap];

    // 添加 图片
    self.photoScrollView.frame = CGRectMake(0, s_height/2-s_width/kTopPictureRatio/2, s_width, s_width/kTopPictureRatio);
    
    [self.photoScrollView setScrollViewSize:self.photoScrollView.frame.size delegate:self imageArray:self.pictureArray showPageControl:NO withPageControlLocation:0];
    self.photoScrollView.contentOffset = CGPointMake(s_width*self.currentPage, 0);
    
    NSLog(@"Picture Count = %d || Current Page = %d ",(int)self.pictureArray.count,self.currentPage);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Back Tap Action -
-(void) backTapAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark -  -


#pragma mark -  -


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
