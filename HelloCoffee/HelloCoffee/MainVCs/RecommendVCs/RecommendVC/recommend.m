//
//  recommend.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "recommend.h"
#import "TableViewCell.h"

#import "httpManager.h"

#import "SDWebImageManager.h"

#import "ShopDetailsViewController.h"
#define H_size 0
#define V_size  1
@interface recommend ()
{
    SDWebImageManager *_manager;
}


@end

@implementation recommend
{
    NSInteger chakanCount;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationItem.title = @" ";
    [MobClick endLogPageView:@"推荐首页开始"];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置 返回键 Title
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
    
    self.table = [[UITableView alloc]init];
    self.table.dataSource = self;
    self.table.delegate = self;
//    self.table.allowsSelection = NO;
    self.table.frame = CGRectMake(0, 20, s_width, s_height-69);
    [self.view addSubview:self.table];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.showsVerticalScrollIndicator = NO;
    self.table.contentSize = self.view.bounds.size ;
    
    [httpManager requestWithUrl:@"" FinishBlock:^(NSData *data) {
        
    } FailedBlock:^{
        
    }];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"推荐首页开始"];
    
    
    if ([self.state isEqualToString:@"1"]) {
        self.tabBarController.tabBar.hidden = YES;
        self.table.frame = CGRectMake(0, 64, s_width, s_height-64);
        self.navigationController.navigationBarHidden = NO;
    }else{
        self.tabBarController.tabBar.hidden = NO;
        self.table.frame = CGRectMake(0, 20, s_width, s_height-69);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selected = NO;
    ShopDetailsViewController *shopDetailVC = [[ShopDetailsViewController alloc]init];
    [self.navigationController pushViewController:shopDetailVC animated:YES];
    NSDictionary * dict=@{@"chakanCount":[NSString stringWithFormat:@"%ld",(long)chakanCount+1]};
    NSNotification * nf=[NSNotification notificationWithName:@"chakan" object:nil userInfo:dict];
    
    [[NSNotificationCenter defaultCenter]postNotification:nf];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (s_height <= 568) {
        return 238;
    }else if (s_height == 667){
        return 238*1.183;
    }else{
        return 238*1.313;
    }
    return 238;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
        
    }
    chakanCount = [cell.chakanCountLabel.text integerValue];
    [cell reloadData];
    [cell actionForIconImg:cell.iconImg andContentView:self];
//    cell.headimageView.image =[UIImage imageNamed:@"zhuti2"];
    cell.iconImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",200+2]];
    cell.headimageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)indexPath.row+100]];
//    cell.headimageView.image = [UIImage imageNamed:@"testPIC.png"];
    if (s_height <= 568) {
        cell.zuo.constant = 50;
        cell.you.constant = 50;
        cell.top.constant = 20;
    }else if (s_height == 667){
        cell.zuo.constant = 63;
        cell.you.constant = 63;
        cell.top.constant = 23;
    }else{
        cell.zuo.constant = 73;
        cell.you.constant = 73;
        cell.top.constant = 26;
    }
    [cell setNeedsUpdateConstraints];
//    [NSLayoutConstraint constraintWithItem:cell.zanCountLabel
//                                 attribute:NSLayoutAttributeRight
//                                 relatedBy:(NSLayoutRelationEqual)
//                                    toItem:cell.fengexian2
//                                 attribute:NSLayoutAttributeLeft multiplier:1.0
//                                  constant:tt];
   
    

   
    
    NSLog(@"x:%f \n y:%f",cell.headimageView.frame.size.width,cell.headimageView.frame.size.height);
    return cell;
}

@end
