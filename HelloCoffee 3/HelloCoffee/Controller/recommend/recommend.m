//
//  recommend.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "recommend.h"
#import "mianPageCell.h"
#import "zhutiCell.h"
#import "faBuDianPu.h"
#import "httpManager.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "ShopArrangeViewController.h"
@interface recommend ()
{
    SDWebImageManager *_manager;
}
- (IBAction)toFaBu:(id)sender;

@end

@implementation recommend

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.allowsSelection = NO;
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [httpManager requestWithUrl:@"" FinishBlock:^(NSData *data) {
        
    } FailedBlock:^{
        
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 170;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%3 ==1) {
    mianPageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mianpage"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"mianPageCell" owner:self options:nil]lastObject];
    }
        cell.mainScroll.contentSize = CGSizeMake((s_width-20)*3, 160);

        cell.clickPrise.tag = 6000+indexPath.row;
        [cell.clickPrise addTarget:self action:@selector(clickPrise:) forControlEvents:UIControlEventTouchUpInside];
//        添加按钮
        for (int i = 0; i < 4; i++) {
            
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake((s_width-20)*i, cell.mainScroll.frame.origin.y, s_width-20, cell.mainScroll.contentSize.height)];
            img.image = [UIImage imageNamed:@"dandian_pic@2x.png"];
            [cell.mainScroll addSubview:img];
            img.userInteractionEnabled  = YES;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((s_width-20)*i, cell.mainScroll.frame.origin.y, s_width-20, cell.mainScroll.contentSize.height);
//
            [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
             btn.tag = indexPath.row+5000;
            [cell.mainScroll addSubview:btn];
//            [img addSubview:btn];

        }
//        cell上的属性
        cell.price.text = @"120";
        return  cell;
        
    }else{
//        主题cell
        zhutiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhutiCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"zhutiCell" owner:self options:nil]lastObject];
        }
//        
        cell.zhutiScroll.contentSize = CGSizeMake((s_width-20)*4, 160);
        for (int i = 0; i < 4; i++) {
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake((s_width-20)*i, cell.zhutiScroll.frame.origin.y, s_width-20, cell.zhutiScroll.contentSize.height)];
//            img.image = [UIImage imageNamed:@"dandian_pic@2x.png"];
            
//网络获取图片
            [img setImageWithURL:[NSURL URLWithString:@"http://lw.cms.palmtrends.com/upload/day_141106/201411060958473_listthumb_iphone4.jpg"] placeholderImage:[UIImage imageNamed:@"zhutiPic.png"]];
//            img setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#> options:<#(SDWebImageOptions)#>
            [cell.zhutiScroll addSubview:img];
            
            img.userInteractionEnabled  = YES;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((s_width-20)*i, cell.zhutiScroll.frame.origin.y, s_width-20, cell.zhutiScroll.contentSize.height);
            //
            [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = indexPath.row+5000;
            [cell.zhutiScroll addSubview:btn];

            
        }
        
        cell.zhutiText.text = @"那些现磨咖啡的日子";
        
    return  cell;
    }
    
}

-(void)btnDown:(UIButton*)btn
{
    NSLog(@"%ld",btn.tag);
    //    判断是主题还是单店
    if((btn.tag-5000)%3 !=1){
        ShopArrangeViewController *shopArrange = [[ShopArrangeViewController alloc]init];
        [self presentViewController:shopArrange animated:YES completion:nil];
    }
}
-(void)clickPrise:(UIButton*)btn
{
    NSLog(@"给第%ld行的店铺点了个赞！",btn.tag-6000);
//    判断是否点赞 
}
- (IBAction)toFaBu:(id)sender {
    faBuDianPu *dianpu = [[faBuDianPu alloc]init];
    [self presentViewController:dianpu animated:YES completion:nil];
}
@end
