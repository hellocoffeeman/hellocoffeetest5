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
    if (iosVersion >=7.0){
//        IOS7以上版本
    //
    recommendNav.tabBarItem.image = [[UIImage imageNamed:@"un_recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //点击图片
    recommendNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    searchNav.tabBarItem.image = [[UIImage imageNamed:@"un_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //点击图片
    searchNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    personSelfNav.tabBarItem.image = [[UIImage imageNamed:@"un_my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //点击图片
    personSelfNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //
    }else{
//        iOS7.0以下版本
        [recommendNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"recommend"] withFinishedUnselectedImage:[UIImage imageNamed:@"un_recommend"]];
        [searchNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"search"] withFinishedUnselectedImage:[UIImage imageNamed:@"un_search"]];
        [personSelfNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"my"] withFinishedUnselectedImage:[UIImage imageNamed:@"un_my"]];
        
    }
    
    NSArray *arr = @[recommendNav,searchNav,personSelfNav];

   return arr;
}




@end
