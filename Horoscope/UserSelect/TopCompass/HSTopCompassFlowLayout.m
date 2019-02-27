//
//  HSTopCompassFlowLayout.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/16.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSTopCompassFlowLayout.h"
@interface HSTopCompassFlowLayout ()
/// 保存自己计算的cell的布局
@property (nonatomic, strong) NSMutableArray *customAttrs;
@end

#define KCollectionViewHeight  self.collectionView.bounds.size.height// collectionView的高
#define KCollectionViewWidth  self.collectionView.bounds.size.width// collectionView的宽
#define KImageCount 12 // 每组cell的个数
#define KSectionCount 3 // 有多少组
@implementation HSTopCompassFlowLayout
// 懒加载
- (NSMutableArray *)customAttrs {
    if (_customAttrs == nil) {
        _customAttrs = [NSMutableArray array];
    }
    return _customAttrs;
}

// 布局前的准备
- (void)prepareLayout {
    [super prepareLayout];
    // 设置最小行列间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    if (_customAttrs.count) { // 如果已经计算过了就不执行后面的代码
        return;
    }
    // 计算cell的高
    CGFloat itemH;
    itemH = KCollectionViewHeight * 1;
    //设置宽度为7等分
    self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width /7, itemH);
    // 设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 定义变量用来记录cell的frame
    CGFloat x, y = 0.0, w, h;
    // 高
    h = itemH;
    // 宽 = 屏幕宽度7等分
    w = [UIScreen mainScreen].bounds.size.width /7;
    // 获取cell的个数
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger xx = 0; xx < KSectionCount; xx++) {
        // for循环计算所有cell的frame然后创建每一个cell的布局对象
        for (NSInteger i = 0; i < cellCount; i++) {
            // 创建cell索引
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:xx];
            // 创建每一个cell需要布局对象
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            // x = 组的左边边距 + (cell宽 + 行间距) * 第几个
            x = self.sectionInset.left + (w + self.minimumLineSpacing) * i + xx * (self.sectionInset.left + (w + self.minimumLineSpacing) * KImageCount);
            // 设置cell布局对象的frame
            attr.frame = CGRectMake(x, y, w, h);
            // 把cell的布局对象保存到数组
            [self.customAttrs addObject:attr];
        }
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 计算相对的屏幕中心位置 "collecitonView中内容的最左边到collectionView窗口的一半的这个距离"
    CGFloat screenCenterX = self.collectionView.contentOffset.x + KCollectionViewWidth * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in self.customAttrs) {
        // 获取cell的中心x
        CGFloat cellCenterX = attrs.center.x;
        // 计算cell中心距离屏幕中心的距离
        CGFloat cellCenterXDistanceScreenCenterX = cellCenterX - screenCenterX;
        
        // 定义一个transform
        CATransform3D transform3D = CATransform3DIdentity;
        
        CGFloat scale = -0.0040 * ABS(cellCenterXDistanceScreenCenterX) + 1;
        transform3D = CATransform3DScale(transform3D, scale, scale, 1);
        // 把形变赋值给cell的布局属性
        attrs.transform3D = transform3D;
        // 效果1计算距离顶部的距离,顶端接近持平的效果弃用
        CGFloat height = 65 - attrs.frame.size.height - attrs.frame.origin.y;
        transform3D = CATransform3DTranslate(transform3D, 0, -height, 0);
        attrs.transform3D = transform3D;
        
    }
    return self.customAttrs;
}

#pragma mark - 只要collectionView滚动就让布局失效 重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

// 获取期望滚动到的位置
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    //1. 获取UICollectionView停止的时候的可视范围
    CGRect contentFrame;
    contentFrame.size = self.collectionView.frame.size;
    contentFrame.origin = proposedContentOffset;
    NSArray *array = [self layoutAttributesForElementsInRect:contentFrame];
    //2. 计算在可视范围的距离中心线最近的Item
    CGFloat minCenterX = CGFLOAT_MAX;
    CGFloat collectionViewCenterX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if(ABS(attrs.center.x - collectionViewCenterX) < ABS(minCenterX)){
            minCenterX = attrs.center.x - collectionViewCenterX;
        }
    }
    //3. 补回ContentOffset，则正好将Item居中显示
    return CGPointMake(proposedContentOffset.x + minCenterX, proposedContentOffset.y);
}


@end
