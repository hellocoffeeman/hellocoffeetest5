//
//  mianModel.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/6.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "mianModel.h"

@implementation mianModel
-(id)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //    NSLog(@"%@",key);
}
@end
