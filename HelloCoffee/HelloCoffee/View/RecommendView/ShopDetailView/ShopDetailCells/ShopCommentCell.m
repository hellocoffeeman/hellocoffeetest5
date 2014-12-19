//
//  ShopCommentCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ShopCommentCell.h"

@implementation ShopCommentCell


// 参数 - Model
-(void) setInformationWithSomething
{
    // 数据
    
    
    // 布局
//    [self layoutSubviewsFrame];
    
    
    // 文字行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 7.5;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:12], NSParagraphStyleAttributeName:paragraphStyle};
    self.contentLabel.attributedText = [[NSAttributedString alloc]initWithString:self.contentLabel.text attributes:attributes];

}

-(void)layoutSubviewsFrame
{
    // Cell 的宽高
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    NSLog(@"cell_w = %g ; cell_h = %g ",width,height);
    
    // 昵称 View [ h:28 ] [徽章紧跟在文字后]
    self.nickNameView.frame = CGRectMake(30, 8, width-(30*2), 28);
    // 昵称 Label
    CGSize nickNameSize = [self getNewSizeOfRectWithText:self.nickNamelabel.text limitSize:CGSizeMake(width-(30*2)-20, 28) fontSize:17.0];
    self.nickNamelabel.frame = CGRectMake(((width-30*2)/2 - nickNameSize.width/2), 0, nickNameSize.width, nickNameSize.height);
    // 徽章 Img 14*16
    self.badgeImageView.frame = CGRectMake((width-30*2)/2 + nickNameSize.width/2 + 4, 6, 14, 16);
    
    // 评论内容 Label - 差40 ？！因为XIB中Cellwidth = 320
    CGSize contentSize = [self getNewSizeOfRectWithText:self.contentLabel.text limitSize:CGSizeMake(width-40, 52) fontSize:13.0];
    self.contentLabel.frame = CGRectMake(0, 43, width-40, contentSize.height);
    
    // 发表日期 Label
    self.dateLabel.frame = CGRectMake(width-110-40, 43+contentSize.height + 1, 100, 18);
    
    
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
