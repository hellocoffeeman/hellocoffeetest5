//
//  ChatCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/30.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatCell : UITableViewCell
@property (nonatomic, strong) UIImageView* leftBubble;
@property (nonatomic, strong) UIImageView* rightBubble;

@property (nonatomic, strong)UIImageView* rightHeadImg;
@property (nonatomic, strong)UIImageView* leftHeadImg;

@property (nonatomic, strong) UILabel* leftLabel;
@property (nonatomic, strong) UILabel* rightLabel;
@end
