//
//  AppDelegate+Service.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */

@interface AppDelegate (Service)

//初始化 window
-(void)initWindow;

//初始化 配置第三方
-(void)configUSharePlatforms;

//监听网络状态
- (void)monitorNetworkStatus;

//单例
+ (AppDelegate *)shareAppDelegate;

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;

@end

NS_ASSUME_NONNULL_END
