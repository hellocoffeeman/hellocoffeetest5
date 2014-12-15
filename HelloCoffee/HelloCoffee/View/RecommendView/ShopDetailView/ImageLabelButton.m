//
//  ImageLabelButton.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/19.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ImageLabelButton.h"

@implementation ImageLabelButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setText:(NSString *)text andTypy:(Type)type
{
    // 初始化 imageview 和 Label 放置在 Button 上
    UIImageView *imageView = [[UIImageView alloc]init];
    UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 2, 25, 13)];
    countLabel.adjustsFontSizeToFitWidth = YES;
//    countLabel.minimumFontSize = 10;
    countLabel.text = text;
    
    switch (type) {
        case CheckButton:
        {
            imageView.frame = CGRectMake(2, 7, 12, 8);
            imageView.image = [UIImage imageNamed:@"bianji-chakan-tubiao"];

        }
            break;
        case PraiseButton:
        {
            imageView.frame = CGRectMake(-1, 4, 44, 14);
            imageView.image = [UIImage imageNamed:@"bianji-dianzan-tubiao"];

        }
            break;
    }
    
    [self addSubview:imageView];
    [self addSubview:countLabel];
    
}

@end
