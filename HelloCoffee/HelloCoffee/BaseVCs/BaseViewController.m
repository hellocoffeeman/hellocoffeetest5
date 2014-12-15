//
//  BaseViewController.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"
#import "EGORefreshTableHeaderView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view from its nib.
    [self makeRefresh];
    
}
-(UIRefreshControl*)makeRefresh
{
    _refreshControl = [[UIRefreshControl alloc]init];
    _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"~~刷新~~"];
    [_refreshControl addTarget:self action:@selector(refreshDown) forControlEvents:UIControlEventValueChanged];
    return _refreshControl;
}
-(void)makeToolBar:(NSString*)title
{
    _toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
    //    _toolBar.backgroundColor = [UIColor blueColor];
    [_toolBar setBackgroundImage:[UIImage imageNamed:@"dilan.png"] forToolbarPosition:0 barMetrics:UIBarMetricsDefault];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, s_width-90-50, 44)];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.text = title;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.shadowColor = [UIColor blackColor];
//    titleLabel.shadowOffset = CGSizeMake(0, 1);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc]initWithCustomView:titleLabel];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"fanhui"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    _toolBar.items = [NSArray arrayWithObjects:space,titleItem, nil];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:_toolBar];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
