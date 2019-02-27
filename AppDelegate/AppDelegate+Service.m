//
//  AppDelegate+Service.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "AppDelegate+Service.h"
#import "HSelectHoroscopeViewController.h"
#import "RootTabBarController.h"
#import "HLaunchScreenViewController.h"

@implementation AppDelegate (Service)

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [HLaunchScreenViewController new];
    
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}
#pragma mark ————— 初始化用户系统 —————
-(void)initUserManager{

}

#pragma mark ————— 配置第三方 —————
-(void)configUSharePlatforms{

}
#pragma mark ————— 监听网络状态 —————
- (void)monitorNetworkStatus{
//    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType status) {
//        switch (status) {
//            case PPNetworkStatusUnknown:
//                NSLog(@"未知网络");
//                break;
//            case PPNetworkStatusNotReachable:
//                NSLog(@"无网络");
//                break;
//            case PPNetworkStatusReachableViaWWAN:
//                NSLog(@"手机自带网络");
//                break;
//            case PPNetworkStatusReachableViaWiFi:
//                NSLog(@"WIFI");
//                break;
//        }
//    }];
    ;
    
    DLog(@" -------  %id",[PPNetworkHelper isNetwork])
}



+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


-(UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}


@end
