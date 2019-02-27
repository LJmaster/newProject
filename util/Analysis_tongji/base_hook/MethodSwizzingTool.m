//
//  MethodSwizzingTool.m
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "MethodSwizzingTool.h"
#import <objc/runtime.h>


@implementation MethodSwizzingTool

+(void)swizzingForClass:(Class)cls originalSel:(SEL)originalSelector swizzingSel:(SEL)swizzingSelector{
    
    Class class = cls;
    
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzingMethod = class_getInstanceMethod(class, swizzingSelector);
    /**
     我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    
    BOOL addMethod = class_addMethod(class,
                                     originalSelector,
                                     method_getImplementation(swizzingMethod),
                                     method_getTypeEncoding(swizzingMethod));
    if (addMethod) {
        class_replaceMethod(class,
                            swizzingSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else{
        
        method_exchangeImplementations(originalMethod, swizzingMethod);
    }
}
+(NSDictionary *)getConfig
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Analysis" ofType:@"plist"];
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}


@end
