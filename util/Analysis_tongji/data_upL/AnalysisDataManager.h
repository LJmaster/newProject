//
//  AnalysisDataManager.h
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnalysisModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnalysisDataManager : NSObject

+ (instancetype)sharedManager;

//代码埋点
- (void)pushKTBehaviorDataWithModel:(AnalysisModel *)model;

//页面停留
- (void)pushKTBehaviorDataWithPageId:(NSString *)pageId time:(NSString *)time;

- (void)pushKTBehaviorDataWithPageId:(NSString *)pageId start:(NSString *)startTime end:(NSString *)endTime;

@end

NS_ASSUME_NONNULL_END
