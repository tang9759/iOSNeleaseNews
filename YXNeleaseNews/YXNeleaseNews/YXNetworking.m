//
//  YXNetworking.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXNetworking.h"

@implementation YXNetworking

+ (instancetype)sharedNetworking
{
    static YXNetworking * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         // 注意：baseURL 应该以 / 结尾
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/ad/"];
        instance = [[self alloc]initWithBaseURL:url];
        // 修改响应解析器能够接受的数据类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html", nil];
    });
    return instance;
}
@end
