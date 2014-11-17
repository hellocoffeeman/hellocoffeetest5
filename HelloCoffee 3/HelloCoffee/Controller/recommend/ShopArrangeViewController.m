//
//  ShopArrangeViewController.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/14.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ShopArrangeViewController.h"
#import "mianPageCell.h"
@interface ShopArrangeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ShopArrangeViewController

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
    // Do any additional setup after loading the view from its nib.
}
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
    
}
//-(void)btnDown:(UIButton*)btn
//{
//    NSLog(@"%ld",btn.tag);
//    //    进入单店页面
//    }
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
