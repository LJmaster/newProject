//
//  HMatchViewModel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/23.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMatchModel.h"
#import "HHoroscopeMatchView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HMatchViewModel : NSObject

/**单利*/
+(HMatchViewModel *)shared;

@property(nonatomic,strong) HMatchModel * model;

/**
 点击
 
 @param horoscopeButton 选择的星座button
 @param selectView 最后展示的位置
 @param f 星座button 相对self。view的frame
 */
-(void)selectHoroscope:(UIButton *)horoscopeButton
           withEndView:(HHoroscopeMatchView *)changeView
           withFrame:(CGRect)f;
@end

NS_ASSUME_NONNULL_END
