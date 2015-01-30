//
//  ChatModel.h
//  bubbleChatDemo
//
//  Created by pk on 14/9/5.
//  Copyright (c) 2014年 pk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject

@property (nonatomic, strong) NSString* chatStr;
@property (nonatomic, unsafe_unretained) BOOL isSelf;


@end
