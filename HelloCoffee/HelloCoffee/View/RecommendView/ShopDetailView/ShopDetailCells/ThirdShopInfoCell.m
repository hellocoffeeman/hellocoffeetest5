//
//  ThirdShopInfoCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ThirdShopInfoCell.h"

@implementation ThirdShopInfoCell

{
    CGFloat _changeWidth;
    CGFloat _changeHeight;
    CGFloat _changeInterval;
}

-(void) initBasicData
{
    _changeWidth = s_width-320;
    _changeHeight = (s_width-320)/kThirdShopInfoRatio;
    
    _changeInterval = _changeHeight/5.0;
    _changeInterval = _changeInterval > 0 ? _changeInterval : 0;
}

-(void) setSubviewFrame
{
    // Words
    [self view:self.wordBackView changeWidth:_changeWidth];
    self.wordBackView.layer.masksToBounds = YES;
    self.wordBackView.layer.cornerRadius = 18.0;
    [self view:self.wordlabel changeWidth:_changeWidth];
    
    // 计算 Word Height
    CGFloat labelHeight = [self.wordlabel getAttributedStringHeightWidthValue:self.wordlabel.bounds.size.width];
    self.wordlabel.frame = CGRectMake(self.wordlabel.frame.origin.x, self.wordlabel.frame.origin.y, self.wordlabel.bounds.size.width, labelHeight);
    self.wordlabel.center = CGPointMake(self.wordBackView.bounds.size.width/2, self.wordBackView.bounds.size.height/2);

    // 图标 + 内容
    // Offer Service
    [self view:self.offerServiceScrollView changeWidth:s_width-320 changeCenterY:_changeInterval*1.0];
    self.offerServiceScrollView.center = CGPointMake(s_width/2, self.offerServiceScrollView.center.y);
    // Open
    [self view:self.openingHoursImgV changeCenterY:_changeInterval*2];
    [self view:self.openingHoursLabel changeCenterX:_changeWidth/2 changeCenterY:_changeInterval*2];
    self.openingHoursImgV.frame = CGRectMake(self.openingHoursImgV.frame.origin.x, self.openingHoursLabel.center.y - s_width/16/2, s_width/16, s_width/16);
    // Contact Way
    [self view:self.contactWayImgV changeCenterY:_changeInterval*3];
    [self view:self.contactWayLabel changeCenterX:_changeWidth/2 changeCenterY:_changeInterval*3];
    self.contactWayImgV.frame = CGRectMake(self.contactWayImgV.frame.origin.x, self.contactWayLabel.center.y - s_width/16/2, s_width/16, s_width/16);
    // Consumption
    [self view:self.consumptionImgV changeCenterY:_changeInterval*4];
    [self view:self.consumptionLabel changeCenterX:_changeWidth/2 changeCenterY:_changeInterval*4];
    self.consumptionImgV.frame = CGRectMake(self.consumptionImgV.frame.origin.x, self.consumptionLabel.center.y - s_width/16/2, s_width/16, s_width/16);


    // 分割线 1-3
    [self view:self.segmentLine1 changeWidth:_changeWidth changeCenterY:_changeInterval*0.5];
    [self view:self.segmentLine2 changeWidth:_changeWidth changeCenterY:_changeInterval*1.5];
    [self view:self.segmentLine3 changeWidth:_changeWidth changeCenterY:_changeInterval*2.5];
    [self view:self.segmentLine4 changeWidth:_changeWidth changeCenterY:_changeInterval*3.5];
    [self view:self.segmentLine5 changeWidth:_changeWidth changeCenterY:_changeInterval*4.5];
    [self view:self.segmentLine6 changeWidth:_changeWidth changeCenterY:_changeInterval*4.5];

    // 人均消费 文字
     NSMutableAttributedString *LabelStr = [[NSMutableAttributedString alloc] initWithString:self.consumptionLabel.text ];
    [LabelStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2,4)];
    [LabelStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:22.0] range:NSMakeRange(2, 4)];
    self.consumptionLabel.attributedText = LabelStr;
    
}

#pragma mark - 内容 -
-(void)setInformationWithSomething
{
    [self initBasicData];
    [self setSubviewFrame];
    
    // 头像
    [self.portraitImgBtn setPortraitImage:[UIImage imageNamed:@"touxiang60-60-5.png"] borderWidth:0 hadIdentityImgV:NO identityType:From_Designer identityImageSize:CGSizeZero target:nil clickAction:nil];
    
    // 店主说的话
    self.wordlabel.characterSpacing = 0.7f;
    self.wordlabel.linesSpacing = 1.0f;
    
    // 提供服务
    NSArray *iconImageArray = @[[UIImage imageNamed:@"open_pit_icon_off"],[UIImage imageNamed:@"parking_icon_off"],[UIImage imageNamed:@"pet_icon_off"],[UIImage imageNamed:@"wifi_icon_off"],[UIImage imageNamed:@"credit_card_icon_off"]];
    [self.offerServiceScrollView setImageArrayWithImageArray:iconImageArray imageSize:CGSizeMake(s_width/10.67, s_width/10.67) numberOfImageInEachPage:5];
    
}

#pragma mark - 点击 -
-(void)addTarget:(id)target withPortraitTouchAction:(SEL)headPortraitIVAction telLabelAction:(SEL)telLabelAction
{
    // 点击头像
    [self.portraitImgBtn addTarget:target action:headPortraitIVAction forControlEvents:UIControlEventTouchDown];
    
    // 点击电话
    self.contactWayLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *telLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:telLabelAction];
    [self.contactWayLabel addGestureRecognizer:telLabelTap];
}

#pragma mark - 更改 Frame中的 1.Width 2.Center X/Y -
// Width
-(void)view:(UIView *)view changeWidth:(CGFloat)changeWidth
{
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width + changeWidth, view.frame.size.height);
}
// Center X + Center Y
-(void)view:(UIView *)view changeCenterX:(CGFloat)changeX changeCenterY:(CGFloat)changeY
{
    [self view:view changeCenterX:changeX];
    [self view:view changeCenterY:changeY];
}
// Width + Center Y
-(void)view:(UIView *)view changeWidth:(CGFloat)changeWidth changeCenterY:(CGFloat)changeY
{
    [self view:view changeWidth:changeWidth];
    [self view:view changeCenterY:changeY];

}

// Center X
-(void)view:(UIView *)view changeCenterX:(CGFloat)changeX
{
    view.center = CGPointMake(view.center.x + changeX, view.center.y);
}
// Center Y
-(void)view:(UIView *)view changeCenterY:(CGFloat)changeY
{
    view.center = CGPointMake(view.center.x, view.center.y+changeY);
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
