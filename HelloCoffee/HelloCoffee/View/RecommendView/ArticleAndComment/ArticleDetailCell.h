//
//  ArticleDetailCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/28.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpacingLabel.h"

@interface ArticleDetailCell : UICollectionViewCell

@property (strong, nonatomic) SpacingLabel *articleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *articleImgView;

-(void) setArticleText:(NSString *)articleText paragraphHeight:(CGFloat)paragraphHeight articleImageURL:(NSString *)articleImageURL;

@end
