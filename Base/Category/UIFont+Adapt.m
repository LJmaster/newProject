//
//  UIFont+Adapt.m
//  Horoscope
//
//  Created by 刘杰 on 2019/3/12.
//  Copyright © 2019 makerLJ. All rights reserved.
//  runtime
//   为了实现不同机型上的字体都按照比例适配

#import "UIFont+Adapt.h"

@implementation UIFont (Adapt)

+(void)load{
    Method sysmMethod = class_getClassMethod([UIFont class], @selector(systemFontOfSize:));
    Method customMethod = class_getClassMethod([UIFont class], @selector(h_systemFontOfSize:));
    method_exchangeImplementations(sysmMethod, customMethod);
    
}
//不同机型上的字体都按照比例适配
+ (UIFont *)h_systemFontOfSize:(CGFloat)fontSize{
    //获取设备屏幕宽度，并计算出比例scale
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat scale  = width/375.0;
    //注意：由于方法交换，系统的方法名已变成了自定义的方法名，所以这里使用了
    //自定义的方法名来获取UIFont
    return [UIFont h_systemFontOfSize:fontSize * scale];
}

@end
