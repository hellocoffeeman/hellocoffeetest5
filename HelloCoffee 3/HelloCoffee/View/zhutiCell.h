//
//  zhutiCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zhutiCell : UITableViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *zhutiText;

@property (weak, nonatomic) IBOutlet UIScrollView *zhutiScroll;

@end
