//
//  YXLoopView.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXLoopView.h"
#import "YXLoopViewFlowLayout.h"
#import "YXLoopViewCell.h"

@interface YXLoopView ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**
 *  图片数组
 */
@property(nonatomic,strong)NSArray * URLs;
/**
 *  新闻标题数组
 */
@property (nonatomic, strong) NSArray *titles;
/**
 *  选中的回调
 */
@property(nonatomic,copy)void(^didSelected)(NSInteger index);
@property(nonatomic,strong)UICollectionView * collectionView;

@property(nonatomic,strong)UILabel * titleLable;

@property(nonatomic,strong)UIPageControl * pageControl;
@end
@implementation YXLoopView
/**
 *  根据URLs和titles初始化轮播器
 */
- (instancetype)initWithURLs:(NSArray<NSString *> *)URL titles:(NSArray<NSString *> *)titles didSelected:(void(^)(NSInteger index))selected
{
    if (self = [super init]) {
        // 记录属性
        self.URLs = URL;
        self.titles = titles;
        self.didSelected = selected;
        
        // 设置总页数
        self.pageControl.numberOfPages = self.URLs.count;
         // 设置标题
        self.titleLable.text = self.titles[0];
        
    }
    return self;
}
/**
 *  当对象从文件(xib.sb以及任何文件)中创建的时候调用
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}
/**
 *  当创建控件时,调用init方法初始化,其内部会调用initWithFrame
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

/**
 *  初始化子控件
 */
- (void)setup
{
    /**
     UICollectionView
     */
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[YXLoopViewFlowLayout alloc]init]];
    
    collectionView.delegate = self;
    // 设置分页效果
    collectionView.pagingEnabled = YES;
     // 隐藏水平滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    // 设置背景颜色
    collectionView.backgroundColor = [UIColor whiteColor];
    // 注册cell
    // 通过代码注册
    [collectionView registerClass:[YXLoopView class] forCellWithReuseIdentifier:@"loopCell"];
    
    // 设置数据源
    collectionView.dataSource = self;
    
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
    /**
     *  UILabel
     */
    UILabel *titleLable = [[UILabel alloc]init];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:16];
    [self addSubview:titleLable];
    
    self.titleLable = titleLable;
    
    
    /**
     *  UIPageControl
     */
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    // 设置当前显示页的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
     // 只有一页时隐藏
    pageControl.hidesForSinglePage = YES;
    [self addSubview:pageControl];
    
    self.pageControl = pageControl;
    
    
}
#pragma mark - 布局子控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
}
#pragma mark  - UICollectionViewDataSource 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.URLs.count == 1 ? self.URLs.count : self.URLs.count * 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXLoopViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"loopCell" forIndexPath:indexPath];
    // 传递url
    cell.url = [NSURL URLWithString:self.URLs[indexPath.item % self.URLs.count]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     // 获得索引
    NSInteger index = indexPath.item % self.URLs.count;
    if (self.didSelected) {
        self.didSelected(index);
    }
}
#pragma mark - UIScrollView 代理方法

@end
