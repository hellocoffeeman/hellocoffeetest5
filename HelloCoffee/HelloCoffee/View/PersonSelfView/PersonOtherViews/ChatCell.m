//
//  ChatCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/30.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeView];
    }
    return self;
}

- (void)makeView{
    
    self.leftHeadImg = [[UIImageView alloc]initWithFrame:CGRectMake(13, 13, 50, 50)];
    [self.contentView addSubview:self.leftHeadImg];
    
    self.rightHeadImg = [[UIImageView alloc]initWithFrame:CGRectMake(s_width-13-50, 13, 50, 50)];
    [self.contentView addSubview:self.rightHeadImg];
    
    
    UIImage* leftImage = [[UIImage imageNamed:@"duifangqipao"] stretchableImageWithLeftCapWidth:30 topCapHeight:35];
    UIImage* rightImage = [[UIImage imageNamed:@"zijiqipao"] stretchableImageWithLeftCapWidth:30 topCapHeight:35];
    
    //左边气泡
    self.leftBubble = [[UIImageView alloc] initWithFrame:CGRectMake(70, 128, 66, 54)];
    self.leftBubble.image = leftImage;
    [self.contentView addSubview:self.leftBubble];
    
    //右边气泡
    self.rightBubble = [[UIImageView alloc] initWithFrame:CGRectMake(s_width - 66 - 10, 128, 66, 54)];
    self.rightBubble.image = rightImage;
    [self.contentView addSubview:self.rightBubble];
    
    //左边label
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 10, 10)];
    self.leftLabel.font = [UIFont systemFontOfSize:20.0];
    self.leftLabel.numberOfLines = 0;
    [self.leftBubble addSubview:self.leftLabel];
    
    //右边label
    self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 10, 10)];
    self.rightLabel.font = [UIFont systemFontOfSize:20.0];
    self.rightLabel.numberOfLines = 0;
    [self.rightBubble addSubview:self.rightLabel];
}

@end
