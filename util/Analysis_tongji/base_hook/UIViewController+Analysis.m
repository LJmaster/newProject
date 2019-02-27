//
//  UIViewController+Analysis.m
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "UIViewController+Analysis.h"
#import "MethodSwizzingTool.h"
@implementation UIViewController (Analysis)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalAppearSelector = @selector(viewWillAppear:);
        SEL swizzingAppearSelector = @selector(user_viewWillAppear:);
        [MethodSwizzingTool swizzingForClass:[self class] originalSel:originalAppearSelector swizzingSel:swizzingAppearSelector];
        
        SEL originalDisappearSelector = @selector(viewWillDisappear:);
        SEL swizzingDisappearSelector = @selector(user_viewWillDisappear:);
        [MethodSwizzingTool swizzingForClass:[self class] originalSel:originalDisappearSelector swizzingSel:swizzingDisappearSelector];
        
        SEL originalDidLoadSelector = @selector(viewDidLoad);
        SEL swizzingDidLoadSelector = @selector(swizzlingViewDidLoad);
        [MethodSwizzingTool swizzingForClass:[self class] originalSel:originalDidLoadSelector swizzingSel:swizzingDidLoadSelector];
        
    });
}
-(void)user_viewWillAppear:(BOOL)animated
{
    [self user_viewWillAppear:animated];
}

-(void)user_viewWillDisappear:(BOOL)animated
{
    [self user_viewWillDisappear:animated];
}

// 我们自己实现的方法，也就是和self的viewDidLoad方法进行交换的方法。
-(void)swizzlingViewDidLoad{
    //从配置表中取参数的过程 1 固定参数  2 业务参数（此处参数被target持有）
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
//        NSLog(@"统计打点 : %@", self.class);
    }
    [self swizzlingViewDidLoad];
    
}

@end
