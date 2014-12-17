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
//    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
//        
//        [self.navigationBar setBarTintColor:[UIColor redColor]];
//        
//        [self.navigationBar setTranslucent:NO];
//        
//    }
//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    // Do any additional setup after loading the view from its nib.
//    [self makeRefresh];
    
}
-(UIRefreshControl*)makeRefresh
{
    _refreshControl = [[UIRefreshControl alloc]init];
    _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"~~刷新~~"];
    [_refreshControl addTarget:self action:@selector(refreshDown) forControlEvents:UIControlEventValueChanged];
    return _refreshControl;
}
//-(void)makeToolBar:(NSString*)title
//{
//    _toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
//    //    _toolBar.backgroundColor = [UIColor blueColor];
//    [_toolBar setBackgroundImage:[UIImage imageNamed:@"dilan.png"] forToolbarPosition:0 barMetrics:UIBarMetricsDefault];
//    
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, s_width-90-50, 44)];
//    titleLabel.font = [UIFont boldSystemFontOfSize:20];
//    titleLabel.text = title;
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textColor = [UIColor whiteColor];
////    titleLabel.shadowColor = [UIColor blackColor];
////    titleLabel.shadowOffset = CGSizeMake(0, 1);
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    
//    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc]initWithCustomView:titleLabel];
//    
//    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"fanhui"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//    
//    _toolBar.items = [NSArray arrayWithObjects:space,titleItem, nil];
//    self.navigationController.navigationBarHidden = YES;
//    [self.view addSubview:_toolBar];
//}
-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr
{
//    static CGFloat t;
//    if(iosVersion >= 7.0){
//        t = 20;
//    }else{
//        t = 0;
//    }
    self.titleImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, s_width, 64)];
    self.titleImg.image = [UIImage imageNamed:@"dilan"];
    self.titleImg.userInteractionEnabled = YES;
    [self.view addSubview:self.titleImg];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
    [self.titleImg addSubview:self.titleLabel];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.titleLabel.userInteractionEnabled = YES;

    self.titleLabel.text = titleLabelStr;
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(15, 20+5, 21, 34);

    [self.leftBtn setImage:[UIImage imageNamed:@"fanhuibai"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.titleImg addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(s_width-44, 5, 21, 34);
    self.rightBtn.hidden = YES;
    [self.titleImg addSubview:self.rightBtn];
}


-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refreshDown
{
    NSLog(@"请重写方法");
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
