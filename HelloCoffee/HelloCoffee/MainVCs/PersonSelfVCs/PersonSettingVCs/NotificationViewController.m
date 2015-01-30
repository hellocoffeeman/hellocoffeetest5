//
//  NotificationViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/30.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "NotificationViewController.h"
#import "LabelSwitchTableViewCell.h"
#import "FristLabSwitchCell.h"
@interface NotificationViewController ()

// 控件
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

// 数据
@property (nonatomic, assign) BOOL openNotify;
@property (nonatomic, strong) NSArray *NotificationNameArray;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"消息通知" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    
    //  - 视图控件 -
    // Main Table View
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.scrollEnabled = NO;
    self.mainTableView.separatorColor = [UIColor clearColor];
    self.mainTableView.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    
    // 数据
    self.NotificationNameArray = @[@"消息提醒",@"回复我",@"新粉丝",@"聊天通知",@"精彩内容推送"];
    self.openNotify = YES;
}


//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//}

#pragma mark - TableView  -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row!=0)
    {
    LabelSwitchTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"LabelSwitchTableViewCell" owner:self options:nil]lastObject];
    
    [(LabelSwitchTableViewCell *)cell setFuncNameString:self.NotificationNameArray[indexPath.row] switchTag:2000+indexPath.row  switchOn:self.openNotify target:self switchAction:@selector(aSwitchAction:)];
    
    if (indexPath.row == 0) cell.segmentLine.alpha = 1.0;
    else cell.segmentLine.alpha = 0.3;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
        
       }
    else
    {
        FristLabSwitchCell *cell=[[[NSBundle mainBundle] loadNibNamed:@"FristLabSwitchCell" owner:self options:nil] lastObject];
        
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
   

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.NotificationNameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    return s_width/kPersonFunctionRatio;
    
    
    if(indexPath.row!=0)
    {
    return 60;
    }
    else
     {
         return 140;
    }
}

#pragma mark - Action -
-(void)aSwitchAction:(UISwitch *)aSwitch
{
    NSLog(@" Notification Switch Tag:%d on:%d",(int)aSwitch.tag,aSwitch.on);
    
        switch (aSwitch.tag) {
            case 2000:
            {
                self.openNotify = aSwitch.on;
                [self.mainTableView reloadData];
            }
                break;
            case 2001:
                
                break;
            case 2002:
            
                break;
            case 2003:
                
                break;
            case 2004:
                
                break;
            default:
                break;
    }
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
