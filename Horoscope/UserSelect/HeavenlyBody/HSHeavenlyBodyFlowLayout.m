//
//  HSHeavenlyBodyFlowLayout.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSHeavenlyBodyFlowLayout.h"

@implementation HSHeavenlyBodyFlowLayout

// 准备布局
- (void)prepareLayout {
    [super prepareLayout];
    // 让cell和collectionView一样大
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    // 设置最小行列间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    // 设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}



@end
