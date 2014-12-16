//
//  TableViewCell.m
//  HelloCoffee
//
//  Created by Jason on 14/12/2.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "TableViewCell.h"
#import "personSelf.h"

@implementation TableViewCell
{
    BOOL _isSelected;
    UIViewController * myVC;
    

}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)awakeFromNib {
    // Initialization code
    [self.zanButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
   }

-(void)onClick:(UIButton *)button
{
    NSInteger count = [self.zanCountLabel.text integerValue];
    if (_isSelected == NO) {
        [self.zanButton setBackgroundImage:[UIImage imageNamed:@"dianzan2@2x.png"] forState:UIControlStateNormal];
        [self.zanCountLabel setText:[NSString stringWithFormat:@"%ld",count+1]];
        _isSelected = YES;
    }else{
        [self.zanButton setBackgroundImage:[UIImage imageNamed:@"dianzan@2x.png"] forState:UIControlStateNormal];
        [self.zanCountLabel setText:[NSString stringWithFormat:@"%ld",count-1]];
        _isSelected = NO;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)actionForIconImg:(UIImageView *)iconImg andContentView:(UIViewController *)vc
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [iconImg addGestureRecognizer:tap];
    myVC = vc;
}
-(void)handleTap:(UITapGestureRecognizer *)tap
{
    personSelf *person = [[personSelf alloc]init];
    person.title = @"个人主页";
    [myVC.navigationController pushViewController:person animated:YES];
}
-(void)reloadData
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(action:) name:@"chakan" object:nil];
}
-(void)action:(NSNotification *)nf
{
    self.chakanCountLabel.text = nf.userInfo[@"chakanCount"];
}
@end
