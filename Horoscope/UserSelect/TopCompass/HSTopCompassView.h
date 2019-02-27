//
//  HSTopCompassView.h
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/20.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CompassDelegate <NSObject>

/**
当前选中的
 @param compassItem
 */
 @optional - (void)changeCompassItem:(NSInteger )compassItem;
/**
 当前选中的indexpath
 @param compassItem
 */
@optional -(void)changeCompassIndexpath:(NSIndexPath *) indexpath;
@end

@interface HSTopCompassView : UIView
/// 保存所有星座图片名称
@property (nonatomic, strong) NSArray *compassImageNameData;
/// 代理
@property (nonatomic,weak) id<CompassDelegate> delegate;
///星座循环背景图片
@property (strong, nonatomic) UIImageView *compassBGImgView;

/**
 动态更新当前选中的
 @param indexpath 选中的位置
 */
-(void)compassUpdateCurrentlySelectedWithIndexpath:(NSIndexPath *)indexpath;


@end
