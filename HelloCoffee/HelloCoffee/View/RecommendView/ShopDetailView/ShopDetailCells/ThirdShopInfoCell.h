//
//  ThirdShopInfoCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferServicesScrollView.h"


@interface ThirdShopInfoCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *mapImageView; // 地图
@property (weak, nonatomic) IBOutlet UILabel *addressLabel; // 地址 Label
@property (weak, nonatomic) IBOutlet UIImageView *headPortraitImageView; // 头像
@property (weak, nonatomic) IBOutlet OfferServicesScrollView *offerServiceScrollView;



// Cell 方法
-(void) setInformationWithSomething; // 传入需要的参数

-(void)addTarget:(id)target withAddressLabelAction:(SEL)addressLabelAction headPortraitImageView:(SEL)headPortraitIVAction;




@end
