//
//  PersonMessageTwoCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortraitImageButton.h"
@interface PersonMessageTwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;

@property(strong,nonatomic)PortraitImageButton *iconBtn;



@end
