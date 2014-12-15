//
//  CoffeeInfoCollectionViewCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeInfoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView; // coffee 图片
@property (weak, nonatomic) IBOutlet UILabel *coffeeNameLabel; // coffee 名字
@property (weak, nonatomic) IBOutlet UILabel *coffeeInfoLabel; // coffee 介绍
@property (weak, nonatomic) IBOutlet UILabel *coffeePriceLabel; // coffee 价格
@property (weak, nonatomic) IBOutlet UILabel *orderCountLabel; // 选择 杯数


@property (weak, nonatomic) IBOutlet UIImageView *chooseCountImageView;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton; // “ — ”
@property (weak, nonatomic) IBOutlet UIButton *addButton; // “ + ”


// Cell 方法
@property (nonatomic, strong) NSIndexPath *indexPath;

-(void) setInformationWithCoffeeName:(NSString *)coffeeName coffeePrice:(NSString *)coffeePrice orderCount:(NSString *)orderCount coffeeInfo:(NSString *)coffeeInfo; // 传入需要的参数

-(void)addTarget:(id)target withAddButtonAction:(SEL)addButtonAction subtractButtonAction:(SEL)subtractButtonAction;



@end
