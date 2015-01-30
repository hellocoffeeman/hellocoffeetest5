//
//  SeachSectionCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/4.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicButton.h"

@interface SeachSectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet TopicButton *sectionBtn1;
@property (weak, nonatomic) IBOutlet TopicButton *sectionBtn2;
@property (weak, nonatomic) IBOutlet TopicButton *sectionBtn3;
@property (weak, nonatomic) IBOutlet TopicButton *sectionBtn4;

-(void)setTargrt:(id)target actions:(SEL)actions;


@end
