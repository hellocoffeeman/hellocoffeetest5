//
//  CoffeeCountTableViewCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/26.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeCountTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *coffeeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
@property (weak, nonatomic) IBOutlet UIImageView *borderImageView;


// Cell

@property (nonatomic, strong) NSIndexPath *indexPath;

-(void)setCoffeeName:(NSString *)coffeeName orderCount:(NSString *)orderCount;

-(void)setTarget:(id)target addButtonAction:(SEL)addButtonAction subtractButtonAction:(SEL)subtractButtonAction canChange:(BOOL)canChange;


@end
