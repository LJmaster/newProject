//
//  BaseView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/11.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseView : NSObject

+(BaseView *)baseShare;


/**
 创建了一个button
 
 @param frame frame
 @param string 图片名称或者文字
 @param rootView 添加到的view
 @return 创建好的button
 */
-(UIButton *)creatButtonFrame:(CGRect)frame
              withimageOrtext:(NSString *)string
              withrootView:(UIView*)rootView
              withtarget:(nullable id)targe
              withaction:(SEL)action;
/**
 创建了一个label
 
 @param frame frame
 @param string text
 @param rootView 添加到的view
 @param fontName 字体
 @param fontSize 字体大小
 @return 创建好的label
 */
-(UILabel *)creatLabelFrame:(CGRect)frame
                   withtext:(NSString *)string
                   withrootView:(UIView*)rootView
                   fontWithName:(NSString *)fontName
                   size:(CGFloat)fontSize;

/**
 创建了一个Imageview
 
 @param frame frame
 @param string 图片的i名称
 @param rootView t
 @return 创建好的image
 */
-(UIImageView *)creatImageViewFrame:(CGRect)frame
                          withImage:(NSString *)string
                          withrootView:(UIView*)rootView;


-(void)setViewshadowView:(UIView *)view
             shadowColor:(UIColor*)shadowColor
             cornerRadius:(CGFloat)cornerRadius;
@end

NS_ASSUME_NONNULL_END
