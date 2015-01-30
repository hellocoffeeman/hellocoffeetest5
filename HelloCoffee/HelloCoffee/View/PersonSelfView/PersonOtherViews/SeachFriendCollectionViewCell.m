//
//  SeachFriendCollectionViewCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/25.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "SeachFriendCollectionViewCell.h"

@implementation SeachFriendCollectionViewCell

-(void)setPortraitImgURL:(NSString *)portraitImgURL titleString:(NSString *)titleString infoString:(NSString *)infoString Target:(id)target action:(SEL)action
{
    self.portraitImgView.image = [UIImage imageNamed:portraitImgURL];
    self.titleLabel.text = titleString;
    self.infoLabel.text = infoString;
    [self.funcButton addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    
}

@end
