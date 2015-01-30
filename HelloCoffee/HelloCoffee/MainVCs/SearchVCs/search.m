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
#import "SeachSectionCell.h"
#import "SearchMainCell.h"
#import "recommend.h"
#import "SeachMapVC.h"

#import "BaseMapViewController.h"
//#import "CloudPlaceAroundSearchViewController.h"
#import "HistrorySeachCollectionViewCell.h"

#define cannelBtn_w  60
#define lab_h 50
#define his_h 200
#define isIPhonX(H) ((H>560)?200:100)

@interface search ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    UIImageView *_searchImg;//搜索栏
    UITableView *_table;//下面的table
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
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) AMapCloudAPI *cloud;

//seach
@property(nonatomic,strong)UICollectionView *histroyColl;
@property(nonatomic,strong)UIImageView *imgback;
@property(nonatomic,strong)NSMutableArray *hisArr;
@property(nonatomic,assign)NSInteger row;
@property(nonatomic,strong)UIButton *allDelBtn;
@property(nonatomic,strong)UIView *btnUpview;
@property(nonatomic,strong)NSMutableArray *danShanArr;

@end

@implementation search

-(id)init
{
    if(self=[super init])
    {
        self.hisArr=[NSMutableArray arrayWithCapacity:0];
        _danShanArr=[NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
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
    _textField.clearButtonMode= UITextFieldViewModeUnlessEditing;
    _textField.clearsOnBeginEditing=YES;
    UIImageView *ima = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    ima.image = [UIImage imageNamed:@"geren"];
    _textField.leftView = ima;
    
    //      下方的table
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, s_width, s_height-20-49)];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    _table.allowsSelection = NO;
    [self.view addSubview:_table];
    [self.view sendSubviewToBack:_table];

    // 键盘
    //    [self setUpForDismissKeyboard];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_textField resignFirstResponder];
}

#pragma mark -
#pragma mark - Collection View -
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        UINib *nib=[UINib nibWithNibName:@"HistrorySeachCollectionViewCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"his"];
        
        HistrorySeachCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"his" forIndexPath:indexPath];
        cell.nameLab.text=[[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArrD"] objectAtIndex:indexPath.row];//self.hisArr[indexPath.row];
        cell.delBtn.alpha=1;
        cell.taget=self;
        cell.row=indexPath.row;
        cell.nameLab.textAlignment=NSTextAlignmentLeft;
        return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
          return self.hisArr.count;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        HistrorySeachCollectionViewCell *cell = (HistrorySeachCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
        _textField.text = cell.nameLab.text;
        [_imgback removeFromSuperview];
        [_textField resignFirstResponder];
}

#pragma mark -
#pragma mark - TableView  -
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return s_width/2 + 44;
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
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[@"zhuti1",@"zhuti2",@"tu",@"222.jpg"];
    if (indexPath.row == 0) {
        
        SeachSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SeachSectionCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"SeachSectionCell" owner:self options:nil] lastObject];
        }
        [cell setTargrt:self actions:@selector(findWhatIWant:)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        SearchMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchMainCellReuse"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"SearchMainCell" owner:self options:nil] lastObject];
        }
        NSArray *strArray = @[@"一杯咖啡一本书独享发呆时光",@"几个小伙伴的欢乐趴",@"我只要你陪我喝咖啡，地老天荒",@"不必为了梦想而失落，也不必为了希望而担忧"];
        
        [cell setSomethingWith:arr[indexPath.row-1] AndLabel:strArray[indexPath.row-1]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return;
    }else{
        NSArray *arr=@[@"独享时光主题",@"欢乐主题",@"咖啡主题",@"地老天荒主题",@"梦想主题"];
        recommend *re = [[recommend alloc]init];
        re.state = @"1";
        re.isTabbar=NO;
        re.chuangzhiZhuTi=arr[indexPath.row];
        
        re.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:re animated:YES];
        
    }
    //    然后再以这个字段发起请求
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark - Other -

#pragma mark - Action -
- (IBAction)findWhatIWant:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    WantSeachViewController *wantSeachVC = [[WantSeachViewController alloc] init];
    
    // 判断 tag 值 ，跳转下一页面
    
    switch (button.tag) {
        case 2000: // 想去哪儿
        {
            wantSeachVC.type = WantActivity;
        }
            break;
        case 2001: // 想要的主题
        {
            wantSeachVC.type = WantType;
        }
            break;
        case 2002: // 想要的活动
        {
            wantSeachVC.type = WantSight;
            
        }
            break;
        case 2003://想要的单价
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
        //        self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        //        self.cloud = [[AMapCloudAPI alloc] initWithCloudKey:yunAPIKey delegate:nil];
        //        BaseMapViewController *subViewController = [[CloudPlaceAroundSearchViewController alloc] init];
        //        subViewController.mapView       = self.mapView;
        //        subViewController.cloudAPI      = self.cloud;
        
        SeachMapVC *map = [[SeachMapVC alloc]init];
        
        [self.navigationController pushViewController:(UIViewController*)map animated:YES];
    }
}

#pragma mark -
#pragma mark - 搜索 -
-(void)createSouSuo
{
    UIImageView *imgback=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, s_width, s_height-64)];
    imgback.userInteractionEnabled=YES;
    imgback.image=[UIImage imageNamed:@"caidanbantoumingyinying"];
    [self.view addSubview:imgback];
    
    //    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgbackTap:)];
    //    [imgback addGestureRecognizer:tap];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    layout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
    layout.minimumLineSpacing=1;
    layout.minimumInteritemSpacing=0;
    UICollectionView *coll=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];//CGRectMake(0, 0, s_width, his_h)
    coll.delegate=self;
    coll.dataSource=self;
    coll.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    _histroyColl=coll;
    coll.userInteractionEnabled=YES;
    [coll registerClass:[HistrorySeachCollectionViewCell class] forCellWithReuseIdentifier:@"his"];
    [imgback addSubview:coll];
    
    UIView *v=[[UIView alloc] initWithFrame:CGRectZero];//CGRectMake(0, coll.frame.size.height, s_width, 1)
    v.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [imgback addSubview:v];
    _btnUpview=v;
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectZero;//CGRectMake(0, coll.frame.size.height+1, s_width, 50);
    [btn setTitle:@"清除所有搜索记录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(deletehisDown:) forControlEvents:UIControlEventTouchUpInside];
    btn.tintColor=[UIColor grayColor];
    btn.backgroundColor=[UIColor whiteColor];
    btn.titleLabel.font=[UIFont systemFontOfSize:20];
    _allDelBtn=btn;
    [imgback addSubview:btn];
    _imgback=imgback;
    
}

//删除单个
-(void)danDeteDown:(NSNumber *)row
{
    [self.hisArr removeObjectAtIndex:[row integerValue]];
    
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArrD"];
    
    [self.danShanArr addObjectsFromArray:arr];
    [self.danShanArr removeObjectAtIndex:[row integerValue]];
    [[NSUserDefaults standardUserDefaults] setObject:self.danShanArr forKey:@"hisArrD"];
    [self.danShanArr removeAllObjects];
    
    NSArray *arr1=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArrD"];
    if(arr1.count*50<isIPhonX(s_height)) //self.hisArr.count
    {
        _histroyColl.frame=CGRectMake(0, 0, s_width, arr1.count*50);
        
        _btnUpview.frame=CGRectMake(0, self.hisArr.count*50, s_width, 1);
        _allDelBtn.frame=CGRectMake(0, _histroyColl.frame.size.height+1, s_width, 50);
        
    }
    else{
        _histroyColl.frame=CGRectMake(0, 0, s_width, isIPhonX(s_height));
        _btnUpview.frame=CGRectMake(0, _histroyColl.frame.size.height, s_width, 1);
        _allDelBtn.frame=CGRectMake(0, _histroyColl.frame.size.height+1, s_width, 50);
    }
    
    
    if(self.hisArr.count==0)
    {
        [_imgback removeFromSuperview];
    }
    
    [_histroyColl reloadData];
    
}
//清空历史
-(void)deletehisDown:(UIButton*)btn
{
    [self.hisArr removeAllObjects];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"hisArrD"];
    [_imgback removeFromSuperview];
}

#pragma mark -
#pragma mark - Text Field -
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self createSouSuo];
    
    NSArray *arr1=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArrD"];
    if(arr1.count*50<isIPhonX(s_height))//his_h
    {
        _histroyColl.frame=CGRectMake(0, 0, s_width, arr1.count*50);
        
        _btnUpview.frame=CGRectMake(0, self.hisArr.count*50, s_width, 1);
        _allDelBtn.frame=CGRectMake(0, _histroyColl.frame.size.height+1, s_width, 50);
        
    }else
    {
        _histroyColl.frame=CGRectMake(0, 0, s_width, isIPhonX(s_height));
        _btnUpview.frame=CGRectMake(0, _histroyColl.frame.size.height, s_width, 1);
        _allDelBtn.frame=CGRectMake(0, _histroyColl.frame.size.height+1, s_width, 50);
    }
    if(self.hisArr.count==0)
    {
        [_imgback removeFromSuperview];
    }
    [_histroyColl reloadData];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _searchImg.frame = CGRectMake(12, 8, s_width-12-52, 28);
    self.searchBtn.selected = YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    _searchImg.frame = CGRectMake(12, 8, s_width-12-78, 28);
    self.searchBtn.selected = NO;
    
}

-(void)textFieldDidChange:(UITextField *)textField
{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // NSLog(@"前往！");
    [textField resignFirstResponder];
    
    if([self isKong:textField.text])//(![textField.text hasPrefix:@"  "]&&![textField.text hasSuffix:@" "])
    {
        int j=0;
        for( j=0;j<self.hisArr.count;j++)
        {
            
            if([self.hisArr[j] isEqualToString:textField.text])
            {
                break;
            }
        }
        if(j==self.hisArr.count)
        {
            [self.hisArr insertObject:textField.text atIndex:0];
        }
        if(self.hisArr.count>10)
        {
            NSArray *arry=[NSArray arrayWithArray: self.hisArr];
            //NSLog(@"arry===%@",arry);
            [self.hisArr removeAllObjects];
            for(int i=0;i<10;i++)
            {
                [self.hisArr addObject:arry[i]];
                
            }
            
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:self.hisArr forKey:@"hisArrD"];
    }
    
    [textField resignFirstResponder];
    [_imgback removeFromSuperview];
    
    return YES;
}

//判断字符串是否全为空格
-(BOOL)isKong:(NSString * )str
{
    for(int i=0;i<[str length];i++)
    {
        if([str characterAtIndex:i]!=' ')
        {
            return YES;
        }
    }
    return NO;
}

#pragma mark -
#pragma mark - Scroll View -
-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_table]) {
        if (scrollView.contentOffset.y > 44) {
//            NSLog(@" == %g == ",scrollView.contentOffset.y);
            [UIView animateWithDuration:0.35 animations:^{
                self.topView.frame = CGRectMake(0, -44, s_width, 44);
            }];
        }
        else{
            [UIView animateWithDuration:0.35 animations:^{
                self.topView.frame = CGRectMake(0, 20, s_width, 44);
            }];
        }
    }
    
}


@end
