//
//  PingDetailTableViewCell.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/15.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "PingDetailTableViewCell.h"
//static CGFloat cellHeiht;
@implementation PingDetailTableViewCell


- (void)awakeFromNib {
    
    self.pingArr=[NSMutableArray array];
  
   
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [self createPingLab];
   // _nameBiao.numberOfLines=0;
    _cellHeight=130+ self.backHeight+10;
    _pingBack.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    _pingBack.layer.cornerRadius=10;
    _pingBack.layer.masksToBounds=YES;
   
    
    _name.textColor=[UIColor colorWithRed:0 green:129/255.0 blue:250/255.0 alpha:1];
   
    _sendPingDown.selected=YES;
    
    self.TouXiang.layer.cornerRadius=25;
    self.TouXiang.layer.borderWidth=2;
    self.TouXiang.layer.masksToBounds=YES;
    self.TouXiang.layer.borderColor=[UIColor whiteColor].CGColor;
    
    
   }
-(void)createPingLab
{
//    _pingDui=@[@": 。。。。。有钱就是任性wawawww呵呵呵呵呵呵呵呵额呵呵呵呵呵呵呵呵呵额呵呵呵呵呵呵呵呵额呵呵呵呵和",@": 任性！wawawwaw哇啊哇哇哇哇哇哇哇哇哇哇哇哇哇",@": 有证么，有牌么 ",@":啦啦啦，得德玛西亚",@": 玉在椟中求善价",@":钗于奁中待时飞哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。"];
//    NSArray *arr=@[@"小哲",@"LarryLin",@"Lunatic.M",@"万艳同悲",@"千红一窟",@"怡红公子"];
//    _pingShu=6;
//    if(_pingShu!=0)
//    {
//        for(int i=0;i<_pingShu;i++)
//        {
    
            
            
//            
//            UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(10, 10,_pingBack.frame.size.width-20,1)];
//      
//             lab.numberOfLines=0;
//            lab.tag=100;
//        lab.backgroundColor=[UIColor blueColor];
//    _lab=lab;
//         //self.PingLab=lab;
//    
//            [_pingBack addSubview:lab];
//        }
//        
//    }

    
    
}
- (IBAction)pingDown:(UIButton *)sender {
    
   
  
    if(sender.selected==YES)
    {
 
       // [sender setBackgroundImage:[UIImage imageNamed:@"collapse"] forState:UIControlStateNormal];
    
//        _pingBack.hidden=NO;
//        // _pingBack.frame=CGRectMake(_pingBack.frame.origin.x, _pingBack.frame.origin.y, _pingBack.frame.origin.y, 0);
//        
//        self.PingLab.hidden=NO;
//        self.SanPing.hidden=NO;
       // sender.selected=NO;
        [self.tagert performSelector:@selector(fangPing:) withObject:@(self.hao)];
    }else
    {
       //  [sender setBackgroundImage:[UIImage imageNamed:@"expand"] forState:UIControlStateNormal];
      
         //sender.selected=YES;
        
//        _pingBack.hidden=YES;
//        
//        
//        self.PingLab.hidden=YES;
//        self.SanPing.hidden=YES;
        [self.tagert performSelector:@selector(shouPing:) withObject:@(self.hao)];
    }
    
}
//刷新
-(void)shanxin:(NSArray *)pingArr AndsubArr:(NSArray *)arr
{
    
    
 
    
   
    NSMutableAttributedString *strrr = [[NSMutableAttributedString alloc] init];
    for(int i=0;i<pingArr.count;i++)
    {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",pingArr[i]] ];
    self.attStr=str;
        
   
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:129/255.0 blue:250/255.0 alpha:1] range:NSMakeRange(0,[arr[i] length])];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange([arr[i] length],[pingArr[i] length]-[arr[i] length])];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0,[arr[i] length])];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange([arr[i] length],[pingArr[i] length]-[arr[i] length])];
       
     
    NSAttributedString *stkong =[[NSAttributedString alloc] initWithString:@"\n"];
      
        
        [strrr appendAttributedString:str];
        if(i<pingArr.count-1)
        {
        [strrr appendAttributedString:stkong];
        }
        
        

        
        
        
        
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:5];//调整行间距
    
    [strrr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [strrr length])];
    self.PingLab.attributedText=strrr;//self.attStr;
    self.PingLab.adjustsFontSizeToFitWidth=YES;
//    self.lab.frame= CGRectMake(5, 5,s_width-106,h);
//    _lab.attributedText=strrr;
    
}

- (IBAction)sendDown:(id)sender {
    [self.tagert performSelector:self.sel withObject:@(self.hao)]; 
    //NSLog(@"sendDown");
}


//-(NSString *)qieString:(NSString *)str Andqie:(NSString *)qie
//{
//   NSArray *dateArr = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":"]];
//    
//    return dateArr[0];
//}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
