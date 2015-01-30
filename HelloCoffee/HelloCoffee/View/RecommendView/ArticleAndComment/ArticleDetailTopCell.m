//
//  ArticleDetailTopCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/28.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ArticleDetailTopCell.h"

#define kTopImageHeight (s_width/2.37)
#define kPortraitWidth (s_width/6.5)
#define kBlackViewHeight (s_width/7.5)

@implementation ArticleDetailTopCell

-(void) setArticleImageURL:(NSString *)articleImageURL portrailImageURL:(NSString *)portrailImageURL articleTitle:(NSString *)articleTitle by_nickNameString:(NSString *)by_nickNameString
{
    [self setSubViewsFrames];
    
    [self.portraitButton setPortraitImage:[UIImage imageNamed:portrailImageURL] borderWidth:2.5 hadIdentityImgV:NO identityType:0 identityImageSize:CGSizeZero target:nil clickAction:nil];
    
    self.topImageView.image = [UIImage imageNamed:articleImageURL];
    self.articleTitleLabel.text = articleTitle;
    self.by_nickNameLabel.text = by_nickNameString;
    
}
#pragma mark - SubViews Frame -
-(void)setSubViewsFrames
{
    [self sendSubviewToBack:self.blackView];
    [self sendSubviewToBack:self.topImageView];
    
    self.topImageView.frame = CGRectMake(0, 0, s_width, kTopImageHeight);
    self.blackView.frame = CGRectMake(0, kTopImageHeight-kBlackViewHeight, s_width, kBlackViewHeight);
    
    self.portraitButton.frame = CGRectMake(15, (kTopImageHeight)-kPortraitWidth/2, kPortraitWidth, kPortraitWidth);
    self.articleTitleLabel.frame = CGRectMake(self.portraitButton.frame.origin.x + kPortraitWidth + 10, self.portraitButton.frame.origin.y + 5, s_width-self.portraitButton.frame.origin.x - kPortraitWidth - 30, 15);
    self.by_nickNameLabel.frame = CGRectMake(self.articleTitleLabel.frame.origin.x, self.portraitButton.frame.origin.y+kPortraitWidth-20, self.articleTitleLabel.frame.size.width, 15);
    
}

- (void)awakeFromNib {
    // Initialization code
}


@end
