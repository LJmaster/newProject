//
//  HDynmaicBigNavView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDynmaicBigTitleView.h"
#import "HNormalNavView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDynmaicBigNavView : UIView


@property (nonatomic, strong) HNormalNavView *navView;
@property (nonatomic, strong) HDynmaicBigTitleView *bigTitleView;
/**设置导航返回名称*/
@property (nonatomic, strong) NSString *backButtonTitle;
/**右侧View*/
@property (nonatomic, strong) UIView * titleRightView;
/**小标题*/
@property (nonatomic, copy) NSString * detaileTitle;
/**设置导航标题*/
@property (nonatomic, copy) NSString * bigTitle;
/**是否隐藏返回按钮 ，默认不隐藏 NO*/
@property (nonatomic, assign) BOOL     isBackButtonHide;
/**设置背景颜色*/
@property (nonatomic, strong) UIColor * changebackgroundColor;
/**设置背景图片*/
@property (nonatomic, strong) UIImage * changebackgroundImage;
/**标题颜色*/
@property (nonatomic, strong) UIColor * titleColor;
/**小标题颜色*/
@property (nonatomic, strong) UIColor * detaileTitleColor;

/**
 滑动隐藏头标题（全部隐藏）

 @param yOffset yOffset
 @param view 滑动的view
 */
- (void)dynamic_allNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view;

/**
 滑动隐藏头标题（大标题变为小标题，悬浮）

 @param yOffset yOffset
 @param view 滑动的view
 */
- (void)dynamic_suspensionNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
