//
//  DianZanViewController.h
//  Dianzan
//
//  Created by HelloCoffee on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ViewController.h"
//@class BaseMapViewController;
@interface DianZanViewController :UIViewController


@property(nonatomic,assign)BOOL isDianZan;
@property(nonatomic,strong)UIButton *sendBtn;
@property(nonatomic,strong)UIButton *revBtn;
@property(nonatomic,strong)UIView *view3;
@property(nonatomic,strong)UICollectionView *coll;

@property(nonatomic,strong)NSMutableArray *zhuArr;
@property(nonatomic,strong)NSMutableArray *fuheadArr;

@property(nonatomic,strong)NSMutableArray *fuDetailArr;

@property(nonatomic,strong)UICollectionView *coll2;

-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr;
@end
