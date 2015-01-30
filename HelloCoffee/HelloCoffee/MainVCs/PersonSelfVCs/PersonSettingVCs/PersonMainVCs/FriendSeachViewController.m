//
//  FriendSeachViewController.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/20.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "FriendSeachViewController.h"
#import "SeachFriendCollectionViewCell.h"
#import "HistrorySeachCollectionViewCell.h"
#import "FMDatabase.h"
#define cannelBtn_w  60
#define lab_h 50
#define his_h 200
#define isIPhonX(H) ((H>560)?200:100)
@interface FriendSeachViewController ()<UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,strong)UITextField *seachtext;
@property(nonatomic,strong)UICollectionView *friendListColl;
@property(nonatomic,strong)UICollectionView *histroyColl;
@property(nonatomic,strong)UIImageView *imgback;
@property(nonatomic,strong)NSMutableArray *hisArr;
@property(nonatomic,assign)NSInteger row;
@property(nonatomic,strong)UIButton *allDelBtn;
@property(nonatomic,strong)UIView *btnUpview;
@property(nonatomic,strong)NSMutableArray *danShanArr;

//@property(nonatomic,weak)UITapGestureRecognizer *tap;
@property(nonatomic,strong)NSMutableArray *cellFuArr;

@property(nonatomic,strong)FMDatabase *db;

@end

@implementation FriendSeachViewController
-(id)init
{
 if(self=[super init])
 {
     self.hisArr=[NSMutableArray arrayWithCapacity:0];
     _danShanArr=[NSMutableArray arrayWithCapacity:0];
     _cellFuArr=[NSMutableArray arrayWithCapacity:0];
 }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createView];
    [self loadData];
}


//-(void)viewDidAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden=YES;
//}
-(void)loadData
{
   // [self.hisArr addObjectsFromArray:@[@"大王叫我来巡山",@"hello树先生",@"徐晓新",@"何以笙箫默",@"原来你也在这里"]];
    
    [self.cellFuArr addObjectsFromArray:@[@"摔倒了爬起来就好。",@"太阳照亮人生的路，月亮照亮心灵的路",@"我们必须拿我们所有的，去换我们所没有的。",@"幸福就像香水，洒给别人也一定会感染自己。"]];
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"];
    
    [self.hisArr addObjectsFromArray:arr];
}
-(void)createView
{
    UIImageView *imgback=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, s_width, 64)];
    imgback.backgroundColor=kBlueColor;
    imgback.userInteractionEnabled=YES;
    [self.view addSubview:imgback];
    UIImageView *imgText=[[UIImageView alloc] initWithFrame:CGRectMake(15, 25,s_width-cannelBtn_w-30 , 32)];
    imgText.image=[UIImage imageNamed:@"sousuohengtiaodise@2x"] ;
    [imgback addSubview:imgText];
    UITextField *seach=[[UITextField alloc] initWithFrame:CGRectMake(50, 25,s_width-cannelBtn_w-30-30 , 32)];//CGRectMake(20, 25,s_width-cannelBtn_w-30 , 32)
    seach.delegate=self;
    [imgback addSubview:seach];
    //seach.layer.cornerRadius=5;
    seach.placeholder=@"请输入昵称";
    seach.backgroundColor=[UIColor clearColor];
    //seach.leftView
   
    
    UIImageView *sou=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuohengtiaotubiao@2x"]];
    sou.frame=CGRectMake(20, 31,20,20);
    [imgback addSubview:sou];
    //seach.leftView=sou;
    seach.leftViewMode=UITextFieldViewModeAlways;
    seach.clearButtonMode=UITextFieldViewModeAlways;
    seach.clearsOnBeginEditing=YES;
    seach.textColor=[UIColor grayColor];
    seach.keyboardType=UIKeyboardTypeWebSearch;
    seach.adjustsFontSizeToFitWidth=YES;
    self.seachtext=seach;
    //return键变成什么键
    seach.returnKeyType=UIReturnKeySearch;
    //键盘外观
    seach.keyboardAppearance=UIKeyboardAppearanceDefault;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(seach.frame.size.width+seach.frame.origin.x, 25, cannelBtn_w, 32);
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cannelDown:) forControlEvents:UIControlEventTouchUpInside];
    btn.tintColor=[UIColor whiteColor];
    btn.titleLabel.font=[UIFont systemFontOfSize:18];
    
    [imgback addSubview:btn];
    
    UIView *v1=[[UIView alloc] initWithFrame:CGRectMake(0,64,s_width , lab_h)];
    
    v1.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    v1.userInteractionEnabled=YES;
    [self.view addSubview:v1];
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(10, 64,s_width-20 , lab_h)];
    lab.text=@"可能感兴趣的人";
    lab.textColor=[UIColor grayColor];
    [self.view addSubview:lab];
   // lab.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    lab.textAlignment=NSTextAlignmentLeft;
    lab.font=[UIFont systemFontOfSize:24];
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    layout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 80);
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    UICollectionView *coll=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64+lab_h, s_width, s_height-64) collectionViewLayout:layout];
    coll.delegate=self;
    coll.dataSource=self;
   
    coll.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    self.friendListColl=coll;
    [coll registerClass:[SeachFriendCollectionViewCell class] forCellWithReuseIdentifier:@"list"];
    [self.view addSubview:coll];

    
}

-(void)createSouSuo
{
    UIImageView *imgback=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, s_width, s_height-64)];
    imgback.userInteractionEnabled=YES;
    imgback.image=[UIImage imageNamed:@"caidanbantoumingyinying@2x"];
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
     coll.bounces=NO;
    coll.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    _histroyColl=coll;
    coll.userInteractionEnabled=YES;
    [coll registerClass:[HistrorySeachCollectionViewCell class] forCellWithReuseIdentifier:@"his"];
    [imgback addSubview:coll];
    
//    UIView *v=[[UIView alloc] initWithFrame:CGRectZero];//CGRectMake(0, coll.frame.size.height, s_width, 1)
//    v.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
//    [imgback addSubview:v];
//    _btnUpview=v;
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame=CGRectZero;//CGRectMake(0, coll.frame.size.height+1, s_width, 50);
//    [btn setTitle:@"清除所有搜索记录" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(deletehisDown:) forControlEvents:UIControlEventTouchUpInside];
//    btn.tintColor=[UIColor grayColor];
//    btn.backgroundColor=[UIColor whiteColor];
//    btn.titleLabel.font=[UIFont systemFontOfSize:20];
//    _allDelBtn=btn;
   // [imgback addSubview:btn];
    _imgback=imgback;
    
    
}

//
-(void)imgbackTap:(UITapGestureRecognizer *)tap
{
    [_imgback removeFromSuperview];
    [_seachtext resignFirstResponder];
}
//添加好友
-(void)AddGoodFriend:(NSNumber *)hao
{
    [_seachtext resignFirstResponder];
    NSLog(@"hao=%ld",[hao integerValue]);
}
//删除单个
-(void)danDeteDown:(NSNumber *)row
{
    [self.hisArr removeObjectAtIndex:[row integerValue]];
    
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"];
    
    [self.danShanArr addObjectsFromArray:arr];
    [self.danShanArr removeObjectAtIndex:[row integerValue]];
    [[NSUserDefaults standardUserDefaults] setObject:self.danShanArr forKey:@"hisArr"];
    [self.danShanArr removeAllObjects];
    
     NSArray *arr1=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"];
    if(arr1.count*50<isIPhonX(s_height))//self.hisArr.count
    {
    _histroyColl.frame=CGRectMake(0, 0, s_width, arr1.count*50+50);
        
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
    
}
//清空历史
-(void)deletehisDown:(UIButton*)btn
{
    [self.hisArr removeAllObjects];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"hisArr"];
   // NSLog(@"[[NSUserDefaults standardUserDefaults] removeObjectForKey:]===%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"]);
     [_imgback removeFromSuperview];
    
   // [_tap ];
}
//取消按钮
-(void)cannelDown:(UIButton *)btn
{
    [self.seachtext resignFirstResponder];
    [_imgback removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

//FMDB建表
-(void)createSQlite:(NSString *)fileName //AndTable:(NSString *)tableName
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]=======%@",documentPath);
    NSString *path = [documentPath stringByAppendingPathComponent:fileName];//@"gaoxingqu.db"
     FMDatabase *db = [FMDatabase databaseWithPath:path];
    _db=db;
    BOOL isOpen = [db open];//打开数据库
    if(!isOpen)
    {
        //弹出警报，数据库打开异常
        NSLog(@"数据库打开异常");
        return;
    }

    //4、打开数据库成功后，开始建表，从这里开始要用到sql语句
    
    //拼写建表的sql语句
    NSString *createStr = [NSString stringWithFormat:@"create table %@ (%@)",@"hisArr",@"nameStr"];
    //create关键字表示建表
    //table关键字引导后面的表名，第一个%@
    //表名后面有一个（小括号），小括号里是这个表的字段
    
    BOOL isCreateSuccess = [db executeUpdate:createStr];//建表
    if(isCreateSuccess)
    {
        NSLog(@"建表成功");
    }
    else
    {
        NSLog(@"建表失败");
    }
    
    //当想建的这个表的表名在这个数据库中已经存在了，就会建表失败
    //一个数据库中可以创建很多不同的表，表名不能重复
    //当使用create 这个sql语句时，如果没表，就创建并打开，如果已经有了，就打开
    //增
    
}
//FMDB插入数据
-(void)insertDuanContent:(NSString *)duancContent
{
    //5、插入数据
    
    //拼写sql语句
    NSString *insertStr = [NSString stringWithFormat:@"INSERT into %@ values(?)",@"hisArr"];  //Insert
    //insert是插入关键字
    //into引导要被插入的表名
    //values后面的括号里是这个表的字段，用"?"表示，？就相当于我们的%@的作用
    
    //把文本插入数据库
    BOOL isInsertSuccess = [_db executeUpdate:insertStr,duancContent];
    if(isInsertSuccess)
    {
        NSLog(@"插入成功");
    }
    else
    {
        NSLog(@"插入失败");
    }
    

}
-(void)FMDBDelete
{
    //5、查找
    //写一个查找的sql语句
    NSString *searchStr = @"select * from hisArr";
    //select 是查找关键字
    //*表示整个遍历，完整查找
    //from 引导被查找的表名，这里是people
    
    //查找动作方法与增删改 不一样，调用方法的对象，返回值不是BOOL值
    FMResultSet *rs1=[_db executeQuery:searchStr];
    
  //  NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:0];//数据库查出来的一般都是一个数组
    NSString *str11;
    while ([rs1 next])//表示只要表还有下一条记录就继续查找
    {
        NSString *name = [rs1 stringForColumn:@"nameStr"];//@“name”中的name就是每一条记录对应的字段名称，使用stringForColumn就可以把这一条对应的字段name的值取出来
      
        //[tempArr addObject:@[name,age,job]];
        str11=name;
    }
    
    
}

#pragma mark textview

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self createSouSuo];
    
      NSArray *arr1=[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"];
    if(arr1.count*50<isIPhonX(s_height))//his_h
    {
        _histroyColl.frame=CGRectMake(0, 0, s_width, arr1.count*50+50);
        
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   
     NSLog(@"textField.text=(%@),length==%lu",textField.text,(unsigned long)[textField.text length]) ;
    
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
      
        

         [[NSUserDefaults standardUserDefaults] setObject:self.hisArr forKey:@"hisArr"];
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
     NSLog(@"=====textField.text=(%@),---length==%lu",str,(unsigned long)[str length]) ;
    return NO;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    // [_imgback removeFromSuperview];
    return YES;
}
#pragma  mark collview
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView==self.friendListColl)
    {
    UINib *nib=[UINib nibWithNibName:@"SeachFriendCollectionViewCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"list"];
    
    SeachFriendCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"list" forIndexPath:indexPath];
        cell.titleLabel.text=self.cellFuArr[indexPath.row];
        cell.row=indexPath.row;
//        cell.taget=self;
      return cell;
 
    }else
    {
        UINib *nib=[UINib nibWithNibName:@"HistrorySeachCollectionViewCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"his"];
        
        HistrorySeachCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"his" forIndexPath:indexPath];
        if(indexPath.row<[[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"] count])
        {
        cell.nameLab.text=[[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"] objectAtIndex:indexPath.row];//self.hisArr[indexPath.row];
            cell.delBtn.alpha=1;
             cell.nameLab.textAlignment=NSTextAlignmentLeft;
        }
        else
        {
            cell.nameLab.textAlignment=NSTextAlignmentCenter;
            cell.userInteractionEnabled=YES;
            cell.delBtn.alpha=0;
             cell.nameLab.text=@"清除所有搜索记录";
            
            
            
            
        }
        cell.taget=self;
        cell.row=indexPath.row;
        
     
        
        return cell;
    }
    
    }

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(collectionView ==self.friendListColl)
    {
    return 4;
    }else
    {
        return self.hisArr.count+1;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(collectionView ==self.friendListColl)
    {
    [_seachtext resignFirstResponder];
    }else
    {
        
        HistrorySeachCollectionViewCell *cell = (HistrorySeachCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
        if(indexPath.row<[[[NSUserDefaults standardUserDefaults] objectForKey:@"hisArr"] count])
        {
       _seachtext.text = cell.nameLab.text;
        [_imgback removeFromSuperview];
        [_seachtext resignFirstResponder];
        }
        else
        {
            [self deletehisDown:nil];
        }
    }
}
@end
