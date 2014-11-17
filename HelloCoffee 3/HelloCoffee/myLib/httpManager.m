//
//  httpManager.m
//  瞭望
//
//  Created by qianfeng on 14-9-16.
//  Copyright (c) 2014年 squall. All rights reserved.
//

#import "httpManager.h"

@implementation httpManager

+(void)requestWithUrl:(NSString *)url FinishBlock:(FinishBlock)finishBlock FailedBlock:(FailedBlock)failedBlock
{
    httpreq *req = [[httpreq alloc]init];
    req.url = url;
    req.finishBlock = finishBlock;
    req.failedBlock = failedBlock;
    [req stratRequest];
//    [req autorelease];
}
+(void)postRequestWithUrl:(NSString *)url postStr:(NSString*)postBody FinishBlock:(FinishBlock)finishBlock FailedBlock:(FailedBlock)failedBlock
{
    httpreq *req = [[httpreq alloc]init];
    
    req.url = url;
    
    NSData *secData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSMutableURLRequest *postReq = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:req.url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:5];
    
    [postReq setHTTPBody:secData];
    [postReq setHTTPMethod:@"POST"];
    
    
    
    req.finishBlock = finishBlock;
    req.failedBlock = failedBlock;
    [req startPostRequest:postReq];
//    [req autorelease];
}
@end
