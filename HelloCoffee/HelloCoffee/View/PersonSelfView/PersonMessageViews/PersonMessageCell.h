//
//  PersonMessageCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIButton *NextBtn;

@property (weak, nonatomic) IBOutlet UIImageView *bottomLine;


-(void)setPersonMessageCellImage:(UIImage*)image withTitleLabelText:(NSString*)str withBtnTag:(NSInteger)tagNum addTarget:(id)target action:(SEL)action;
@end
