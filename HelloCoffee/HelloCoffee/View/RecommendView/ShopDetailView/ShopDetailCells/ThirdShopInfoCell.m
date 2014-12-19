//
//  ThirdShopInfoCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ThirdShopInfoCell.h"

@implementation ThirdShopInfoCell

-(void)setInformationWithSomething
{
        
    NSArray *iconImageArray = @[[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"],[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"],[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"],[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"],[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"],[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"],[UIImage imageNamed:@"dianpu-tigongdefuwu-tubiao"]];
    [self.offerServiceScrollView setImageArrayWithImageArray:iconImageArray imageSize:CGSizeMake(30, 30) numberOfImageInEachPage:4];
    
}

-(void)addTarget:(id)target withAddressLabelAction:(SEL)addressLabelAction headPortraitImageView:(SEL)headPortraitIVAction
{
    // 点击 地址图标（定位）
//    self.addressLabel.userInteractionEnabled = YES;
    //点击 地图图标
    self.mapImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *addressLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:addressLabelAction];
//    [self.addressLabel addGestureRecognizer:addressLabelTap];   //地址图标
    [self.mapImageView addGestureRecognizer:addressLabelTap];
    
    
    // 点击头像
    self.headPortraitImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *headPortraitIVTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:headPortraitIVAction];
    [self.headPortraitImageView addGestureRecognizer:headPortraitIVTap];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
