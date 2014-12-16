//
//  TableViewCell.h
//  HelloCoffee
//
//  Created by Jason on 14/12/2.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headimageView;
@property (weak, nonatomic) IBOutlet UIImageView *touxiangImg;
@property (weak, nonatomic) IBOutlet UILabel *zanCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *chakanCountLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *zuo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *you;
@property (weak, nonatomic) IBOutlet UIImageView *fengexian2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;




-(void)actionForIconImg:(UIImageView *)iconImg andContentView:(UIViewController *)vc;
-(void)reloadData;
@end
