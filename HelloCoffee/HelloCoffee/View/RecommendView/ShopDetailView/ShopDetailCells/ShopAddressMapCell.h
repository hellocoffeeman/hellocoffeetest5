//
//  ShopAddressMapCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/19.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopAddressMapCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mapImageView; // 地图
@property (weak, nonatomic) IBOutlet UIImageView *whiteBorderImageView; // 文字白框
@property (weak, nonatomic) IBOutlet UIImageView *pinImageView; // 大头针
@property (weak, nonatomic) IBOutlet UILabel *addressLabel; // 地址 Label



@end
