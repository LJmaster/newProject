//
//  LJCircleProgressView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJCircleProgressView : UIView

@property(nonatomic,strong)CAShapeLayer * progressLayer;
@property(nonatomic,assign)float progress;
@property(nonatomic,strong)UILabel * progressLab;

@end

NS_ASSUME_NONNULL_END
