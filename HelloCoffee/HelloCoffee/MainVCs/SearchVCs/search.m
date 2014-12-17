//
//  search.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "search.h"
#import "httpManager.h"
#import "WantSeachViewController.h"
#import "SearchMainCell.h"
#import "recommend.h"

@interface search ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

{
    UIImageView *_searchImg;//搜索栏
    UITableView *_table;//下面的table
    UIImageView *_blueImg;//大蓝框
    UITableView *_searchTableView;//搜索栏下的tableView
    UIImageView *_sanjiaoImg;
    
    int _num;
    NSArray *_qingjingArr;
    NSArray *_zhutiArr;
    NSArray *_jiaweiArr;
    
//    请求 删
    NSArray *shangquanArr;
     NSArray *shangquanArr1;
     NSArray *shangquanArr2;
     NSArray *shangquanArr3;
     NSArray *shangquanArr4;
    NSArray *sq;
}
@property (weak, nonatomic) IBOutlet UIView *topView;
- (IBAction)searchBtnClick:(id)sender;

@end

@implementation search
-(void)initArr
{
    _qingjingArr = @[@"聚会派对",@"商务恰谈",@"慵懒放松",@"情侣约会"];
    _zhutiArr = @[@"胡同",@"酒店",@"宠物",@"音乐",@"跨界",@"课堂"];
    _jiaweiArr = @[@"0~40元",@"40~60元",@"60~80元",@"80元以上"];
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    shangquanArr = @[@"朝阳区",@"东城区",@"西城区",@"海淀区"];
    shangquanArr1 = @[@"国贸",@"工体",@"三里屯",@"燕莎",@"望京",@"朝外",@"大望路",@"朝阳公园",@"酒仙桥",@"亚奥"];
    shangquanArr2 = @[@"东直门",@"东四",@"崇文门",@"王府井"];
    shangquanArr3 = @[@"西单",@"西直门",@"金融街"];
    shangquanArr4 = @[@"公主坟",@"中关村",@"五棵松",@"五道口"];
    sq = @[shangquanArr1,shangquanArr2,shangquanArr3,shangquanArr4];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initArr];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithRed:(241.0/255.0) green:(239.0/256.0) blue:(240.0/256.0) alpha:1.0];
//搜索条
    _searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(12, 8, s_width-12-78, 28)];
    _searchImg.image = [UIImage imageNamed:@"kuang"];
    _searchImg.userInteractionEnabled = YES;
    [self.topView addSubview:_searchImg];
    
    UIImageView *imgSouSuo = [[UIImageView alloc]initWithFrame:CGRectMake(12, 6, 22, 17)];
    imgSouSuo.image = [UIImage imageNamed:@"sousuo"];
    [_searchImg addSubview:imgSouSuo];
//  textField相关
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(45, 1, _searchImg.frame.size.width-41, 27)];
   [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_searchImg addSubview:_textField];
    _textField.placeholder = @"请输入您要找的店名";
    _textField.keyboardType =UIKeyboardTypeWebSearch;
    _textField.delegate = self;
    UIImageView *ima = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    ima.image = [UIImage imageNamed:@"geren"];
    _textField.leftView = ima;
//    创建5个按钮
    NSArray *arr = @[@"商区",@"情景",@"主题",@"价位",@"确定"];
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake((s_width/5)*i, 64, (s_width/5), 40);
                [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = 1200+i;
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(fiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
//        分割线
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((s_width/5)*i, 64+5, 1, 30)];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0];

        
    }
//        分割线
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64+40+1, s_width, 1)];
    [self.view addSubview:view];
    view.backgroundColor=[UIColor lightGrayColor];
//      下方的table
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+40+2, s_width, s_height-64-40-49-2)];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _table.allowsSelection = NO;
    
    [self.view addSubview:_table];
    
//   的蓝色背景
    _blueImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64+40, s_width, 150)];
    _blueImg.image = [UIImage imageNamed:@"dise"];
    [self.view addSubview:_blueImg];
    _blueImg.hidden = YES;
    _blueImg.userInteractionEnabled = YES;
//  三角图标
    _sanjiaoImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sanjiao"]];
    _sanjiaoImg.hidden = YES;
    [self.view addSubview:_sanjiaoImg];
//    搜索栏下得tableView
   
    _searchTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, s_width, 250)];
    _searchTableView.delegate = self;
    _searchTableView.dataSource = self;
//    _searchTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_searchTableView];
    _searchTableView.hidden = YES;
// 键盘
//    [self setUpForDismissKeyboard];
}
-(void)fiveBtnClick:(UIButton*)btn
{
    _blueImg.hidden = NO;
    _sanjiaoImg.hidden = NO;

    _sanjiaoImg.frame = CGRectMake((s_width/10)+((s_width/5)*(btn.tag-1200))-10, 64+40-5, 21, 7);
    if (_num == btn.tag && !_blueImg.hidden) {
        _blueImg.hidden = YES;
             _sanjiaoImg.hidden = YES;
        _num = 0;
    }else{

    if (btn.tag == 1200) {
        [self iHateIt];
        _num =(int) btn.tag;
        
    }else if (btn.tag == 1201){
        [self makeBtnWithArr:_qingjingArr withTag:120100];
        _num =(int) btn.tag;
    }else if (btn.tag == 1202){
        [self makeBtnWithArr:_zhutiArr withTag:120200];
        _num =(int) btn.tag;
    }else if (btn.tag == 1203){
        [self makeBtnWithArr:_jiaweiArr withTag:120300];
         _num =(int) btn.tag;
    }else{
        _blueImg.hidden = YES;
        _sanjiaoImg.hidden = YES;
//        发起搜索请求
        recommend *re = [[recommend alloc]init];
        re.state = @"1";
        [self.navigationController pushViewController:re animated:YES];
    }
    }
}
-(void)iHateIt
{
    for (id temp in _blueImg.subviews) {
        [temp removeFromSuperview];
    }

//    城区
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 2, s_width/5, 150-4)];
    scroll.contentSize =CGSizeMake(s_width/5, (150/4)*shangquanArr.count);

//        显示城区中具体地址的scroll
    UIScrollView *xiscroll = [[UIScrollView alloc]initWithFrame:CGRectMake(s_width/5+2, 5, s_width-67, 140)];
    xiscroll.tag = 1234;
    xiscroll.contentSize = CGSizeMake(s_width*4/5, [sq[1] count]/3*40);
    [_blueImg addSubview:xiscroll];
    
    
    for (int i = 0; i < shangquanArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(0, (150/4)*i+1, s_width/5, (150/4)-1);
        [btn setTitle:shangquanArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:117.0/255.0 green:168.0/255.0 blue:254.0/255.0 alpha:1.0];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, (150/4)*(i+1), s_width/5-10, 1)];
        btn.tag = 7000+i;
        if(i == 0){
            btn.backgroundColor = [UIColor clearColor];
        }
        [btn addTarget:self action:@selector(shangquBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        view.backgroundColor = [UIColor whiteColor];
        [scroll addSubview:view];
        [scroll addSubview:btn];
        
    }
    [_blueImg addSubview:scroll];
    CGFloat width = xiscroll.frame.size.width;
    CGFloat height = xiscroll.frame.size.height;
    for (int i=0; i < [sq[0] count]; i++) {
        
        UIButton *btnbtn = [UIButton buttonWithType:UIButtonTypeSystem];
        btnbtn.frame = CGRectMake((width/3)*(i%3), 10+(height/4)*(i/3), width/3, (height/4-10));
        [btnbtn setTitle:[sq[0] objectAtIndex:i] forState:UIControlStateNormal];
        [btnbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnbtn.tag = 120000+i;
        btnbtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btnbtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
        [xiscroll addSubview:btnbtn];
        
    }
    
    
}
-(void)shangquBtnClick:(UIButton*)btn
{
    for (int i=0; i < shangquanArr.count; i++) {
        UIButton* tempBtn = (UIButton*)[self.view viewWithTag:7000+i];
        tempBtn.backgroundColor = [UIColor colorWithRed:117.0/255.0 green:168.0/255.0 blue:254.0/255.0 alpha:1.0];
    }
   
    btn.backgroundColor = [UIColor clearColor];
    
    NSInteger num =btn.tag-7000;

    UIScrollView *temp = (UIScrollView*)[self.view viewWithTag:1234];
    temp.contentSize = CGSizeMake(s_width-67, ([sq[num] count]/3+1)*40);
    [_blueImg addSubview:temp];

    for (id temp1 in temp.subviews) {
        [temp1 removeFromSuperview];
    }
//  scroll的宽和高
    CGFloat width = temp.frame.size.width;
    CGFloat height = temp.frame.size.height;
    
    for (int i=0; i < [sq[num] count]; i++) {
       
            UIButton *btnbtn = [UIButton buttonWithType:UIButtonTypeSystem];
            btnbtn.frame = CGRectMake((width/3)*(i%3), 10+(height/4)*(i/3), width/3, (height/4-10));
            [btnbtn setTitle:[sq[num] objectAtIndex:i] forState:UIControlStateNormal];
        [btnbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnbtn.tag = 120000+i;
        [btnbtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
        btnbtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        
            [temp addSubview:btnbtn];
        
    }
    
}
-(void)makeBtnWithArr:(NSArray*)arr withTag:(NSInteger)tag
{
    for (id temp in _blueImg.subviews) {
        [temp removeFromSuperview];
    }
//    _blueImg.userInteractionEnabled = YES;
    for (int i = 0; i < 2; i++) {
        for (int  j = 0; j < (arr.count/2); j++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(10+s_width/(arr.count/2)*j, 25+50*i, (s_width-20)/(arr.count/2), 50);
            [btn setTitle:arr[i*(arr.count/2)+j] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.tag = tag+i;
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
            [btn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
            [_blueImg addSubview:btn];
            
        }
    }
    
    
}
-(void)chooseBtn:(UIButton*)btn
{
    UIButton *tempBtn = (UIButton*)[self.view viewWithTag:btn.tag/100];
//    tempBtn.titleLabel.text = btn.titleLabel.text;
    [tempBtn setTitle:btn.titleLabel.text forState:UIControlStateNormal];

}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    _searchTableView.hidden = YES;
    [_textField resignFirstResponder];
}

#pragma mark - textField -

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    _searchImg.image = [UIImage imageNamed:@"sousuotiao2.png"];
    _searchImg.frame = CGRectMake(12, 8, s_width-12-52, 28);
    self.searchBtn.selected = YES;
    _searchTableView.hidden = NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    _searchImg.image = [UIImage imageNamed:@"sousuolan"];
    _searchImg.frame = CGRectMake(12, 8, s_width-12-78, 28);
    self.searchBtn.selected = NO;

    _searchTableView.hidden = YES;
}

- (void) textFieldDidChange:(UITextField *) TextField{
    NSLog(@"2222222%@",TextField.text);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"前往！");
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Seach Bar -

#pragma mark - TableView  -
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _table) {
        return 4+1;
    }else{
//    ！！！！！替换
   return shangquanArr1.count+1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _table) {
        if (indexPath.row == 0) {
            return 160;
        }else {
        
            if (s_height < 600) {
                return 170.0;
            }else if (s_height == 667){
                NSLog(@"iphone6");
                return 170.0*1.171;
            }else{
                return 170.0*1.293;
            }
        }
        
    }else{
    return 50;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSArray *arr = @[@"zhuti1",@"zhuti2",@"tu",@"dianputupian"];
//    NSArray *arr = @[@"testPIC.png",@"testPIC.png",@"testPIC.png",@"testPIC.png"];
    NSArray *arr1 = @[@"主题",@"商区",@"情景",@"价位"];
    if (tableView ==_table) {
        if (indexPath.row == 0) {
             static NSString *still =@"inde";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:still];
            if (cell == nil) {
               cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:still];
            }
            for (int i = 0; i < 2; i ++) {
                for (int j = 0; j < 2; j++) {
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
                    btn.frame = CGRectMake(10+(s_width/2-5)*j, 20+((160/2)-10)*i, s_width/2-15, 50);
                    [btn addTarget:self action:@selector(findWhatIWant:) forControlEvents:UIControlEventTouchUpInside];
                    btn.tag = 5000+2*i+j;
                    [btn setTitle:arr1[2*i+j] forState:UIControlStateNormal];
                    [btn setBackgroundColor:[UIColor yellowColor]];
                    [cell addSubview:btn];
                }
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
        SearchMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchMainCellReuse"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"SearchMainCell" owner:self options:nil] lastObject];
        }
        NSString *str = @"一杯咖啡一本书独享发呆时光";
            
        [cell setSomethingWith:arr[indexPath.row-1] AndLabel:str];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        }
    }else{
        if (indexPath.row == (shangquanArr1.count )) {
            
            static NSString *still = @"search_index";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:still];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:still];
            }
            cell.textLabel.text = @"清除搜索记录";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
        static NSString *still =@"search_index";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:still];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:still];
            }
            NSLog(@"%ld/%ld",indexPath.row,shangquanArr1.count);
            
        cell.textLabel.text = shangquanArr1[indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
        
    }

  
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _table) {
        if (indexPath.row == 0) {
            return;
        }else{
            recommend *re = [[recommend alloc]init];
            re.state = @"1";
            [self.navigationController pushViewController:re animated:YES];
        }
    }else{
        if (indexPath.row == shangquanArr1.count) {
            _textField.text = @"没有了";
        }else{
        _textField.text = shangquanArr1[indexPath.row];
        
        }
        _searchTableView.hidden=YES;
        [_textField resignFirstResponder];
    }
//    然后再以这个字段发起请求
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)findWhatIWant:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    WantSeachViewController *wantSeachVC = [[WantSeachViewController alloc] init];
    
    // 判断 tag 值 ，跳转下一页面
    
    switch (button.tag) {
        case 5000: // 想去哪儿
        {
            wantSeachVC.type = WantActivity;
        }
            break;
        case 5001: // 想要的主题
        {
            wantSeachVC.type = WantType;
        }
            break;
        case 5002: // 想要的活动
        {
            wantSeachVC.type = WantSight;
            
        }
            break;
        case 5003://想要的单价
        {
            wantSeachVC.type = WantPrise;
        }
            break;
        default:NSLog(@"Seach View Controller 按钮 跳转错误");
            break;
    }
    wantSeachVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wantSeachVC animated:YES];
}



- (IBAction)searchBtnClick:(id)sender {
    if (self.searchBtn.selected) {
        [_textField resignFirstResponder];
    }else{
         NSLog(@"寻找附近");
        
    }
    
}
@end
