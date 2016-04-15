//
//  YXLoopView.h
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXLoopView : UIView
/**
 *  根据URLs和titles初始化轮播器
 */
- (instancetype)initWithURLs:(NSArray<NSString *> *)URL titles:(NSArray<NSString *> *)titles didSelected:(void(^)(NSInteger index))selected;
@end
