//
//  HCardView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/22.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>


#define HXUIColorWithHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1]

@class HCardView;

@protocol HCardViewDelegate <NSObject>

/**
 用户滑动以后的代理
 */
- (void)cardSwitchViewDidScroll:(HCardView *)cardSwitchView index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HCardView : UIView<UIScrollViewDelegate>

@property (nonatomic,weak) id<HCardViewDelegate> delegate;
@property (nonatomic,strong) UIScrollView *cardSwitchScrollView;
@property (nonatomic,assign) float currentIndex;

@property (nonatomic,assign) BOOL  pagingEnabled;

/**
 添加滑动的pageview

 @param cardSwitchViewAry pageviews
 @param delegate deli
 */
- (void)setCardSwitchViewAry:(NSArray *)cardSwitchViewAry delegate:(id)delegate;

-(void)updateSlidePosition:(int)index;

@end

NS_ASSUME_NONNULL_END
