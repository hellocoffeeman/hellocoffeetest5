//
//  ToPayayViewController.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/29.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"
//测试商品信息封装在Product中,外部商户可以根据自己商品实际情况定义
//
@interface Product : NSObject{
@private
    float     _price;
    NSString *_subject;
    NSString *_body;
    NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *orderId;

@end


@interface ToPayayViewController : BaseViewController

@end
