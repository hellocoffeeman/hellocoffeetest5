//
//  TUIJianCollectionViewCell.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/4.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "TUIJianCollectionViewCell.h"
#import "personSelf.h"
@implementation TUIJianCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
        self.tuoXiang.layer.masksToBounds=YES;
    self.tuoXiang.layer.cornerRadius=25;
    self.tuoXiang.layer.borderColor=[UIColor whiteColor].CGColor;
    self.tuoXiang.layer.borderWidth=2;
    //self.tuoXiang.contentMode = UIViewContentModeScaleAspectFill;
//    self.tuoXiang.enabled=NO;
//    self.tuoXiang.adjustsImageWhenDisabled=NO;

    
    
    
//    self.DianzanXin.layer.masksToBounds=YES;
//    self.DianzanXin.layer.cornerRadius=10;
//    self.DianzanXin.layer.borderColor=[UIColor whiteColor].CGColor;
//    self.DianzanXin.layer.borderWidth=2;
//    self.DianzanXin.enabled=NO;
//    self.DianzanXin.adjustsImageWhenDisabled=NO;

     self.DianzanXin.contentMode = UIViewContentModeScaleAspectFill;
    
    self.zanShu.enabled=NO;
    self.zanShu.adjustsImageWhenDisabled=NO;
    self.zanShu.tintColor=[UIColor colorWithRed:79/255.0 green:77/255.0 blue:75/255.0 alpha:1];
    //self.zanShu.titleLabel.textColor=[UIColor colorWithRed:79/255.0 green:77/255.0 blue:75/255.0 alpha:1];
    
    self.backgroundView.contentMode=UIViewContentModeScaleToFill;
    
    [self textSize];

   // self.headText.adjustsFontSizeToFitWidth=YES;
   // [self.headText sizeToFit];
   // NSLog(@"%@",[UIFont familyNames]);
    //self.backView.contentMode=UIViewContentModeScaleAspectFill;
    
    self.zengJian.alpha=0;
    self.zengJian.enabled=NO;
    self.zengJian.adjustsImageWhenDisabled=NO;
    _isZan=YES;
     self.zengJian.frame=CGRectMake(self.zanShu.frame.origin.x+3, self.zanShu.frame.origin.y, self.zengJian.frame.size.width, self.zengJian.frame.size.height);
    //_isLoading=NO;
    
   
}

-(void)textSize
{
    if([UIScreen mainScreen].bounds.size.width>375)
    {
        self.headText.font=[UIFont boldSystemFontOfSize:20];
        self.detailText.font=[UIFont systemFontOfSize:18];
        
    }else if([UIScreen mainScreen].bounds.size.width==375.0)
    {
        self.headText.font=[UIFont boldSystemFontOfSize:18];//[UIFont fontWithName:@"Bangla Sangam MN" size:20];//
        self.detailText.font=[UIFont boldSystemFontOfSize:16];//[UIFont fontWithName:@"Bangla Sangam MN" size:16];//[UIFont systemFontOfSize:17];
       // NSLog(@"cell=====");
    }else
    {
        self.headText.font=[UIFont boldSystemFontOfSize:16];
        self.detailText.font=[UIFont systemFontOfSize:14];
              // NSLog(@"cell=====");
    }
}
- (IBAction)zanDianDown:(id)sender {
    
   
//     NSLog(@"11111111_isLoading===%d",_isLoading);
    if(_isLoading==YES)
    {
        return;
    }
     _isLoading=YES;
   // NSLog(@"_isLoading===%d",_isLoading);
    if(_isZan==YES)
    {
        _isZan=NO;
       
        self.zengJian.transform=CGAffineTransformMakeRotation(0);
         self.zengJian.frame=CGRectMake(self.zanShu.frame.origin.x+3, self.zanShu.frame.origin.y, self.zengJian.frame.size.width, self.zengJian.frame.size.height);
        self.xinImg.image=[UIImage imageNamed:@"dianzanxinxingtubiao2@2x"];
         self.zengJian.alpha=1;
         NSString *str= self.zanShu.currentTitle;
        NSInteger i=[str integerValue];
                i++;
        [self.zanShu setTitle:[NSString stringWithFormat:@"%ld",i] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            
            
            
            self.zengJian.frame=CGRectMake(self.zanShu.frame.origin.x+3, self.zanShu.frame.origin.y-25, self.zengJian.frame.size.width, self.zengJian.frame.size.height);
            [self.zengJian setBackgroundImage:[UIImage imageNamed:@"jia1@2x"] forState:UIControlStateNormal];
//            [self.zengJian setTitle:@"+1" forState:UIControlStateNormal];
//            self.zengJian.titleLabel.transform=CGAffineTransformMakeRotation(M_PI/9.0);
        } completion:^(BOOL finished) {
           
            if(finished)
            {
            [UIView beginAnimations:@"danchu" context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDuration:0.5];
            self.zengJian.alpha=0;
           
            [UIView commitAnimations];
            }
            _isLoading=NO;

            
        }];
        
        
    }else
    {
        _isZan=YES;
        //_isLoading=YES;

         self.zengJian.frame=CGRectMake(self.zanShu.frame.origin.x+3, self.zanShu.frame.origin.y, self.zengJian.frame.size.width, self.zengJian.frame.size.height);//+ self.zanShu.frame.size.height
        self.xinImg.image=[UIImage imageNamed:@"dianzanxinxingtubiao1@2x"];
        self.zengJian.alpha=1;
        NSString *str= self.zanShu.currentTitle;
        NSInteger i=[str integerValue];
            i--;
         [self.zanShu setTitle:[NSString stringWithFormat:@"%ld",i] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
           
            self.zengJian.frame=CGRectMake(self.zanShu.frame.origin.x+10, self.zanShu.frame.origin.y+30, self.zengJian.frame.size.width, self.zengJian.frame.size.height);
            [self.zengJian setBackgroundImage:[UIImage imageNamed:@"jian1@2x"] forState:UIControlStateNormal];
//            [self.zengJian setTitle:@"-1" forState:UIControlStateNormal];
//            self.zengJian.titleLabel.transform=CGAffineTransformMakeRotation(M_PI/9.0);
            self.zengJian.transform=CGAffineTransformMakeRotation(M_PI/9.0);
            
        } completion:^(BOOL finished) {
            
            if(finished)
            {
            [UIView beginAnimations:@"danchu" context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDuration:0.5];
            self.zengJian.alpha=0;
            
            [UIView commitAnimations];
            }
           
            _isLoading=NO;

        }];

        
    }
    
    
}
- (IBAction)touXiangDown:(id)sender {
    
    NSLog(@"-----------");
    [self.target performSelector:self.method withObject:nil];
    
}
@end
