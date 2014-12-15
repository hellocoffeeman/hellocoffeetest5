//
//  CoffeeCountTableViewCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/26.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "CoffeeCountTableViewCell.h"

@implementation CoffeeCountTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

// Cell
-(void)setCoffeeName:(NSString *)coffeeName orderCount:(NSString *)orderCount
{
    self.coffeeNameLabel.text = coffeeName;
    self.coffeeCountLabel.text = orderCount;
    NSLog(@" %@ - %d杯",coffeeName,[orderCount intValue]);
    

}

-(void)setTarget:(id)target addButtonAction:(SEL)addButtonAction subtractButtonAction:(SEL)subtractButtonAction canChange:(BOOL)canChange
{
    [self.addButton addTarget:target action:addButtonAction forControlEvents:UIControlEventTouchUpInside];
    [self.subtractButton addTarget:target action:subtractButtonAction forControlEvents:UIControlEventTouchUpInside];
    
    // 是否隐藏 Button
    self.addButton.hidden = !canChange;
    self.subtractButton.hidden = !canChange;
    self.borderImageView.hidden = !canChange;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
