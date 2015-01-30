//
//  recommend.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface recommend : UIViewController//<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
}
@property (copy,nonatomic) NSString *state;
//@property (strong, nonatomic)  UITableView *table;
@property(strong,nonatomic)UICollectionView *coll;

@property(nonatomic,assign)BOOL isTabbar;

@property(nonatomic,strong)NSString *chuangzhiZhuTi;

//scroll是否存在
@property(nonatomic,assign)BOOL isScroll;

-(void)isTabbarAndNav:(BOOL)isExrit;
@end
