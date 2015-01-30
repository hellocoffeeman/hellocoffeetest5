//
//  ThirdShopInfoCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferServicesScrollView.h"
#import "PortraitImageButton.h"
#import "FollowView.h"
#import "SpacingLabel.h"

@interface ThirdShopInfoCell : UITableViewCell

/*  ——————————————————————————  */

// 头像 Btn
@property (weak, nonatomic) IBOutlet PortraitImageButton *portraitImgBtn;
@property (weak, nonatomic) IBOutlet UILabel *identityLabel;

// 店主说 Label
@property (weak, nonatomic) IBOutlet UIImageView *arrowImgView;
@property (weak, nonatomic) IBOutlet UIView *wordBackView;
@property (weak, nonatomic) IBOutlet SpacingLabel *wordlabel;

/*  ——————————————————————————  */

// 提供服务 ScrollView
@property (weak, nonatomic) IBOutlet OfferServicesScrollView *offerServiceScrollView;
// 营业时间 ImgV + Label
@property (weak, nonatomic) IBOutlet UIImageView *openingHoursImgV;
@property (weak, nonatomic) IBOutlet UILabel *openingHoursLabel;
// 联系电话 ImgV + Label
@property (weak, nonatomic) IBOutlet UIImageView *contactWayImgV;
@property (weak, nonatomic) IBOutlet UILabel *contactWayLabel;
// 平均消费 ImgV + Label
@property (weak, nonatomic) IBOutlet UIImageView *consumptionImgV;
@property (weak, nonatomic) IBOutlet UILabel *consumptionLabel;

/*  ——————————————————————————  */

// 分割线

@property (weak, nonatomic) IBOutlet UIView *segmentLine1;
@property (weak, nonatomic) IBOutlet UIView *segmentLine2;
@property (weak, nonatomic) IBOutlet UIView *segmentLine3;
@property (weak, nonatomic) IBOutlet UIView *segmentLine4;
@property (weak, nonatomic) IBOutlet UIView *segmentLine5;
@property (weak, nonatomic) IBOutlet UIView *segmentLine6;

/*  ——————————————————————————  */
// 署名 + 身份 Labels
//@property (weak, nonatomic) IBOutlet FollowView *by_nickNameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *byLabel;
//@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;



// Cell 方法
-(void) setInformationWithSomething; // 传入需要的参数

-(void)addTarget:(id)target withPortraitTouchAction:(SEL)headPortraitIVAction telLabelAction:(SEL)telLabelAction;




@end
