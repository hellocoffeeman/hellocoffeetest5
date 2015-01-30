//
//  DianZanViewController.m
//  Dianzan
//
//  Created by HelloCoffee on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "DianZanViewController.h"
//#import "MyHeader.h"

#import "MyCollectionViewCell.h"
#define nav_h 64
#define V_H 44
#define btn_hdis 2
#define btn_h 40
//#define btn_wdis
#define btn_w ([UIScreen mainScreen].bounds.size.width/2.0-2.0)

#define cell_h 150.0

@interface DianZanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UIImageView *titleImg;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;


@end

@implementation DianZanViewController

-(instancetype)init
{
    if(self=[super init])
    {
        self.zhuArr=[NSMutableArray array];
        self.fuheadArr=[NSMutableArray array];
        self.fuDetailArr=[NSMutableArray array];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //self.navigationItem.hidesBackButton=YES;
//    self.navigationController.navigationBarHidden=YES;
//    self.tabBarController.tabBar.hidden=YES;
    
}

-(void)viewDidAppear:(BOOL)animated
{
     self.tabBarController.tabBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    self.automaticallyAdjustsScrollViewInsets=NO;
    [self makeNavWithTitleLabel:@"我的评论"];
    [self loadData];
    [self createView];
    [self createCollection];
    
    [self createCollection2];
    //self.coll2.hidden=YES;
    
    self.coll2.frame=CGRectMake(self.coll.frame.size.width, self.coll2.frame.origin.y, self.coll2.frame.size.width, self.coll2.frame.size.height);
    
    
}
-(void)loadData
{
    NSArray * arr0=@[@"给我的文章点赞",@"我收到的赞",@"TH_拜人生赢家汤抖森",@"稻香老农"];
    NSArray * arr1=@[@"意大利飘来的纯正口味",@"千红一窟",@"万艳同悲",@"枉凝眉",@"人生的风景，是物也是人，学会欣赏，学会领略，人生将有无限风光。人生如寄，一切都将过去，没有人能在岁月的苍穹里划一道不灭的痕迹。不管你是意气风发，还是平淡落寞，都将被淹没在历史的长河中。流云过千山，本就一场梦幻。帮助人是一种崇高，理解人是一种豁达，原谅人是一种美德，服务人是一种快乐，月圆是诗，月缺是花，仰首是春，俯首是秋。",@"没有过不去的事情，只有过不去的心情！确实是这样，很多事情我们之所以过不去是因为我们心里放不下，比如被欺骗了报复放不下，被讽刺了怨恨放不下，被批评了面子放不下。大部分人都只在乎事情本身并沉迷于事情带来的不愉快的心情。其实只要把心情变一下，世界就完全不同了。",@"微笑是一种气质，气质得益于修养；微笑时一种境界，境界依靠磨练。相逢一笑泯恩仇，桃花依旧笑春风。",@"诚信是道路，随着开拓者的脚步延伸；诚信是智慧，随着博学者的求索积累；诚信是成功，随着奋进者的拼搏临近；诚信是财富的种子，只要你诚心种下，就能找到打开金库的钥匙。记住，一个成功的婚姻取决于两件事情：一寻找最合适的人；二成为最合适的人，二者缺一不可。是人都有惰性，这是与生俱来的，但是我们后天可以改变这种惰性，因为有很多人正在改变。对于某种事物或是生意不要等别人做到了，我才想到。不要等别人已经赚到钱了，我才想去做。没有人相信的是市场和机遇，大家都相信的叫做膨胀。人生的十个不要等——想要得到爱时才学会付出；孤单时才想念起你的朋友；有了职位时才去努力工作；失败时才记起他人的忠告；生病时才意识到生命脆弱；分离时后悔没有珍惜感情；有人赞赏你时才相信自己；别人指出才知道自己错了；腰缠万贯才准备帮助穷人；临死时才发现要热爱生活。——这些都不要等。"];
    NSArray * arr2=@[@"val milano",@"一个是阆苑仙葩",@"一个是美玉无限",@"若说没奇缘",@"来自  任性",@"来自  千红一窟",@"来自  怡红公子",@"来自  茫茫大士"];
    [self.zhuArr addObjectsFromArray:arr0];
    [self.fuheadArr addObjectsFromArray:arr1];
    [self.fuDetailArr addObjectsFromArray:arr2];
    
}
-(void)createView
{
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0, nav_h, s_width, V_H)];
    
    view1.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:view1];
    self.sendBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.sendBtn.frame=CGRectMake(0, 5,btn_w, btn_h);
    [self.sendBtn addTarget:self action:@selector(sendBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    //self.sendBtn.backgroundColor=[UIColor blueColor];
    self.sendBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [self.sendBtn setTitle:@"我收到的评论" forState:UIControlStateNormal];
    [view1 addSubview:self.sendBtn];
    
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(s_width/2, 0, 1.5, 64)];
    view2.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [view1 addSubview:view2];
    
    self.revBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.revBtn.frame=CGRectMake(btn_w+2, 5,btn_w, btn_h);
    [self.revBtn addTarget:self action:@selector(sendBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    self.revBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    self.revBtn.tintColor=[UIColor grayColor];
    [self.revBtn setTitle:@"我发出的评论" forState:UIControlStateNormal];
    [view1 addSubview:self.revBtn];
    
    // self.revBtn.backgroundColor=[UIColor blueColor];
    
    UIView *view3=[[UIView alloc] initWithFrame:CGRectMake(10, V_H-2, btn_w-20, 2)];//btn_w-80,43 //CGRectMake([[self view3XAndW][0] floatValue], V_H-2,[[self view3XAndW][1] floatValue] , 2)
//    NSLog(@"self.sendBtn.titleLabel.frame.origin.x=%f,,,,,elf.sendBtn.titleLabel.frame.size.width==%f",self.sendBtn.titleLabel.frame.origin.x,self.sendBtn.titleLabel.frame.size.width);
    
    view3.backgroundColor=[UIColor colorWithRed:0/255.0 green:115/255.0 blue:255/255.0 alpha:1];
    [view1 addSubview:view3];
    self.view3=view3;
    
    
    
    //    [self creatTable];
    // [self createCollection];
    
    
}
-(NSArray *)view3XAndW
{
  //5 29 100
    //6 42 100
    //6+ 49 105.667
    
    if([UIScreen mainScreen].bounds.size.width<375)
    {
        return @[@29,@100];
    }else if([UIScreen mainScreen].bounds.size.width==375)
    {
      return @[@42,@100];
    }else
    {
      return @[@49,@105.667];
    }
        
}

-(void)sendBtnDown:(UIButton *)btn
{
    
    if(btn==_sendBtn)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            self.view3.frame=CGRectMake(10, V_H-2, btn_w-20, 2);//CGRectMake(self.sendBtn.titleLabel.frame.origin.x, V_H-2, self.sendBtn.titleLabel.frame.size.width, 2);
            self.coll.frame=CGRectMake(0, self.coll.frame.origin.y, self.coll.frame.size.width, self.coll.frame.size.height);
            self.coll2.frame=CGRectMake(self.coll.frame.size.width, self.coll2.frame.origin.y, self.coll2.frame.size.width, self.coll2.frame.size.height);
             NSLog(@"self.sendBtn.titleLabel.frame.origin.x=%f,,,,,elf.sendBtn.titleLabel.frame.size.width==%f",self.sendBtn.titleLabel.frame.origin.x,self.sendBtn.titleLabel.frame.size.width);
        } completion:^(BOOL finished) {
            //            self.coll.hidden=NO;
            //            self.coll2.hidden=YES;
            
        }];
        
        self.sendBtn.tintColor=[UIColor colorWithRed:0/255.0 green:115/255.0 blue:254/255.0 alpha:1];
        self.revBtn.tintColor=[UIColor grayColor];
        
    }
    else{
        [UIView animateWithDuration:0.5 animations:^{
            
            self.view3.frame=CGRectMake(btn_w+12, V_H-2, btn_w-20, 2);//CGRectMake(self.revBtn.titleLabel.frame.origin.x+btn_w+2, V_H-2, self.sendBtn.titleLabel.frame.size.width, 2);//
            self.coll.frame=CGRectMake(-self.coll.frame.size.width, self.coll.frame.origin.y, self.coll.frame.size.width, self.coll.frame.size.height);
            self.coll2.frame=CGRectMake(0, self.coll2.frame.origin.y, self.coll2.frame.size.width, self.coll2.frame.size.height);
        } completion:^(BOOL finished) {
            
            //            self.coll.hidden=YES;
            //            self.coll2.hidden=NO;
        }];
        
        
        self.sendBtn.tintColor=[UIColor grayColor];
        self.revBtn.tintColor=[UIColor colorWithRed:0/255.0 green:115/255.0 blue:255/255.0 alpha:1];
    }
    
}





-(void)createCollection//:(UICollectionView *)collview
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
   // layout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 140);
        layout.minimumLineSpacing=2;
 //    layout.minimumInteritemSpacing=10;
    UICollectionView *coll=[[UICollectionView alloc] initWithFrame:CGRectMake(0, V_H+nav_h, s_width, s_height-V_H-nav_h) collectionViewLayout:layout];
    coll.delegate=self;
    coll.dataSource=self;
    coll.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [coll registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:coll];
    self.coll=coll;
    
}
-(void)createCollection2
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
   // layout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 140);
       layout.minimumLineSpacing=1;
    //    layout.minimumInteritemSpacing=10;
    UICollectionView *coll=[[UICollectionView alloc] initWithFrame:CGRectMake(0, V_H+nav_h, s_width, s_height-V_H-nav_h) collectionViewLayout:layout];
    coll.delegate=self;
    coll.dataSource=self;
    coll.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [coll registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:coll];
    self.coll2=coll;
    
}
#pragma mark 代理
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *str=@"iden";
    
    //     MyTableViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"iden" forIndexPath:indexPath];
    
    UINib *nib=[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"iden"];
    
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"iden" forIndexPath:indexPath];
//    if(self.coll==collectionView &&self.isDianZan==YES)//发出的赞
//    {
//        cell.dainzan.text=self.zhuArr[0]; //[self.pingArr objectAtIndex:0];
//        cell.fuTouLab.text=self.fuheadArr[indexPath.item];
//        cell.fuDteail.text=self.fuDetailArr[indexPath.item];
//    }
//    else
//        if(self.coll2==collectionView &&self.isDianZan==YES)// 收到的赞
//    {
//        cell.dainzan.text=self.zhuArr[1];
//        cell.fuTouLab.text=self.fuheadArr[indexPath.item+2];
//        cell.fuDteail.text=self.fuDetailArr[indexPath.item+2];
//    }
//    else
        if(self.coll==collectionView &&self.isDianZan==NO)//收到的评论
    {
        cell.dainzan.text=self.zhuArr[2];
        //我说的话
        cell.huanLab.text=self.fuheadArr[indexPath.item+4];
        //cell.fuTouLab.text=self.fuheadArr[indexPath.item+4];
        cell.fuDteail.text=self.fuDetailArr[indexPath.item+4];
    }
    else if(self.coll2==collectionView &&self.isDianZan==NO)//发出的评论
    {
        cell.dainzan.text=self.zhuArr[3];
       cell.huanLab.text=self.fuheadArr[indexPath.item+6];
        cell.fuDteail.text=self.fuDetailArr[indexPath.item+6];
    }
    //cell.fuTouLab.text=[self.fuheadArr objectAtIndex:indexPath.item];
  
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(6, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"push到第%ld--界面",(long)indexPath.item);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSDictionary *dic1 = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};//,NSParagraphStyleAttributeName:paragraphStyle1
    float height1;
    NSString *str=nil;
    if(collectionView==self.coll)
    {
    str=[NSString stringWithFormat:@"%@",self.fuheadArr[indexPath.row+4]];
   
    }else
    {
      str=[NSString stringWithFormat:@"%@",self.fuheadArr[indexPath.row+6]];
    }
    CGRect rect = [str boundingRectWithSize:CGSizeMake(s_width-90, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil];
    
    height1 = rect.size.height;
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, height1+110);
    
}


-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr
{
    //    static CGFloat t;
    //    if(iosVersion >= 7.0){
    //        t = 20;
    //    }else{
    //        t = 0;
    //    }
    self.titleImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, s_width, 64)];
    self.titleImg.image = [UIImage imageNamed:@"dilan"];
    self.titleImg.userInteractionEnabled = YES;
    [self.view addSubview:self.titleImg];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
    [self.titleImg addSubview:self.titleLabel];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.titleLabel.userInteractionEnabled = YES;
    
    self.titleLabel.text = titleLabelStr;
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(15, 20+5, 21, 34);
    
    [self.leftBtn setImage:[UIImage imageNamed:@"fanhuibai"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.titleImg addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(s_width-44, 5, 21, 34);
    self.rightBtn.hidden = YES;
    [self.titleImg addSubview:self.rightBtn];
}


-(void)back
{
    self.coll.hidden=YES;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
