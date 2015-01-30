//
//  EndInterestedCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortraitImageButton.h"

@interface EndInterestedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *portraitScrollView;

// 头像 ImgBtn 1-10  Tag: 2000-2009
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn1;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn2;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn3;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn4;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn5;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn6;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn7;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn8;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn9;
//@property (weak, nonatomic) PortraitImageButton *portraitImgBtn10;


// Cell 方法 [ 传入参数、方法]
-(void) setInformationWithPortraitImagesArray:(NSArray *)imagesArray addTarget:(id)target withPortraitTouchAction:(SEL)portraitAction;

@end
