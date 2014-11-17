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
    self.tabBar.hidden = YES;
    self.tabbarView= [[UIImageView alloc]initWithFrame:CGRectMake(0, s_height-44, s_width, 44)];
    [self.view addSubview:self.tabbarView];
    
    self.tabbarView.image = [UIImage imageNamed:@"tabbar.png"];
   
    self.tabbarView.userInteractionEnabled = YES;
    NSArray *arr = @[@"recommend",@"search",@"my"];
     NSArray *arr2 = @[@"un_recommend",@"un_search",@"un_my"];
    for (int i = 0 ; i < 3;i++  ) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((s_width/3)*i, 0, s_width/3, 44);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",arr2[i]] ] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",arr[i]] ] forState:UIControlStateSelected];
        
       [self.tabbarView addSubview:btn];
        btn.tag = 15000+i;
        
        [btn addTarget:self action:@selector(selectTitle:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            self.selectedIndex = 0;
            btn.selected = YES;
        }
    }
    
    [self makeViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)selectTitle:(UIButton*)btn
{
    self.selectedIndex = btn.tag-15000;
    for (int i = 0 ; i < 3; i++) {
        UIButton *button = (UIButton*)[self.view viewWithTag:15000+i];
        button.selected = NO;
    }
    NSLog(@"btn.tag = %ld",btn.tag);
    btn.selected = YES;
   
    
}
-(void)makeViews
{
    recommend *re= [[recommend alloc]init];
    search *se = [[search alloc]init];
    personSelf *person = [[personSelf alloc]init];
    
    UINavigationController *reNav = [[UINavigationController alloc]initWithRootViewController:re];
    UINavigationController *seNav = [[UINavigationController alloc]initWithRootViewController:se];
    UINavigationController *personNav = [[UINavigationController alloc]initWithRootViewController:person];
    
   NSArray *arr = @[reNav,seNav,personNav];
   
    self.viewControllers = arr;
}


@end
