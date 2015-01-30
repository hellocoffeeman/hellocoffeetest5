//
//  LabelSwitchTableViewCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "LabelSwitchTableViewCell.h"

@implementation LabelSwitchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFuncNameString:(NSString *)funcName switchTag:(NSInteger)tag switchOn:(BOOL)on target:(id)target switchAction:(SEL)switchAction
{
    self.funcNameLabel.text = funcName;
    
    self.funcSwitch.tag = tag;
    self.funcSwitch.on = on;
    [self.funcSwitch addTarget:target action:switchAction forControlEvents:UIControlEventValueChanged];
}



@end
