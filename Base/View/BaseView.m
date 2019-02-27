
//
//  BaseView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/11.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+(BaseView *)baseShare{
    static BaseView * rov = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rov = [[BaseView alloc] init];
    });
    return rov;
}


/**
 创建了一个button
 
 @param frame frame
 @param string 图片名称或者文字
 @param rootView 添加到的view
 @return 创建好的button
 */
-(UIButton *)creatButtonFrame:(CGRect)frame withimageOrtext:(NSString *)string withrootView:(UIView*)rootView withtarget:(nullable id)targe withaction:(SEL)action{
    UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = frame;
    if ([UIImage imageNamed:string]) {
        [button setImage:[UIImage imageNamed:string] forState:(UIControlStateNormal)];
    }else{
        [button setTitle:string forState:(UIControlStateNormal)];
    }
    [button addTarget:targe action:action forControlEvents:(UIControlEventTouchUpInside)];
    [rootView addSubview:button];
    return button;
}

/**
 创建了一个label

 @param frame frame
 @param string text
 @param rootView 添加到的view
 @param fontName 字体
 @param fontSize 字体大小
 @return 创建好的label
 */
-(UILabel *)creatLabelFrame:(CGRect)frame withtext:(NSString *)string withrootView:(UIView*)rootView fontWithName:(NSString *)fontName size:(CGFloat)fontSize{
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.text = string;
    [rootView addSubview:label];
    label.font = [UIFont fontWithName:fontName size:fontSize];
//    label.textColor = [UIColor ];
    label.numberOfLines = 0;
    return label;
}

/**
 创建了一个Imageview

 @param frame frame
 @param string 图片的i名称
 @param rootView t
 @return 创建好的image
 */
-(UIImageView *)creatImageViewFrame:(CGRect)frame withImage:(NSString *)string withrootView:(UIView*)rootView {
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    if ([UIImage imageNamed:string]) {
        imageView.image =[UIImage imageNamed:string];
    }
    [rootView addSubview:imageView];
    return imageView;
}




-(void)setViewshadowView:(UIView *)view shadowColor:(UIColor*)shadowColor cornerRadius:(CGFloat)cornerRadius{
        view.backgroundColor = [UIColor clearColor];
        //v.layer.masksToBounds=YES;这行去掉
        view.layer.cornerRadius = cornerRadius;
        view.layer.shadowColor = shadowColor.CGColor;
        view.layer.shadowOffset = CGSizeMake(2, 2);
        view.layer.shadowOpacity = 0.5;
        view.layer.shadowRadius = 5;
}

@end
