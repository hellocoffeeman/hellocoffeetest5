//
//  mianPageCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/6.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mianPageCell : UITableViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *shopAdress;
@property (weak, nonatomic) IBOutlet UIImageView *adressPic;
@property (weak, nonatomic) IBOutlet UIButton *clickPrise;
@property (weak, nonatomic) IBOutlet UIImageView *priseNum;
@property (weak, nonatomic) IBOutlet UILabel *priseNumLabel;


@property (weak, nonatomic) IBOutlet UILabel *dianzan;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScroll;
@property (weak, nonatomic) IBOutlet UIImageView *pricePic;

@end
