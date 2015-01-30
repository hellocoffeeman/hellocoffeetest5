//
//  EndInterestedCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "EndInterestedCell.h"

@interface EndInterestedCell ()

@property (nonatomic, strong) NSArray *portraitImagesArray; // 图片 Array
@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL portraitAction; // 点击方法

@end

@implementation EndInterestedCell
{
    NSInteger _count;
    
    CGFloat _imgInterspace;
    CGFloat _portraitWidth;
}

-(void) initBasicData
{
    _count = self.portraitImagesArray.count;
    _portraitWidth = s_width/6.5;
    _imgInterspace = (s_width - 40 - _portraitWidth*5)/4;
}

-(void) setSubviews
{
    [self initBasicData];
    
    // Scroll View
    self.portraitScrollView.frame = CGRectMake(20, 8, s_width-40, _portraitWidth);
//    self.portraitScrollView.backgroundColor = kBackColor;
    self.portraitScrollView.pagingEnabled = YES;
//    self.portraitScrollView.bounces = NO;
    self.portraitScrollView.contentSize = CGSizeMake((_portraitWidth*_count + _imgInterspace*(_count-1)), self.portraitScrollView.bounds.size.height);
    
    // Image Button
    for (int i = 0; i < self.portraitImagesArray.count; i++) {
        
        // Tag: 2000-2009
        PortraitImageButton *portraitImgBtn = [[PortraitImageButton alloc] init];
        portraitImgBtn.tag = 2000 + i;
        portraitImgBtn.frame = CGRectMake(_portraitWidth*i+_imgInterspace*i, 0, _portraitWidth, _portraitWidth);
//        portraitImgBtn.center = CGPointMake(_portraitWidth*(i+0.5)+_imgInterspace*i, self.portraitScrollView.bounds.size.height/2);
        
        [portraitImgBtn setPortraitImage:self.portraitImagesArray[i] borderWidth:0 hadIdentityImgV:NO identityType:From_Customer identityImageSize:CGSizeMake(0, 0) target:self.target clickAction:self.portraitAction];
        
        [self.portraitScrollView addSubview:portraitImgBtn];
        
    }
}

-(void) setInformationWithPortraitImagesArray:(NSArray *)imagesArray addTarget:(id)target withPortraitTouchAction:(SEL)portraitAction
{
    if (imagesArray.count == 0) {
        return;
    }
    self.portraitImagesArray = imagesArray;
    self.target = target;
    self.portraitAction = portraitAction;
    
    [self setSubviews];
}





- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
