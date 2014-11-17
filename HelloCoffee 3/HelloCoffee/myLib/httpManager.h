//
//  httpManager.h
//  瞭望
//
//  Created by qianfeng on 14-9-16.
//  Copyright (c) 2014年 squall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "httpreq.h"
@interface httpManager : NSObject
+(void)requestWithUrl:(NSString*)url FinishBlock:(FinishBlock)finishBlock FailedBlock:(FailedBlock)failedBlock;
+(void)postRequestWithUrl:(NSString *)url postStr:(NSString*)postBody FinishBlock:(FinishBlock)finishBlock FailedBlock:(FailedBlock)failedBlock;
@end
