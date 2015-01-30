//
//  SeachFriendCollectionViewCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/25.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeachFriendCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backImgView;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIButton *funcButton;

@property(nonatomic,assign) NSInteger row;

-(void)setPortraitImgURL:(NSString *)portraitImgURL titleString:(NSString *)titleString infoString:(NSString *)infoString Target:(id)target action:(SEL)action;


@end
