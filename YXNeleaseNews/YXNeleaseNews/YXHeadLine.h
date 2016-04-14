//
//  YXHeadLine.h
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXHeadLine : NSObject
/**
 *  头条新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  头条图片
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  加载新闻头条数据
 *
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+ (void)loadHeadLineWithSuccess:(void(^)(NSArray *headLines))success WithFailed:(void(^)(NSError *error))failed;


+ (instancetype)headLineWithDict:(NSDictionary *)dict;
@end
