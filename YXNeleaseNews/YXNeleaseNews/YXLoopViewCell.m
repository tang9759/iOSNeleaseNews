//
//  YXLoopViewCell.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXLoopViewCell.h"
#import <UIImageView+WebCache.h>

@interface YXLoopViewCell ()

@property(nonatomic,strong)UIImageView * imgView;
@end
@implementation YXLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        // 添加子控件
        UIImageView * imgView = [[UIImageView alloc]init];
        [self addSubview:imgView];
        self.imgView = imgView;
    }
    return self;
}
- (void)setUrl:(NSURL *)url
{
    _url = url;
    [self.imgView sd_setImageWithURL:url];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = self.bounds;
}
@end
