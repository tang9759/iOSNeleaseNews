//
//  YXHeadLine.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXHeadLine.h"

@implementation YXHeadLine

+(instancetype)headLineWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

//因为文件里存在的键值对与属性不符合会报错
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
