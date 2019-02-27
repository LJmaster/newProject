//
//  LJProgressView.h
//  NowTest
//
//  Created by heiheihei on 2017/11/18.
//  Copyright © 2017年 heiheihei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJProgressView : UIView


/**
 *  进度条背景颜色  默认是 （230, 244, 245）
 */
@property (nonatomic, strong) UIColor *bgProgressColor;

/**
 *  进度条渐变颜色数组，颜色个数>=2
 *  默认是 @[(id)MQRGBColor(252, 244, 77).CGColor,(id)MQRGBColor(252, 93, 59).CGColor]
 */
@property (nonatomic, strong) NSArray *colorArr;

/**
 *  进度 默认是0.65
 */
@property (nonatomic, assign) CGFloat progress;


@end
