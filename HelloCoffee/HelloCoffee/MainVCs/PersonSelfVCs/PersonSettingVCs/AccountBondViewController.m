//
//  AccountBondViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "AccountBondViewController.h"
#import "LabelSwitchTableViewCell.h"
#import "EmailBondViewController.h"

@interface AccountBondViewController ()

// 控件
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

// 数据
@property (nonatomic, strong) NSArray *bondNameArray;

@end

@implementation AccountBondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"账号绑定" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];

//    self.navigationItem.title = @"账号绑定";
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
//
//    // 设置 返回本界面的 Title / Color
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    self.navigationItem.backBarButtonItem = backItem;
//    backItem.title = @" ";
    
    
    
    //  - 视图控件 -
    // Main Table View
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.scrollEnabled = NO;
    self.mainTableView.separatorColor = [UIColor clearColor];
    
    // 数据
    self.bondNameArray = @[@"微信绑定",@"微博绑定",@"邮箱绑定"];
    
}


//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//}


#pragma mark - TableView  -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LabelSwitchTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"LabelSwitchTableViewCell" owner:self options:nil]lastObject];
    
    [cell setFuncNameString:self.bondNameArray[indexPath.row] switchTag:2000+indexPath.row  switchOn:NO target:self switchAction:@selector(aSwitchAction:)];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bondNameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return s_width/kPersonFunctionRatio;
    return 60;
}

#pragma mark - Action -
-(void)aSwitchAction:(UISwitch *)aSwitch
{
    NSLog(@" Bond Switch Tag:%d on:%d",(int)aSwitch.tag,aSwitch.on);
    
    if (aSwitch.on == YES) {

        switch (aSwitch.tag) {
            case 2000:
                
                break;
            case 2001:
                
                break;
            case 2002:
            {
                [self.navigationController pushViewController:[[EmailBondViewController alloc] init] animated:YES]; // 邮箱绑定
            }
                break;
            default:
                break;
        }
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
