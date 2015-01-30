//
//  ArticleDetailTopCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/28.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortraitImageButton.h"

@interface ArticleDetailTopCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet PortraitImageButton *portraitButton;
@property (weak, nonatomic) IBOutlet UILabel *articleTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *by_nickNameLabel;

-(void) setArticleImageURL:(NSString *)articleImageURL portrailImageURL:(NSString *)portrailImageURL articleTitle:(NSString *)articleTitle by_nickNameString:(NSString *)by_nickNameString;

@end
