//
//  PublishArticleCollectionViewCell.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/21.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "PublishArticleCollectionViewCell.h"

@implementation PublishArticleCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    [self srcennW:s_width];
}

-(void)srcennW:(CGFloat)width
{
  if(width==320.0)
 {
     _secondLab.font=[UIFont systemFontOfSize:15];
     _thirdLab.font=[UIFont systemFontOfSize:12];
 }
}

@end
