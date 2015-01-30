//
//  baseTabBarViewController.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "baseTabBarViewController.h"
#import "recommend.h"
#import "search.h"
#import "personSelf.h"
@interface baseTabBarViewController ()

@end

@implementation baseTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.viewControllers = [self makeViews];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(NSArray *)makeViews
{
   
    
    
//修改的tabbar
    recommend *recommendVC= [[recommend alloc]init];
    search *searchVC = [[search alloc]init];
    personSelf *personSelfVC = [[personSelf alloc]init];
    
    UINavigationController *recommendNav = [[UINavigationController alloc]initWithRootViewController:recommendVC];
    UINavigationController *searchNav = [[UINavigationController alloc]initWithRootViewController:searchVC];
    UINavigationController *personSelfNav = [[UINavigationController alloc]initWithRootViewController:personSelfVC];
    
//图片自动渲染
    
    NSArray * imageName = @[@"tuijian-wei@2x.png",@"xunmi-wei@2x.png",@"wode-wei@2x.png"];
    NSArray * selectImageName = @[@"tuijian-xuan@2x.png",@"xunmi-xuan@2x.png",@"wode-xuan@2x.png"];
    if (iosVersion >=7.0){
//        IOS7以上版本
    //
    recommendNav.tabBarItem.image = [[UIImage imageNamed:@"tuijian-wei"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //点击图片
    recommendNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tuijian-xuan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    searchNav.tabBarItem.image = [[UIImage imageNamed:@"xunmi-wei"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //点击图片
    searchNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"xunmi-xuan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    personSelfNav.tabBarItem.image = [[UIImage imageNamed:@"wode-wei"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //点击图片
    personSelfNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"wode-xuan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //
    }else{
//        iOS7.0以下版本
        [recommendNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tuijian-xuan"] withFinishedUnselectedImage:[UIImage imageNamed:@"tuijian-wei"]];
        [searchNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"xunmi-xuan"] withFinishedUnselectedImage:[UIImage imageNamed:@"xunmi-wei"]];
        [personSelfNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"wode-xuan"] withFinishedUnselectedImage:[UIImage imageNamed:@"wode-wei"]];
        
    }
    
    NSArray *arr = @[recommendNav,searchNav,personSelfNav];

   return arr;
}




@end
