//
//  CoffeeInfoCollectionViewCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "CoffeeInfoCollectionViewCell.h"

@implementation CoffeeInfoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

// Cell 初始化
-(void) setInformationWithCoffeeName:(NSString *)coffeeName coffeePrice:(NSString *)coffeePrice orderCount:(NSString *)orderCount coffeeInfo:(NSString *)coffeeInfo
{
    self.coffeeNameLabel.text = coffeeName;
    self.coffeePriceLabel.text = coffeePrice;
    self.orderCountLabel.text = orderCount;
    self.coffeeInfoLabel.text = coffeeInfo;
    
    [self layoutSubviewsFrame];
}

-(void)addTarget:(id)target withAddButtonAction:(SEL)addButtonAction subtractButtonAction:(SEL)subtractButtonAction{
    
    [self.addButton addTarget:target action:addButtonAction forControlEvents:UIControlEventTouchUpInside];
    [self.subtractButton addTarget:target action:subtractButtonAction forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 布局 -
-(void)layoutSubviewsFrame
{
    // 记录Cell的宽高
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    
    self.photoImageView.frame = CGRectMake(0, 0, s_width, 210);
    self.coffeeNameLabel.frame = CGRectMake(40, 210 + 5, s_width - 80, 30); // 5 是Name与图片的间距
    
    // 计算 InfoLabel的高度
    CGFloat infoLabelHeight =  [self getCoffeeInfoLabelHeightWithText:self.coffeeInfoLabel.text];
    self.coffeeInfoLabel.frame = CGRectMake(15, 210 + 35, width - 30, infoLabelHeight );
    
    self.coffeePriceLabel.frame = CGRectMake(50, height - 40, 60, 30);
    self.chooseCountImageView.frame = CGRectMake(width - 98 - 50, height - 40, 98, 30); // 与下方间距 10
    
    // 根据选择数量背景图的Center 设置 加、减按钮、数量Label的中心
    self.orderCountLabel.center = self.chooseCountImageView.center;
    self.subtractButton.center = CGPointMake(self.chooseCountImageView.center.x - 34, self.chooseCountImageView.center.y);
    self.addButton.center = CGPointMake(self.chooseCountImageView.center.x + 34, self.chooseCountImageView.center.y);
    
}

#pragma mark - 计算高度 -
-(CGFloat)getCoffeeInfoLabelHeightWithText:(NSString *)text
{
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]}; // 文字 字体
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.frame.size.width - 30, 30000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil];
    return rect.size.height + 15; // Label 比文字高出 20
}


@end
