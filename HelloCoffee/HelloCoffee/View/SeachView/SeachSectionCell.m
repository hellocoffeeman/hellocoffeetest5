//
//  SeachSectionCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/4.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "SeachSectionCell.h"

@implementation SeachSectionCell

-(void)setTargrt:(id)target actions:(SEL)actions
{
    NSArray *colorArray = @[RGB(233,97,95),RGB(255,202,87),RGB(82,193,190),RGB(159,121,193)];
    NSArray *leftImageArray = @[[UIImage imageNamed:@"sousuozhutitubiao.png"],[UIImage imageNamed:@"sousuoshangqutubiao.png"],[UIImage imageNamed:@"sousuoqingjingtubiao.png"],[UIImage imageNamed:@"sousuojiaweitubiao.png"]];
    NSArray *titleArray = @[@"主题",@"商区",@"情景",@"价位"];
    NSArray *describeArray = @[@"淡淡清雅，让人流连忘返",@"地段也能成为咖啡馆的春天",@"如果说咖啡是一种时尚的话",@"生活就该如此简单惬意"];
    
    for (int i = 0; i < 4; i++) {
        
        TopicButton *topicBtn = (TopicButton *)[self viewWithTag:i+2000];
        if (topicBtn != nil) {
            
            [topicBtn setBarkColor:colorArray[i] leftImage:leftImageArray[i] titleString:titleArray[i] describeString:describeArray[i] targrt:target action:actions];

        }
    }

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
