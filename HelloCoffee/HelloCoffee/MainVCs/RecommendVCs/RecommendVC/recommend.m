//
//  recommend.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "recommend.h"

#import "httpManager.h"

#import "SDWebImageManager.h"

#import "ShopDetailsViewController.h"
#import "PostedCoffeeShopViewController.h"
#import "TUIJianCollectionViewCell.h"
#import "personSelf.h"
#import "TopScrollPictureCell.h"
#import "PageScrollView.h"
#define H_size 0
#define V_size  1
#define nav_h 64
#define V_H 44
#define btn_hdis 2
#define btn_h 40
//#define btn_wdis
#define btn_w ([UIScreen mainScreen].bounds.size.width/2.0-2.0)

#define cell_h 150.0
#define frist_cell_h 150
@interface recommend ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

//{
//    SDWebImageManager *_manager;
//}
@property(nonatomic,strong)UIImageView *titleImg;

@property(nonatomic,strong)UIButton *leftBtn;

@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *NavLab;
@property(nonatomic,strong)UIImageView *navImg;

@property(nonatomic,strong)UIImageView *imgSan;

@property(nonatomic,assign)BOOL isRotiation;
@property(nonatomic,strong)NSMutableDictionary *dataDic;
@property(nonatomic,assign)CGFloat tabHeight;
@property(nonatomic,strong)UILabel *titleLabel;



//@property(nonatomic,strong)NSMutableArray *cellImgArr;
@end

@implementation recommend
{
    NSInteger chakanCount;
}
-(instancetype)init
{
  if(self = [super init])
  {
      self.dataDic=[NSMutableDictionary dictionaryWithCapacity:0];
      //self.cellImgArr=[NSMutableArray arrayWithCapacity:0];

  }
    return self;
}

-(void)isTabbarAndNav:(BOOL)isExrit
{
    if (isExrit==NO) {
       self.titleImg.hidden=YES;
        self.tabHeight=0;
        [self makeNavWithTitleLabel:self.chuangzhiZhuTi withRightBtn:NO rightBtnImageURL:nil target:nil rightBtnAction:nil];
        
    }else
    {
      self.titleImg.hidden=NO;
       self.tabHeight=69;
    }
    
    
}
-(void)loadData
{
    NSArray *arr0=@[@"浪漫与激情的双重体验",@"完美演绎非常的味蕾享受",@"I like my coffee black like devil,hot like hell",@"陶醉这小小世界里品味自己的味道",@"pure like an angel and sweet like love",@"浓浓情意，丝丝柔情",@"在喧闹中为你提供一份特别的安宁",@"好久不见你,我在左岸咖啡馆",@"角落,展阅一本孤独的人,因为少人懂,于是又孤独",@"聊赖的午后,我独自走在蒙巴那斯道"];
    NSArray *arr1=@[@"红卡咖啡",@"途尚咖啡",@"Genius at Work",@"ABC cooking studio",@"百怡咖啡",@"树心旁芝士小栈",@"雨花咖啡馆 ",@"字里行间",@"Jazz Ya",@"Chi-chi's"];
     NSArray *arr2=@[@"1324",@"688",@"455",@"578",@"2048",@"657",@"894",@"986",@"654",@"3201"];
    NSArray *arr3=@[@"touxiang@2x.png",@"touxiang1@2x.png",@"touxiang8@2x.png",@"touxiang60-60-1@2x.png",@"touxiang60-60-3@2x.png",@"touxiang60-60-4@2x.png",@"touxiang60-60-6@2x.png"];
    [self.dataDic setObject:arr1 forKey:@"didian"];
     [self.dataDic setObject:arr0 forKey:@"biaoti"];
    [self.dataDic setObject:arr2 forKey:@"cishu"];
    [self.dataDic setObject:arr3 forKey:@"tuoxiang"];

}
- (void)viewWillDisappear:(BOOL)animated
{
//    [super viewWillDisappear:animated];
//    self.navigationItem.title = @" ";
//    [MobClick endLogPageView:@"推荐首页开始"];
//    self.navigationController.navigationBarHidden = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([self.state isEqualToString:@"1"]) {
        self.tabBarController.tabBar.hidden = YES;
        // self.table.frame = CGRectMake(0, 64, s_width, s_height-64);
        //self.navigationController.navigationBarHidden = NO;
    }else{
        self.tabBarController.tabBar.hidden = NO;
        //self.table.frame = CGRectMake(0, 20, s_width, s_height-69);
    }
}
- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    
//    // 设置 返回键 Title
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    self.navigationItem.backBarButtonItem = backItem;
//    backItem.title = @" ";
//    
//    self.table = [[UITableView alloc]init];
//    self.table.dataSource = self;
//    self.table.delegate = self;
////    self.table.allowsSelection = NO;
//    self.table.frame = CGRectMake(0, 20, s_width, s_height-69);
//    [self.view addSubview:self.table];
//    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.table.showsVerticalScrollIndicator = NO;
//    self.table.contentSize = self.view.bounds.size ;
//    
//    [httpManager requestWithUrl:@"" FinishBlock:^(NSData *data) {
//        
//    } FailedBlock:^{
//        
//    }];
    
    [self makeNav];
    [self isTabbarAndNav:self.isTabbar];
    [self makeCollview];
    [self textSize];
    _isRotiation=YES;
    [self loadData];
}

-(void)textSize
{
   if([UIScreen mainScreen].bounds.size.width>375)
   {
     //self.NavLab.font=[UIFont systemFontOfSize:24];
       self.leftBtn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
       
   }else if([UIScreen mainScreen].bounds.size.width==375.0)
   {
       //self.NavLab.font=[UIFont systemFontOfSize:20];
       self.leftBtn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
   }else
   {
       //self.NavLab.font=[UIFont systemFontOfSize:18];
       self.leftBtn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
   }
}
-(void)makeNav
{
    self.titleImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, s_width, 64)];
    //self.titleImg.image = [UIImage imageNamed:@"dilan"];
    self.titleImg.backgroundColor=kBlueColor;
    self.titleImg.userInteractionEnabled = YES;
    [self.view addSubview:self.titleImg];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(0, 21, 47, 44);
   
    [btn setTitle:@"北京" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:20];
    btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;

    //btn.backgroundColor=[UIColor redColor];
    btn.tintColor=[UIColor whiteColor];
    //btn.titleLabel.font=[UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(leftBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn=btn;
    [self.titleImg addSubview:self.leftBtn];
    //self.leftBtn.enabled=NO;
    //self.leftBtn.adjustsImageWhenDisabled=YES;
   
    
    UIImageView *imgSan=[[UIImageView alloc]initWithFrame:CGRectMake(self.leftBtn.frame.origin.x+self.leftBtn.frame.size.width, 39, 12, 7)];
    imgSan.image=[UIImage imageNamed:@"xialachengshi@2x"];
    [self.titleImg addSubview:imgSan];
    self.imgSan=imgSan;
    self.imgSan.alpha=0;
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(self.leftBtn.frame.origin.x+self.leftBtn.frame.size.width+imgSan.frame.size.width, 20, s_width-(self.leftBtn.frame.origin.x+self.leftBtn.frame.size.width+imgSan.frame.size.width)-50, 44)];
   // lab.image=[UIImage imageNamed:@"nihaokafei"];
    
    //lab.text=@"HELLO  COFFEE";
    //lab.textColor=[UIColor whiteColor];
    //lab.textAlignment=NSTextAlignmentCenter;
    //lab.font=[UIFont systemFontOfSize:24];
    [self.titleImg addSubview:lab];
    self.NavLab=lab;
    

    CGFloat w=123;
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake((lab.frame.size.width-w)/2.0-5, 10+4, w, 15.5)];

  

    img.image=[UIImage imageNamed:@"hello-coffee"];
    [self.NavLab addSubview:img];
    //img.backgroundColor=[UIColor redColor];
    self.navImg=img;
    
    btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake((self.leftBtn.frame.origin.x+self.leftBtn.frame.size.width+imgSan.frame.size.width)+self.NavLab.frame.size.width+20-5, 32, 25, 20);
    [btn setBackgroundImage:[UIImage imageNamed:@"shop_icon"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(postedCoffeeShop:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleImg addSubview:btn];
    self.rightBtn=btn;
    
    
}
-(void)leftBtnDown:(UIButton *)btn
{
    
    if(btn==self.leftBtn)
    {
        if(_isRotiation==YES)
        {
        self.imgSan.transform=CGAffineTransformMakeRotation(-M_PI_2);
            _isRotiation=!_isRotiation;
        }else
        {
            self.imgSan.transform=CGAffineTransformMakeRotation(0);
            _isRotiation=!_isRotiation;
        }
        
    }
    NSLog(@"");
}

-(void)postedCoffeeShop:(UIButton *)button
{
    PostedCoffeeShopViewController  *postedShopVC = [[PostedCoffeeShopViewController alloc] init];
    postedShopVC.applyFrom = Apply_By_Customer;
    postedShopVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:postedShopVC animated:YES];
}

-(void)makeCollview
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    //layout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 130);
        layout.minimumLineSpacing=10;
        //layout.minimumInteritemSpacing=10;
    UICollectionView *coll=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, s_width, s_height-V_H-self.tabHeight) collectionViewLayout:layout];
    coll.delegate=self;
    coll.dataSource=self;
    coll.backgroundColor=[UIColor whiteColor];
    [coll registerClass:[TUIJianCollectionViewCell class] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:coll];
    self.coll=coll;
    //coll.backgroundColor=[UIColor colorWithRed:222/255.0 green:220/255.0 blue:221/255.0 alpha:1];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
   // [super viewWillAppear:animated];

    [MobClick beginLogPageView:@"推荐首页开始"];
    
    
    
    //self.tabBarController.tabBar.tintColor=kBlueColor;
}



//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
-(void)touXiangDown
{
    personSelf *person=[[personSelf alloc] init];
    
    person.title=@"我的店家";
    person.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:person animated:YES];
}
#pragma mark collviewView Delegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item!=0)
    {
    UINib *nib=[UINib nibWithNibName:@"TUIJianCollectionViewCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"iden1"];
    
    TUIJianCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"iden1" forIndexPath:indexPath];
    cell.target=self;
    cell.method=@selector(touXiangDown);
    
    cell.pingCount.text=[self.dataDic objectForKey:@"cishu"][indexPath.item];
    
   cell.backView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%ld%ld%ld%ld.jpg",indexPath.row,indexPath.row,indexPath.row,indexPath.row]];//@"%ld.JPG",(long)indexPath.row+300
    
  
    [cell.tuoXiang setImage:[UIImage imageNamed:[self.dataDic objectForKey:@"tuoxiang"][indexPath.item%7]] forState:UIControlStateNormal];
    
    
  
    cell.headText.text =[self.dataDic objectForKey:@"biaoti"][indexPath.item];
    cell.detailText.text=[NSString stringWithFormat:@"%@ . %0.1fkm",[self.dataDic objectForKey:@"didian"][indexPath.item],arc4random()%20+arc4random()%20*0.3]; //[self.dataDic objectForKey:@"didian"][indexPath.item];
    
    if([cell.pingCount.text integerValue]>=10000)
    {
        cell.zanShu.titleLabel.font=[UIFont systemFontOfSize:15];
        [cell.zanShu setTitle:@"9999+" forState:UIControlStateNormal];
    }
      
         return cell;
    }
    else
    {
        
        
        NSArray *arr=@[[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"]];
        NSMutableArray *arr1=[NSMutableArray array];
        [arr1 addObjectsFromArray:arr];
        
        UINib *nib=[UINib nibWithNibName:@"TopScrollPictureCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"topscroll"];
        
        TopScrollPictureCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"topscroll" forIndexPath:indexPath];
        
        [cell setScrollViewDelegate:self imageArray:arr1 target:self scrollViewAction:@selector(ScrDown:)];//@selector(ScrDown:)
       

        
       return cell;
    }
    
   
}
-(void)ScrDown:(UITapGestureRecognizer * )tap
{
    NSLog(@"hehehheheh===%f",[(PageScrollView *)tap.view contentSize].width);
    ShopDetailsViewController *shop=[[ShopDetailsViewController alloc] init];
    
    shop.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shop animated:YES];
    NSDictionary * dict=@{@"chakanCount":[NSString stringWithFormat:@"%ld",(long)chakanCount+1]};
    NSNotification * nf=[NSNotification notificationWithName:@"chakan" object:nil userInfo:dict];
    
    [[NSNotificationCenter defaultCenter]postNotification:nf];

    //if()
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CGFloat heiht=0.0;
    //图片为尺寸600*320
//    if (s_height <= 568) {
//        heiht= 170.7;//238;
//            }else if (s_height == 667){
//                heiht=200;//238*1.183;
//            }else{
//                heiht=288;//238*1.313;
//            }
    
    heiht=[UIScreen mainScreen].bounds.size.width*(3.0/4);
    if(indexPath.item!=0)
    {
  return CGSizeMake([UIScreen mainScreen].bounds.size.width, heiht);
    }else
    {
        if (_isScroll==YES) {
              return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.35);//
        }else
        {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 0);//frist_cell_h
        }
    }
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"index--%ld",indexPath.item);
    ShopDetailsViewController *shop=[[ShopDetailsViewController alloc] init];
    
    shop.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shop animated:YES];
    NSDictionary * dict=@{@"chakanCount":[NSString stringWithFormat:@"%ld",(long)chakanCount+1]};
      NSNotification * nf=[NSNotification notificationWithName:@"chakan" object:nil userInfo:dict];
    
       [[NSNotificationCenter defaultCenter]postNotification:nf];
}


-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr withRightBtn:(BOOL)withRightBtn rightBtnImageURL:(NSString *)rightBtnImageURL target:(id)target rightBtnAction:(SEL)rightAction
{
    //    static CGFloat t;
    //    if(iosVersion >= 7.0){
    //        t = 20;
    //    }else{
    //        t = 0;
    //    }
    // 背景 - 蓝色
    self.titleImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, s_width, 64)];
    self.titleImg.backgroundColor = kBlueColor;
    self.titleImg.userInteractionEnabled = YES;
    [self.view addSubview:self.titleImg];
    
    // 标题
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
    [self.titleImg addSubview:self.titleLabel];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.titleLabel.userInteractionEnabled = YES;
    self.titleLabel.text = titleLabelStr;
    
    // 左 - 返回键
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(15, 20+5, 21, 34);
    [self.leftBtn setImage:[UIImage imageNamed:@"fanhuibai"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.titleImg addSubview:self.leftBtn];
    
//    if (withRightBtn == YES) {
//        // 右 - 功能键
//        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.rightBtn.frame = CGRectMake(s_width-20-15, 33, 20, 20);
//        [self.rightBtn setBackgroundImage:[UIImage imageNamed:rightBtnImageURL] forState:UIControlStateNormal];
//        [self.rightBtn addTarget:target action:rightAction forControlEvents:UIControlEventTouchUpInside];
//        [self.titleImg addSubview:self.rightBtn];
//    }
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


//#pragma mark tableView Delegate
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell * cell =[tableView cellForRowAtIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.contentView.backgroundColor = [UIColor clearColor];
//    cell.selected = NO;
//    ShopDetailsViewController *shopDetailVC = [[ShopDetailsViewController alloc]init];
//    [self.navigationController pushViewController:shopDetailVC animated:YES];
//    NSDictionary * dict=@{@"chakanCount":[NSString stringWithFormat:@"%ld",(long)chakanCount+1]};
//    NSNotification * nf=[NSNotification notificationWithName:@"chakan" object:nil userInfo:dict];
//    
//    [[NSNotificationCenter defaultCenter]postNotification:nf];
//    
//}
//
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 10;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (s_height <= 568) {
//        return 238;
//    }else if (s_height == 667){
//        return 238*1.183;
//    }else{
//        return 238*1.313;
//    }
////    return 238;
//}
//
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    TableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
//    if (!cell) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
//        
//    }
//    chakanCount = [cell.chakanCountLabel.text integerValue];
//    [cell reloadData];
//    [cell actionForIconImg:cell.iconImg andContentView:self];
////    cell.headimageView.image =[UIImage imageNamed:@"zhuti2"];
//    cell.iconImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",200+2]];
//    cell.headimageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%ld.JPG",(long)indexPath.row+300]];
////    cell.headimageView.image = [UIImage imageNamed:@"testPIC.png"];
//    if (s_height <= 568) {
//        cell.zuo.constant = 50;
//        cell.you.constant = 50;
//        cell.top.constant = 20;
//    }else if (s_height == 667){
//        cell.zuo.constant = 63;
//        cell.you.constant = 63;
//        cell.top.constant = 23;
//    }else{
//        cell.zuo.constant = 73;
//        cell.you.constant = 73;
//        cell.top.constant = 26;
//    }
//    [cell setNeedsUpdateConstraints];
////    [NSLayoutConstraint constraintWithItem:cell.zanCountLabel
////                                 attribute:NSLayoutAttributeRight
////                                 relatedBy:(NSLayoutRelationEqual)
////                                    toItem:cell.fengexian2
////                                 attribute:NSLayoutAttributeLeft multiplier:1.0
////                                  constant:tt];
//   
//    
//
//   
//    
//    NSLog(@"x:%f \n y:%f",cell.headimageView.frame.size.width,cell.headimageView.frame.size.height);
//    return cell;
//}





@end
