//
//  ArticleListCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/14.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ArticleListCell.h"

@implementation ArticleListCell

- (void)awakeFromNib {
    // Initialization code
    
    
    
    
}

-(void)setSubviewsFrame
{
    CGFloat portraitWidth = s_width/9.12;
    
    self.backImageView.frame = self.bounds;
    self.articleImageView.frame = CGRectMake(0, 0, s_width-16, (s_width/kArticleListRatio)*0.72);
    self.portraitButton.frame = CGRectMake(8, 8+(s_width/kArticleListRatio)*0.72, portraitWidth, portraitWidth);
    self.articleTitleLabel.frame = CGRectMake(18+portraitWidth, self.portraitButton.center.y-20, s_width-30-portraitWidth, 20);
    self.by_nickNameLabel.frame = CGRectMake(18+portraitWidth, self.portraitButton.center.y+(portraitWidth-35)/2, s_width-30-portraitWidth, 20);
    
    if (iPhone5) {
        
    }else if (iPhone6) {
        
    }else if (iPhone6Plus) {
        
    }else{
        NSLog(@" - 其他设备 - ");
    }
    
}

-(void)setArticleImageURL:(NSString *)articleImageURL articleTitle:(NSString *)articleTitle portraitImageUrl:(NSString *)portraitImageUrl nickName:(NSString *)nickName
{
    [self setSubviewsFrame]; // 布局
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES; // 子视图被裁剪到Cell边界
    
    self.articleImageView.image = [UIImage imageNamed:articleImageURL]; // 文章图
    self.articleTitleLabel.text = articleTitle; // 文章 Title
    [self.portraitButton setPortraitImage:[UIImage imageNamed:portraitImageUrl] borderWidth:0 hadIdentityImgV:NO identityType:From_Designer identityImageSize:CGSizeZero target:nil clickAction:nil]; // 头像 Button
    self.by_nickNameLabel.text = nickName; // by_Nickname
    
}



@end
