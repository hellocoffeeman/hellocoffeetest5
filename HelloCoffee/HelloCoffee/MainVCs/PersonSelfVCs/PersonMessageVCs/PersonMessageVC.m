//
//  PersonMessageVC.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PersonMessageVC.h"
#import "PersonMessageCell.h"
#import "PersonMessageTwoCell.h"
#import "TalkVC.h"
#import "DianZanViewController.h"
#import "PortraitImageButton.h"

@interface PersonMessageVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_arr3 ;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PersonMessageVC
//-(void)viewWillAppear:(BOOL)animated
//{
//     self.tabBarController.tabBar.hidden = YES;
//    self.navigationController.navigationBarHidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
////    self.tabBarController.tabBar.hidden = NO;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self makeNavWithTitleLabel:@"我的信息" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
     _arr3 = @[@"touxiang60-60-1",@"touxiang60-60-2",@"touxiang60-60-3",@"touxiang60-60-4",@"touxiang60-60-5",@"touxiang60-60-6",@"touxiang60-60-2",@"touxiang60-60-3",@"touxiang60-60-4",@"touxiang60-60-5"];
    
}


#pragma mark tableView's Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3) {
        
    if (s_height == 667) {
       return 60*1.171;
    }else if (s_height == 736){
    return 60*1.293;
    }else{
    return 60;
    }
    }else{
        if (s_height == 667) {
            return 50*1.171;
        }else if (s_height == 736){
            return 50*1.293;
        }else{
            return 50;
        }
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSArray *arr = @[@"dingdantubiao",@"pinglun",@"dianzantubiao"];
    NSArray *arr2 = @[@"订单",@"评论",@"点赞"];
   
    if (indexPath.row < 3) {
        
        PersonMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonMessageCell_iden"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonMessageCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleImg.image = [UIImage imageNamed:arr[indexPath.row]];
        cell.titleLable.text = arr2[indexPath.row];

        return cell;
    }else{
        PersonMessageTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonMessageTwoCell_iden"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonMessageTwoCell" owner:self options:nil]lastObject];
            
             [ cell.iconBtn setPortraitImage:[UIImage imageNamed: _arr3[indexPath.row-3] ] borderWidth:2 hadIdentityImgV:NO identityType:From_Customer identityImageSize:CGSizeMake(0, 0) target:self clickAction:@selector(findThePeople:)];
            
        }
   cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3 ) {
         if (indexPath.row == 1){
        //    评论
            DianZanViewController *ping=[[DianZanViewController alloc] init];
           
            ping.isDianZan=NO;
            ping.hidesBottomBarWhenPushed=YES;
            
            [ping makeNavWithTitleLabel:@"我的评论"];
            
            [ping.sendBtn setTitle:@"发出的评论" forState:UIControlStateNormal];
            [ping.revBtn setTitle:@"收到的评论" forState:UIControlStateNormal];
            [self.navigationController pushViewController:ping animated:YES];
        }else{
        //    点赞
            DianZanViewController *zan=[[DianZanViewController alloc] init];
            zan.isDianZan=YES;
            zan.hidesBottomBarWhenPushed=YES;
            [zan makeNavWithTitleLabel:@"我的点赞"];
            [self.navigationController pushViewController:zan animated:YES];
        }
    }else{
//    数据库和请求
    
    
    TalkVC *talk = [[TalkVC alloc]init];
        
    talk.TitleName = @"刘一帆";
    talk.image = [UIImage imageNamed:_arr3[indexPath.row-3]];
    [self.navigationController pushViewController:talk animated:YES];
    }
    
}

#pragma mark
-(void)findThePeople:(UIButton*)btn
{
    NSLog(@"跳转到下一个界面！！！别人的个人页");
    
}

#pragma mark

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"PersonMessageVC收到内存警报");
}



@end
