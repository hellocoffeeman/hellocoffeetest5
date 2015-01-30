//
//  PersonSettingVC.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PersonSettingVC.h"
#include "PersonMessageCell.h"
#import "AccountBondViewController.h"
#import "NotificationViewController.h"
#import "SuggestViewController.h"
#import "HeadCellView.h"
@interface PersonSettingVC ()
{
    BOOL _isExtand;
}
// 控件
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

// 固定数据
@property (nonatomic, strong) NSArray *functionImageArray;
@property (nonatomic, strong) NSArray *functionNameArray;
// 绑定数据
@property(nonatomic,strong)NSArray *bangTuArr;
@property(nonatomic,strong)NSArray *bangZiArr;

@end

@implementation PersonSettingVC
-(id)init
{
if(self=[super init])
{

}
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"我的设置" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    self.view.backgroundColor = kBackColor;
    self.navigationController.navigationBar.translucent = YES;
    
    //  - 视图控件 -
    // Main Table View
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.scrollEnabled = NO;
   // self.mainTableView.bounces=NO;
    //self.mainTableView.alwaysBounceVertical=YES;
    self.mainTableView.separatorColor = [UIColor clearColor];
    self.mainTableView.frame = CGRectMake(0, 70, s_width, s_width/kPersonFunctionRatio*6);
    // LogoutButton
    self.logoutButton.center = CGPointMake(s_width/2, s_height-(s_height-(s_width/kPersonFunctionRatio*6)-70)/2);
    
    // 数据
    [self initFunctionsArrays];
   //_mainTableView.frame=CGRectMake(_mainTableView.frame.origin.x, _mainTableView.frame.origin.y, _mainTableView.frame.size.width, s_height-64);
}

#pragma mark - 初始化 -

-(void)initFunctionsArrays
{
    self.functionImageArray = @[[UIImage imageNamed:@"id"],[UIImage imageNamed:@"news"],[UIImage imageNamed:@"score"],[UIImage imageNamed:@"feedback"],[UIImage imageNamed:@"remove"],[UIImage imageNamed:@"help"]]; // 功能图标
    
    self.functionNameArray = @[@"账号信息",@"信息通知",@"给APP评分",@"意见建议",@"清除缓存",@"关于我们"];
    _bangTuArr=@[[UIImage imageNamed:@"weibo_icon1"],[UIImage imageNamed:@"wecat_icon1"],[UIImage imageNamed:@"mail"]];
    _bangZiArr=@[@"微博绑定",@"微信绑定",@"邮箱绑定"];
}

//清除缓存
-(void)cleanChane
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
                   , ^{
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];

                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                       NSLog(@"files :%d",[files count]);
                       for(NSString *p in files) {
                           NSError *error;
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           if(
                              [[NSFileManager defaultManager] fileExistsAtPath:path]) {
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                           }
                       }
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
}
-(void)clearCacheSuccess
{
    NSLog(@"clearCacheSuccess");
}
//计算缓存大小
- (NSUInteger)getSize {
    __block NSUInteger size = 0;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        NSFileManager *fileManager=[NSFileManager defaultManager];
         NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];
        NSDirectoryEnumerator *fileEnumerator = [fileManager enumeratorAtPath:cachPath];
        for (NSString *fileName in fileEnumerator) {
            NSString *filePath = [cachPath stringByAppendingPathComponent:fileName];
            NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
            size += [attrs fileSize];
        }
    });
    return size;
}

#pragma mark - TableView  -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonMessageCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonMessageCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    [cell setPersonMessageCellImage:self.functionImageArray[indexPath.row] withTitleLabelText:self.functionNameArray[indexPath.row] withBtnTag:2000+indexPath.row addTarget:nil action:nil];
//    
//    if (indexPath.row == 4) {
//        cell.NextBtn.hidden = YES;
//    }
    cell.titleImg.image=_bangTuArr [indexPath.row];

   // NSLog(@"cell.frame==%f",cell.frame.size.height);
    cell.titleLable.text=_bangZiArr[indexPath.row];
    if(indexPath.row==_bangTuArr.count-1)
    {
       // cell.bottomLine.frame=
        cell.bottomLine.hidden=YES;
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, s_width/kPersonFunctionRatio-1, s_width,1)];
        img.image=[UIImage imageNamed:@"list_lint"];
        [cell.contentView addSubview:img];
        
    }
    return cell;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0&&_isExtand==YES)
    {
        return 3;
    }
    else
    {
        return 0;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 5) {
//        return s_width/kPersonFunctionRatio+1;
//    }
//    return s_width/kPersonFunctionRatio;
            return s_width/kPersonFunctionRatio;
    
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"HeadCellView" owner:nil options:nil];
       HeadCellView *headview = views[0];
   
    headview.leftImg.image=self.functionImageArray[section];
    headview.centerLab.text=self.functionNameArray[section];
    headview.rightImg.image=[UIImage imageNamed:@")"];
    headview.tag=200+section;
    //headview.lineBottom.backgroundColor=[UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    [headview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapDown:)]];
    headview.leftImg.frame=CGRectMake(headview.leftImg.frame.origin.x, headview.leftImg.frame.origin.y, headview.leftImg.image.size.width/2.0, headview.leftImg.image.size.width/2.0);
    if(_isExtand==YES&&section==0)
    {
        headview.rightImg.transform=CGAffineTransformMakeRotation(M_PI_2);
       
    }
    else
    {
        headview.rightImg.transform=CGAffineTransformMakeRotation(0);
        
        
    }
       return headview;
    
}

-(void)TapDown:(UITapGestureRecognizer *)tap
{
    UIView  *view=[tap view];
  //  NSLog(@"view.tag===%d",view.tag);
    switch (view.tag-200) {
        case 0:
        {
           // [self.navigationController pushViewController:[[AccountBondViewController alloc] init] animated:YES]; // 账户绑定
            _isExtand=!_isExtand;
            if(_isExtand)
            {
              _mainTableView.frame=CGRectMake(_mainTableView.frame.origin.x, _mainTableView.frame.origin.y, _mainTableView.frame.size.width, (s_width/kPersonFunctionRatio)*6+3*s_width/kPersonFunctionRatio);
                 self.logoutButton.center = CGPointMake(s_width/2, s_height-(s_height-(s_width/kPersonFunctionRatio*6)-70)/2+3*s_width/kPersonFunctionRatio);
            }
            else
            {
              _mainTableView.frame=CGRectMake(_mainTableView.frame.origin.x, _mainTableView.frame.origin.y, _mainTableView.frame.size.width, (s_width/kPersonFunctionRatio)*6);
                 self.logoutButton.center = CGPointMake(s_width/2, s_height-(s_height-(s_width/kPersonFunctionRatio*6)-70)/2);
            }
            [_mainTableView reloadData];
            // self.mainTableView.scrollEnabled = !self.mainTableView.scrollEnabled;
            
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:[[NotificationViewController alloc] init] animated:YES]; // 消息通知
        }
        case 2:
        {
            // 给APP评分
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[SuggestViewController alloc] init] animated:YES]; // 意见/建议
        }
        case 4:
        {
            // 清除缓存
            [self getSize];
            [self cleanChane];
        }
        case 5:
        {
            // 版本信息
        }
        default:
            break;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
        return s_width/kPersonFunctionRatio;
   
    //return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed = YES;
    
    NSLog(@"indexPath==%d",indexPath.row);

    
}

#pragma mark - Log Out -
- (IBAction)logoutAction:(id)sender {
    
    NSLog(@"  Log Out  ");
    
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
