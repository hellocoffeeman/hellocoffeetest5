//
//  faBuDianPu.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"

typedef enum {
    Apply_By_Customer = 0, // 用户上传
    Apply_By_Shopkeeper // 商家上传
}ApplyFrom;

@interface PostedCoffeeShopViewController : BaseViewController<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, assign) ApplyFrom applyFrom;

@end
