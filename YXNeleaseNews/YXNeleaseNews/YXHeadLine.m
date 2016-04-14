//
//  YXHeadLine.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXHeadLine.h"
#import "YXNetworking.h"
@implementation YXHeadLine

+(instancetype)headLineWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
+ (void)loadHeadLineWithSuccess:(void (^)(NSArray *))success WithFailed:(void (^)(NSError *))failed
{
    //断言
    NSAssert(success != nil, @"必须传人成功回调");
    [[YXNetworking sharedNetworking]GET:@"headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        //获得字典的第一个key
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
         // 根据key获得数组
        NSArray *arr = responseObject[rootKey];
        // 创建模型数组
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        // 遍历数组
        [arr enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
            // 字典转模型
            [arrM addObject:[YXHeadLine headLineWithDict:dict]];
        }];
        // 将结果传递给调用方法
        success(arrM.copy);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}
//因为文件里存在的键值对与属性不符合会报错
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
