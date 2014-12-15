//
//  httpreq.m
//  瞭望
//
//  Created by qianfeng on 14-9-15.
//  Copyright (c) 2014年 squall. All rights reserved.
//

#import "httpreq.h"
//#import "baseViewController.h"
@implementation httpreq
-(void)dealloc
{
//    [_mdata release];
//    self.url = nil;
//    self.finishBlock = nil;
//    self.failedBlock = nil;
//    [super dealloc];
}
-(void)stratRequest
{
    _mdata = [[NSMutableData alloc]init];
    NSURL *urlStr = [NSURL URLWithString:self.url ];
//    NSLog(@"%@",self.url);
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:urlStr] delegate:self];
//    [_mdata release];
}

-(void)startPostRequest:(NSMutableURLRequest*)postStr
{
    _mdata = [[NSMutableData alloc]init];
//    NSURL *urlStr = [NSURL URLWithString:postReq ];
    //    NSLog(@"%@",self.url);
    [NSURLConnection connectionWithRequest:postStr delegate:self];
    
    
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
   self.failedBlock();
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mdata appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    baseViewController *base = [[baseViewController alloc]init];
//    [base stopLoad];
    self.finishBlock(_mdata);
    
}

@end
