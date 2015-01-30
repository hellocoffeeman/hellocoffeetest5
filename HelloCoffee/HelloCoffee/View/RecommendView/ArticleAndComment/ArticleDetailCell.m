//
//  ArticleDetailCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/28.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ArticleDetailCell.h"

@implementation ArticleDetailCell

-(void) setArticleText:(NSString *)articleText paragraphHeight:(CGFloat)paragraphHeight articleImageURL:(NSString *)articleImageURL
{
    [self.articleLabel removeFromSuperview];
    
    self.articleLabel = [[SpacingLabel alloc]init];
    [self addSubview:self.articleLabel];
    
    // 数据
    self.articleLabel.linesSpacing = 6.0;
    [self.articleLabel setText:articleText];
    self.articleImgView.image = [UIImage imageNamed:articleImageURL];
    
    // Frame
    self.articleLabel.frame = CGRectMake(10, 10, s_width-20, paragraphHeight);
    self.articleImgView.frame = CGRectMake(10, 20+paragraphHeight, s_width-20, s_width/kArticleDetailImgRatio);
    
}


- (void)awakeFromNib {
    // Initialization code
}

@end
