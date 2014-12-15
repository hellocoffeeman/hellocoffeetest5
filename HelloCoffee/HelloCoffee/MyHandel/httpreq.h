//
//  httpreq.h
//  瞭望
//
//  Created by qianfeng on 14-9-15.
//  Copyright (c) 2014年 squall. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^FinishBlock)(NSData*data);
typedef void(^FailedBlock)();
@interface httpreq : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableData *_mdata;
}
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)FinishBlock finishBlock;
@property(nonatomic,copy)FailedBlock failedBlock;


-(void)stratRequest;
-(void)startPostRequest:(NSMutableURLRequest*)postStr;
@end
