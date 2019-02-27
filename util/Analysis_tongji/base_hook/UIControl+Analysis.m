//
//  UIControl+Analysis.m
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "UIControl+Analysis.h"
#import "MethodSwizzingTool.h"
@implementation UIControl (Analysis)
+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzingSelector = @selector(user_sendAction:to:forEvent:);
        [MethodSwizzingTool swizzingForClass:[self class] originalSel:originalSelector swizzingSel:swizzingSelector];
    });
}

-(void)user_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self user_sendAction:action to:target forEvent:event];
    
     NSString * identifier = [NSString stringWithFormat:@"%@/%@/%ld", [target class], NSStringFromSelector(action),self.tag];
    
//     NSLog(@"事件统计打点 : %@", identifier);
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // Do the work in background
//        AnalysisModel * data = [AnalysisModel new];
//        dispatch_async(dispatch_get_main_queue(), ^{
//         data.op_type = [NSString stringWithFormat:@"%ld", self.tag];
//        });
//        
//        data.page_code = [NSString stringWithFormat:@"%@", [target class]];
//        data.event_code = [NSString stringWithFormat:@"%@", NSStringFromSelector(action)];;
//        data.start_time =[AnalysisModel getNowTimeTimestamp];
////        [NSThread sleepForTimeInterval:1];
//        data.end_time = [AnalysisModel getNowTimeTimestamp];
//        [[AnalysisDataManager sharedManager] pushKTBehaviorDataWithModel:data];
//    });
}

@end
