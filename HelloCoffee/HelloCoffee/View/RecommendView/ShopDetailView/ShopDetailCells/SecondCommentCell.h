//
//  SecondCommentCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCommentCell : UITableViewCell

@property (nonatomic, assign) int commentCount;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@end
