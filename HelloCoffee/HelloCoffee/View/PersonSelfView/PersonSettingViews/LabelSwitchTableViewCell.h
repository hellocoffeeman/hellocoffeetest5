//
//  LabelSwitchTableViewCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelSwitchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *funcNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *funcSwitch;
@property (weak, nonatomic) IBOutlet UIView *segmentLine;

-(void)setFuncNameString:(NSString *)funcName switchTag:(NSInteger)tag switchOn:(BOOL)on target:(id)target switchAction:(SEL)switchAction;

@end
