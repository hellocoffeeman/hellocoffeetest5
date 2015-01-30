//
//  PingDetailViewController.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/15.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "PingDetailViewController.h"
#import "PingDetailTableViewCell.h"
#import "ToPayayViewController.h"

#define fasong_w 50
static int edit=1;
#define  cellZero_H 143//140
#define charLimit 140
@interface PingDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UIAlertViewDelegate>
{
    NSMutableArray *_arr;
    NSInteger _row;
   // NSInteger

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *cellHeigh;
@property(nonatomic,strong)NSMutableArray *pingArr;
@property(nonatomic,strong)NSMutableArray *nameSign;
@property(nonatomic,strong)NSMutableArray *difPing;

@property(nonatomic,strong)UITextView *textview;
@property(nonatomic,strong)UIView *v1;

@property(nonatomic,strong)NSMutableArray *celllongArr;
@property(nonatomic,strong)NSMutableArray *cellDuanArr;

@property(nonatomic,strong)NSMutableArray *MyPublicArr;


@property(nonatomic,strong)PingDetailTableViewCell *facell;

// 缩放时用到的数组
@property(nonatomic,strong)NSMutableArray *extandPingArr;
@property(nonatomic,strong)NSMutableArray *extandArr;

//评论数

@end

@implementation PingDetailViewController

-(instancetype)init
{
  if(self=[super init])
  {
      self.cellHeigh=[NSMutableArray arrayWithCapacity:0];
      self.pingArr=[NSMutableArray arrayWithCapacity:0];
      self.nameSign=[NSMutableArray arrayWithCapacity:0];
      self.difPing=[NSMutableArray arrayWithCapacity:0];
     self.cellDuanArr=[NSMutableArray arrayWithCapacity:0];
      self.celllongArr=[NSMutableArray arrayWithCapacity:0];
      _arr=[NSMutableArray arrayWithCapacity:0];
      _MyPublicArr=[NSMutableArray arrayWithCapacity:0];
    _extandPingArr=[NSMutableArray arrayWithCapacity:0];
     _extandArr=[NSMutableArray arrayWithCapacity:0];
      }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"评论详情" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
     [self loadData];
   // _tableView.separatorColor=[UIColor clearColor];
    _tableView.showsVerticalScrollIndicator=NO;
    [self createTextview];
    _tableView.separatorColor=[UIColor clearColor];
   
}

-(void)loadData
{

    NSArray *pub=@[@"  年轻时我们放弃，以为那只是一段感情，后来才知道，那其实是1生。",@" 我很好，不吵不闹不炫耀，不要委屈不要嘲笑，也不需要别人知道。",@" 朋友们都羡慕我，其实羡慕他们的人是我。 爱你，很久了，等你，也很久了，现在，我要离开你了，比很久 很久还要久",@" 女巫亲吻过的咒语破天而来、浇湿的誓言漉漉退场、我坐在海上补一张网、你伏在海底披星戴月的歌唱。 把爱写成兵临城下的不朽传奇、那么、你会不会不辞冰雪披荆斩棘地奔赴而来。 谁眼角朱红的泪痣成全了你的繁华一世、你金戈铁马的江山赠与谁一场石破惊天的空欢喜。 下一世的情歌、把词交由你填、看看你仍旧是谁高高在上的王。橱窗里盛放的琳琅满目、是阜盛而过的年华栩栩生辉。 爱尔兰雪、土耳其蓝、莫斯科眼泪。我都收藏在小小的太阳里、还有晴天和微笑。波斯湾海、维也纳厅、阿 拉伯传说。我都纪念在厚厚的相集里。还有七粉和公主。  把醉了的明天寄托在潘多拉的琴弦、浮沉余生虚伪地歌咏天上人间。有没有跟你说过爱是我不变的信仰、我有没有告诉过你爱就是永远把一个人放在心上。喜欢的歌、静静地听。喜欢的人、远远的看.过程和结局都有了、再去纠缠、连自己都觉得贪婪。 ",@"我在漫天风雪的回忆里披荆斩棘、你却在哪一个的字典里演绎皈依。 "];
    _MyPublicArr=[NSMutableArray arrayWithArray:pub];
    NSArray *ping=@[@[@" 。。。。。有钱就是任性wawawww呵呵呵呵呵呵呵呵额呵呵呵呵呵呵呵呵呵额呵呵呵呵呵呵呵呵额呵呵呵呵和",@"原来你也在这里"],@[@" 任性！wawawwaw哇啊哇哇哇哇哇哇哇哇哇哇哇哇哇"],@[@" 有证么，有牌么呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵 ",@"啦啦啦，得德玛西亚啊卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡卡"],@[@"玉在椟中求善价"],@[@"钗于奁中待时飞哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。wow我我我我我哦我我我我我我哦我我我哦我我哦我我哦我我噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢"]];
    NSArray *arr=@[@[@"小哲",@"偶然"],@[@"LarryLin"],@[@"Lunatic.M"],@[@"万艳同悲"],@[@"千红一窟"]];
   
    NSString *str1;
    NSString *str2;
    for(int i=0;i<arr.count;i++)
    {
        NSMutableArray *tempArr=[NSMutableArray array];
        NSMutableArray *temp2Arr=[NSMutableArray array];
        for(int j=0;j<[arr[i] count];j++)
        {
        str1=[NSString stringWithFormat:@"%@:%@",arr[i][j],ping[i][j]];
            [tempArr addObject:str1];
            
            str2=arr[i][j];
            [temp2Arr addObject:str2];
        }
       
        
        [self.pingArr addObject:[tempArr mutableCopy]];
       
        [_arr addObject:[temp2Arr mutableCopy]];
        
        
        [tempArr removeAllObjects];
        [temp2Arr removeAllObjects];
        
        
        
    }
    
    
    _extandPingArr=[self.pingArr mutableCopy];
    _extandArr=[_arr mutableCopy];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }else
    {
    return self.pingArr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib=[UINib nibWithNibName:@"PingDetailTableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:@"pingcell"];
    NSDictionary *dic1 = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    NSString *str=[NSString stringWithFormat:@"%@",self.MyPublicArr[indexPath.row]];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(s_width-91, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil];
    
    float height1 = rect.size.height;
    
    PingDetailTableViewCell *cell= [tableView  dequeueReusableCellWithIdentifier:@"pingcell" forIndexPath:indexPath];
    
    if(cellZero_H+height1+10>cell.frame.size.height)
    {
        cell.pingBack.alpha=0;
        cell.SanPing.alpha=0;
        cell.suofangBtn.selected=YES;
         [cell.suofangBtn setBackgroundImage:[UIImage imageNamed:@"expand"] forState:UIControlStateNormal];
       
        
    }else
    {
        cell.pingBack.alpha=1;
        cell.SanPing.alpha=1;
       
         cell.suofangBtn.selected=NO;
        [cell.suofangBtn setBackgroundImage:[UIImage imageNamed:@"collapse"] forState:UIControlStateNormal];
        
    }
     cell.tagert=self;
    cell.hao=indexPath.row;
    cell.sel=@selector(btnDown:);
    
    
   
    
    
    [cell shanxin:self.pingArr[indexPath.row] AndsubArr:_arr[indexPath.row]];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:5];//调整行间距
    cell.nameBiao.text=self.MyPublicArr[indexPath.row];
    cell.TouXiang.image=[UIImage imageNamed:@"touxiang@2x.png"];
  
     cell.pingCount.text=[NSString stringWithFormat:@"%ld",(unsigned long)[_extandPingArr[indexPath.row] count]] ;
    
   
    
    self.facell=cell;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   

    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:5];//调整行间距

    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSParagraphStyleAttributeName:paragraphStyle};
    CGFloat h=0;

    
//    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
//    
//    [paragraphStyle1 setLineSpacing:2];//调整行间距
    
     NSDictionary *dic1 = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};//,NSParagraphStyleAttributeName:paragraphStyle1
    
            NSString *str=[NSString stringWithFormat:@"%@",self.MyPublicArr[indexPath.row]];
        CGRect rect = [str boundingRectWithSize:CGSizeMake(s_width-91, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil];
    
        float height1 = rect.size.height;
        h=h+height1;
  
    
    for(int i=0;i<[self.pingArr[indexPath.row] count];i++)//
    {
       // NSLog(@"self.pingArr[indexPath.row][i]===%@",self.pingArr[indexPath.row][i]);
        NSString *str=[NSString stringWithFormat:@"%@",self.pingArr[indexPath.row][i]];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(s_width-106, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        NSString *str11=@"\n";
        CGRect rectkong = [str11 boundingRectWithSize:CGSizeMake(s_width-106, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil];
    float height = rect.size.height;
        h=h+height+[@"\n" length];//+rectkong.size.height;
        
  //  }
    }
    // NSLog(@"******vczhongheight===%f",h);
       return h+cellZero_H;
   

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *sectionArr = @[@"      热门讨论",@"      最新发布"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   // btn.frame = CGRectMake(10, 0, s_width, 44);
    [btn setTitle:sectionArr[section] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor clearColor];
    btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
   
    btn.tag = 1000+section;
    return btn;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ToPayayViewController *pay=[[ToPayayViewController alloc] init];
//    [self.navigationController pushViewController:pay animated:YES];
    
   [self.textview resignFirstResponder];
}

-(void)btnDown:(NSNumber *)hao
{
   // NSLog(@"btnDown");
    _row=[hao integerValue];
    [self.textview becomeFirstResponder];

}
/**
 *  点击时评论隐藏，cell缩短
 *
 *  @param hao 第几个cell
 */
-(void)shouPing:(NSNumber *)hao
{
   // NSLog(@"shouPing:(NSNumber *)hao");
// 
//    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSLog(@"======documentPath==%@",documentPath);
//    NSString *path = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"pingArr_%d.plist",[hao intValue]]];
//    NSString *path2 = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"_arr_%d.plist",[hao intValue]]];
//    
//    NSArray *arr=[self.pingArr[[hao integerValue]] mutableCopy];
    //_extandPingArr=[self.pingArr[[hao integerValue]] mutableCopy];
//    if(arr.count>0)
//    {
//    [arr writeToFile:path atomically:YES];
//    }
//    NSArray *arr1=[_arr[[hao integerValue]] mutableCopy];
//    if(arr1.count)
//    {
//    [arr1 writeToFile:path2 atomically:YES];
//    }
    // _extandArr=[_arr[[hao integerValue]] mutableCopy];
    [self.pingArr removeObjectAtIndex:[hao integerValue]];
    [_arr removeObjectAtIndex:[hao integerValue]];
    [self.pingArr insertObject:@[] atIndex:[hao integerValue]];
    [_arr insertObject:@[] atIndex:[hao integerValue]];
    
    
    [_tableView reloadData];
  
   }
/**
 *  放开评论列表
 *
 *  @param hao 点击了第几个cell
 */
-(void)fangPing:(NSNumber *)hao
{
//    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//   
//    NSString *path = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"pingArr_%d.plist",[hao intValue]]];
//    NSString *path2 = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"_arr_%d.plist",[hao intValue]]];
//    
//   NSMutableArray *ping = [[NSMutableArray alloc] initWithContentsOfFile:path];
//     NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:path2];
    NSMutableArray *ping =_extandPingArr;//[_pingArr[[hao integerValue]] mutableCopy];//
    NSMutableArray *arr=_extandArr;//[_arr[[hao integerValue]] mutableCopy];//
    if(ping.count>0&&arr.count>0)
    {
     [self.pingArr removeObjectAtIndex:[hao integerValue]];
     [_arr removeObjectAtIndex:[hao integerValue]];

     [self.pingArr insertObject:ping[[hao integerValue]] atIndex:[hao integerValue]];
     [_arr insertObject:arr[[hao integerValue]] atIndex:[hao integerValue]];
     
    }
   [_tableView reloadData];
    
}
-(void)createTextview
{
    UIView *v1=[[UIView alloc] initWithFrame:CGRectMake(0 ,[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 60)];//40,320,60 )];
    v1.backgroundColor=[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    [self.view addSubview:v1];
    _v1=v1;
    UITextView *textview=[[UITextView alloc] initWithFrame:CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width-20-fasong_w, 40)];
    
    textview.text=@"评论";
    textview.delegate=self;
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 0; //行距
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:18], NSParagraphStyleAttributeName:paragraphStyle};//字体
    
    textview.attributedText = [[NSAttributedString alloc]initWithString: textview.text attributes:attributes];
    
    [v1 addSubview:textview];
    self.textview=textview;
    textview.textColor=[UIColor lightGrayColor];
    self.textview.layer.cornerRadius=5;
    self.textview.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.textview.layer.borderWidth=1;
    
    
    UIButton *faBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    faBtn.frame=CGRectMake(textview.frame.origin.x+textview.frame.size.width, 10, fasong_w, 40);
    [faBtn addTarget:self action:@selector(fasongBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    [faBtn setTitle:@"发送" forState:UIControlStateNormal];
    [v1 addSubview:faBtn];
    // self.textview.inputAccessoryView=v1;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyframe:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}
-(void)keyboardWillShow:(NSNotification*)notification
{
    CGRect _keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.v1.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-_keyboardRect.size.height-_v1.frame.size.height, _v1.frame.size.width, _v1.frame.size.height);
    }];
    
    //self.textview.text=@"评论";
    //　_textview.selectedRange = NSMakeRange(0,0);
    
}
-(void)keyboardWillHide:(NSNotification*)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        self.v1.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height, _v1.frame.size.width, _v1.frame.size.height);
        
    }];
}
//键盘改变
-(void)textDidChanged:(NSNotification*)notification
{
   
    
}

-(void)keyframe:(NSNotification* )notification
{
     NSString *str=[[UITextInputMode currentInputMode] primaryLanguage];
    
//    if([str isEqualToString:@"emoji"])
//    {
//        　_textview.selectedRange = NSMakeRange(0,0);
//        self.textview.text=nil;
//    }
    
   // NSLog(@"wowowoowofrrkhkvbjkx b===%@,self.textview.text==%@",str,self.textview.text);
}
-(void)fasongBtnDown:(UIButton *)btn
{
    NSLog(@"发送");
    
 
    
    if(![self isenterorSpace:self.textview.text])
    {
        self.textview.text=nil;
        [self.textview resignFirstResponder];
        return;
    }
   
    if(self.celllongArr.count)
    {
        [self.celllongArr removeAllObjects];
        [self.cellDuanArr removeAllObjects];
     
    }
   
    if([self.textview.text length]!=0&&![self.textview.text isEqualToString:@"评论"])
        {
             NSArray *arr=self.pingArr[_row];
            
             NSArray *duanArr=_arr[_row];
            
            [self.pingArr removeObjectAtIndex:_row];
            [self.celllongArr addObjectsFromArray:arr];
            //去掉空行
            NSString *labelString =[self.textview.text stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSString *myString = [labelString stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
            NSLog(@"labelString==%@",labelString);
            NSLog(@"myString--=%@",myString);
            
            
            [self.celllongArr addObject:[NSString stringWithFormat:@"我说: %@",myString]];//self.textview.text
            [self.pingArr insertObject:[self.celllongArr mutableCopy] atIndex:_row];
           // [self.pingArr[_row] addObject:[NSString stringWithFormat:@"我说: %@",self.textview.text]];
            
            
            [_arr removeObjectAtIndex:_row];
            [self.cellDuanArr addObjectsFromArray:duanArr];
            [self.cellDuanArr addObject:@"我说"];
            [_arr insertObject:[self.cellDuanArr mutableCopy] atIndex:_row];
           
           
            [_extandPingArr[_row] addObject:[NSString stringWithFormat:@"我说: %@",myString]];//self.textview.text
          
            [_extandArr[_row] addObject:@"我说"];
            
           
            
            }
    
    
    self.textview.text=nil;
    [self.textview resignFirstResponder];
     edit=1;
    
  
    
    
    
    
    [self fangPing:@(_row) ];
    
    
    [_tableView reloadData];
   

}


/**
 *  判断字符串是否全为同一个字符
 *
 *  @param str  传入的字符串
 *  @param zifu 单个字符
 *
 *  @return 返回yes字符串不全一样，no字符串为同一个字符组成
 */
-(BOOL)isKong:(NSString * )str AndCharater:(char) zifu
{
    for(int i=0;i<[str length];i++)
    {
        if([str characterAtIndex:i]!=zifu)
        {
            return YES;
        }
    }
    //NSLog(@"=====textField.text=(%@),---length==%lu",str,(unsigned long)[str length]) ;
    return NO;
}
/**
 *  判断传入的字符串是否为回车和空格的组合
 *
 *  @param str 传入的字符串
 *
 *  @return 返回no为回车和空格的组合
 */
-(BOOL) isenterorSpace:(NSString *)str
{
    for(int i=0;i<[str length];i++)
    {
        if([str characterAtIndex:i]!=' ')
        {
           if([str characterAtIndex:i]!='\n')
            return YES;
        }
        if([str characterAtIndex:i]!='\n')
        {
             if([str characterAtIndex:i]!=' ')
            return YES;
        }
        
    }
    // NSLog(@"其他字符，");
    //NSLog(@"=====textField.text=(%@),---length==%lu",str,(unsigned long)[str length]) ;
    return NO;
}

#pragma mark textview delegte
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
   
    //　_textview.selectedRange = NSMakeRange(0,0);
   // NSLog(@"self.textview.text==%@",self.textview.text);
// if([self.textview.text isEqualToString:@"评论"])
// {
//   self.textview.text=@"";
// }

   
    

    
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
   
   

}

-(void)textViewDidChange:(UITextView *)textView
{
    
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
   //NSLog(@"text==%@,,textView.text=%@",text,textView.text);
    
    if(edit==1)
    {
        _textview.selectedRange = NSMakeRange(1,0);
        NSString *str= self.textview.text;
        //self.textview.text=nil;
        
        self.textview.text =[str substringToIndex:0];
        edit=2;
        
    }

    
      if([textView.text length]>charLimit)
   {
       NSString *str=[NSString stringWithFormat:@"输入的文字超过%d",charLimit];
       UIAlertView *alter=[[UIAlertView alloc] initWithTitle:@"警告" message:str  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
       [alter show];
   }
    
    return YES;
}

//cancelButtonTitle为0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    //NSLog(@"buttonIndex==%d",buttonIndex);
   NSString *str= _textview.text;
    _textview.text=[str substringWithRange:NSMakeRange(0, charLimit)];
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}





@end
