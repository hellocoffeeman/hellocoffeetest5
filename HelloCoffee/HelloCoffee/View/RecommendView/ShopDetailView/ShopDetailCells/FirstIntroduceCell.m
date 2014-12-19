//
//  FirstIntroduceCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "FirstIntroduceCell.h"

@implementation FirstIntroduceCell

#pragma mark - 内容 -
-(void)setInformationWithSomething
{
    
    // 编辑介绍 Label 自适应高度
    CGSize introduceLabelSize= [self getNewSizeOfRectWithText:self.introduceLabel.text limitSize:CGSizeMake(s_width-88, 170) fontSize:17.0];
    self.introduceLabel.frame = CGRectMake(self.introduceLabel.frame.origin.x, self.introduceLabel.frame.origin.y, introduceLabelSize.width, introduceLabelSize.height);
    
    
}

-(void) setPortraitImage:(UIImage *)PortraitImage title:(NSString *)title introduce:(NSString *)introduce nickName:(NSString *)nickName honorString:(NSString *)honorString
{
    [self updateSubviewsFrame]; // 布局
    
    
    
}

#pragma mark - 点击 [ 头像、文章 ] -
-(void)addTarget:(id)target withHeadPortraitIVAction:(SEL)headPortraitIVAction introduceLabelAction:(SEL)introduceLabelAction praiseButtonAction:(SEL)praiseButtonAction
{
    // 点击头像
    self.headPortraitImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *headPortraitIVTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:headPortraitIVAction];
    
    [self.headPortraitImageView addGestureRecognizer:headPortraitIVTap];
    

//    
//    UITapGestureRecognizer *praiseButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:praiseButtonAction];
//    [self.praiseButton addGestureRecognizer:praiseButtonTap];
    
    // 点击 文章
    self.introduceLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *introduceLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:introduceLabelAction];
    [self.introduceLabel addGestureRecognizer:introduceLabelTap];
    
}

#pragma mark - 布局 -
-(void)updateSubviewsFrame
{
    // Cell 宽:  高:
    
    
    // ImageView
    // (1)切圆角
    [self cutImageViewWithImageView:self.headPortraitImageView cornerRadius:self.headPortraitImageView.bounds.size.width/2];
    [self cutImageViewWithImageView:self.backImageView cornerRadius:2.0];
    
    
    
    // Lable
    // 文字行间距
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 6.5;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:paragraphStyle};
    self.introduceLabel.attributedText = [[NSAttributedString alloc]initWithString:self.introduceLabel.text attributes:attributes];
    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.introduceLabel.text];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.introduceLabel.text length])];
//    self.introduceLabel.attributedText = attributedString;
    
    
}

#pragma mark - 圆角 -
-(void) cutImageViewWithImageView:(UIImageView *)imageView cornerRadius:(CGFloat)cornerRadius
{
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
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
