//
//  FristLabSwitchCell.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/30.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "FristLabSwitchCell.h"

@implementation FristLabSwitchCell

- (void)awakeFromNib {
    // Initialization code
    
    [self isPhoneX];
    _backView.backgroundColor=[UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
}

-(void)isPhoneX
{
  if(s_width==375)
  {
  _backLab.font=[UIFont systemFontOfSize:17];
  }else if(s_width==320)
  {
      _backLab.font=[UIFont systemFontOfSize:16];
  }
    else
    {
      _backLab.font=[UIFont systemFontOfSize:20];
    }
      
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
