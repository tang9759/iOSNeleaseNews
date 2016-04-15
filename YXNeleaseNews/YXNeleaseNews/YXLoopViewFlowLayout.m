//
//  YXLoopViewFlowLayout.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXLoopViewFlowLayout.h"

@implementation YXLoopViewFlowLayout
/**
 *  当准备布局时会调用 ,调用该方法时collectionView的frame已经设置好
 */

- (void)prepareLayout
{
    [super prepareLayout];
    self.itemSize = self.collectionView.bounds.size;
    // 设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置间隔
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
}
@end
