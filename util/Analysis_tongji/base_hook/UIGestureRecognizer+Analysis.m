//
//  UIGestureRecognizer+Analysis.m
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "UIGestureRecognizer+Analysis.h"
#import "MethodSwizzingTool.h"
#import <objc/runtime.h>



@implementation UIGestureRecognizer (Analysis)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [MethodSwizzingTool swizzingForClass:[self class] originalSel:@selector(initWithTarget:action:) swizzingSel:@selector(vi_initWithTarget:action:)];
    });
}

- (instancetype)vi_initWithTarget:(nullable id)target action:(nullable SEL)action{
    
    UIGestureRecognizer *selfGestureRecognizer = [self vi_initWithTarget:target action:action];
    
    if (!target && !action) {
        return selfGestureRecognizer;
    }
    
    if ([target isKindOfClass:[UIScrollView class]]) {
        return selfGestureRecognizer;
    }
    
    Class class = [target class];
    
    
    SEL sel = action;
    
    NSString * sel_name = [NSString stringWithFormat:@"%s/%@", class_getName([target class]),NSStringFromSelector(action)];
    SEL sel_ =  NSSelectorFromString(sel_name);
    
    BOOL isAddMethod = class_addMethod(class,
                                       sel_,
                                       method_getImplementation(class_getInstanceMethod([self class], @selector(responseUser_gesture:))),
                                       nil);
    
    self.methodName = NSStringFromSelector(action);
    if (isAddMethod) {
        Method selMethod = class_getInstanceMethod(class, sel);
        Method sel_Method = class_getInstanceMethod(class, sel_);
        method_exchangeImplementations(selMethod, sel_Method);
    }
    
    return selfGestureRecognizer;
}

-(void)responseUser_gesture:(UIGestureRecognizer *)gesture
{
    
    NSString * identifier = [NSString stringWithFormat:@"%s/%@", class_getName([self class]),gesture.methodName];
    
    SEL sel = NSSelectorFromString(identifier);
    if ([self respondsToSelector:sel]) {
        IMP imp = [self methodForSelector:sel];
        void (*func)(id, SEL,id) = (void *)imp;
        func(self, sel,gesture);
    }
    
//    NSLog(@"手势打点统计 : %@", identifier);
    
}



//动态添加属性 —————— 手势事件的名称

-(void)setMethodName:(NSString *)methodName
{
    objc_setAssociatedObject(self, @"methodName", methodName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(NSString *)methodName
{
    return objc_getAssociatedObject(self, @"methodName");
}

@end
