//
//  MethodSwizzingTool.h
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MethodSwizzingTool : NSObject

/**
 runtime Method方法替换

 @param cls class
 @param originalSelector 原先的方法
 @param swizzingSelector 替换到的方法
 */
+(void)swizzingForClass:(Class)cls originalSel:(SEL)originalSelector swizzingSel:(SEL)swizzingSelector;

+(NSDictionary *)getConfig;


@end

NS_ASSUME_NONNULL_END
