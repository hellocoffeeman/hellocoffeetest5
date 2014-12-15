//
//  FirstIntroduceCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "FirstIntroduceCell.h"

@implementation FirstIntroduceCell

// Cell上的内容
-(void)setInformationWithSomething
{
    // 初始化 自定义Button
    [self.checkButton setText:@"3794" andTypy:CheckButton];
    [self.praiseButton setText:@"7690" andTypy:PraiseButton];
    
    // 编辑介绍 Label 自适应高度
    CGSize introduceLabelSize= [self getNewSizeOfRectWithText:self.introduceLabel.text limitSize:CGSizeMake(s_width-88, 170) fontSize:17.0];
    self.introduceLabel.frame = CGRectMake(self.introduceLabel.frame.origin.x, self.introduceLabel.frame.origin.y, introduceLabelSize.width, introduceLabelSize.height);
    
    
}

// Cell上的点击 [ 头像、点赞、文章 ]
-(void)addTarget:(id)target withHeadPortraitIVAction:(SEL)headPortraitIVAction introduceLabelAction:(SEL)introduceLabelAction praiseButtonAction:(SEL)praiseButtonAction
{
    // 点击头像
    self.headPortraitImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *headPortraitIVTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:headPortraitIVAction];
    
    [self.headPortraitImageView addGestureRecognizer:headPortraitIVTap];
    
    // 点击 赞
    [self.praiseButton addTarget:target action:praiseButtonAction forControlEvents:UIControlEventTouchUpInside];
//    
//    UITapGestureRecognizer *praiseButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:praiseButtonAction];
//    [self.praiseButton addGestureRecognizer:praiseButtonTap];
    
    // 点击 文章
    self.introduceLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *introduceLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:introduceLabelAction];
    [self.introduceLabel addGestureRecognizer:introduceLabelTap];
    
}

#pragma mark - 计算高度 -
-(CGSize)getNewSizeOfRectWithText:(NSString *)text limitSize:(CGSize)limitSize fontSize:(CGFloat)fontSize
{
    /* 文段、限制Size、字号 */
    
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGRect rect = [text boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil];
    
    return rect.size;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
