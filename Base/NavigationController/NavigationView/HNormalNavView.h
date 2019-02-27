//
//  HNormalNavView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNormalNavView : UIView

@property (nonatomic, strong) UIView   * rightView;
@property (nonatomic, assign) CGFloat    navViewAlpha;
@property (nonatomic, copy)   NSString * title;
@property (nonatomic, copy)   NSString * backStr;
@property (nonatomic, copy)   UIImage  * backImage;
@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UILabel  * smallTitleLabel;




/**
 在滚代理方法里面获取偏移量
 根据变化偏移量设置导航UI效果animation
 
 @param yOffset 变化偏移量
 */
- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
