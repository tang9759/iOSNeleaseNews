//
//  YXNetworking.h
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface YXNetworking : AFHTTPSessionManager

+ (instancetype)sharedNetworking;
@end
