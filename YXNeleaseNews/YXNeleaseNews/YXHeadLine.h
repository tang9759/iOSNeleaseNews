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

+ (instancetype)headLineWithDict:(NSDictionary *)dict;
@end
