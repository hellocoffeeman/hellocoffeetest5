//
//  PingDetailTableViewCell.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/15.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PingDetailTableViewCell : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *TouXiang;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *nameBiao;
@property (weak, nonatomic) IBOutlet UILabel *qianTime;
@property (weak, nonatomic) IBOutlet UIImageView *pingBack;

@property(nonatomic,assign)NSInteger pingShu;

@property(nonatomic,strong)NSArray*pingDui;

@property(nonatomic,strong)UILabel *qianLab;
@property(nonatomic,assign)CGFloat backHeight;

@property(nonatomic,assign)CGFloat cellHeight;

@property(nonatomic,assign)NSInteger hao;
@property(strong,nonatomic)id tagert;
@property(nonatomic,assign)SEL sel;

//@property(nonatomic,strong) UILabel *PingLab;
@property (weak, nonatomic) IBOutlet UILabel *PingLab;
@property (weak, nonatomic) IBOutlet UIImageView *SanPing;

@property(nonatomic,strong)NSMutableArray *pingArr;
@property(nonatomic,strong)NSMutableAttributedString *attStr;
@property(nonatomic,strong)NSMutableString *mutStr;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLine;
@property (weak, nonatomic) IBOutlet UILabel *pingCount;

@property (weak, nonatomic) IBOutlet UIButton *sendPingDown;

@property (weak, nonatomic) IBOutlet UIButton *suofangBtn;

- (IBAction)pingDown:(id)sender;
-(void)shanxin:(NSArray *)pingArr AndsubArr:(NSArray *)arr;
- (IBAction)sendDown:(id)sender;


@property(nonatomic,strong)UILabel *lab;
@end
