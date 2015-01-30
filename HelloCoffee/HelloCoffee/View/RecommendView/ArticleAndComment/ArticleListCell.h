//
//  ArticleListCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/14.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowView.h"
#import "PortraitImageButton.h"

@interface ArticleListCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet PortraitImageButton *portraitButton;
@property (weak, nonatomic) IBOutlet UILabel *articleTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *by_nickNameLabel;

-(void)setArticleImageURL:(NSString *)articleImageURL articleTitle:(NSString *)articleTitle portraitImageUrl:(NSString *)portraitImageUrl nickName:(NSString *)nickName;


@end
