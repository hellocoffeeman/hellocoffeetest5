//
//  MyCollectionViewCell.m
//  shiPei
//
//  Created by HelloCoffee on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
//    self.backgroundColor=[UIColor colorWithRed:245/255.0 green:242/255.0 blue:244/255.0 alpha:1];
//    self.layer.cornerRadius=10.0;
    
    self.fuTouLab.adjustsFontSizeToFitWidth=YES;
    self.dainzan.adjustsFontSizeToFitWidth=YES;
    self.shijian.adjustsFontSizeToFitWidth=YES;
    //self.fuTouLab.minimumFontSize=13.0;
    
    self.headImg.layer.masksToBounds=YES;
    self.headImg.layer.cornerRadius=20;
    self.headImg.layer.borderColor=[UIColor whiteColor].CGColor;
   // self.headImg.layer.borderWidth=2;
//   //self.headImg.contentMode=UIViewContentModeScaleAspectFit;
//    self.headImg.contentMode = UIViewContentModeScaleAspectFill;
    self.dainzan.textColor=[UIColor colorWithRed:0/255.0 green:127/255.0 blue:250/255.0 alpha:1];

    
       
}


- (IBAction)btndown:(id)sender {
    NSLog(@"我被点了");
}
@end
