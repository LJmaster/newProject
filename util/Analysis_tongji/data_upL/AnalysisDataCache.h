//
//  AnalysisDataCache.h
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 *  存储模块
 */

UIKIT_EXTERN NSString *const kBehaviorLogData;

@interface AnalysisDataCache : NSObject

+ (instancetype)sharedManager;

//写入
+ (BOOL)writeWithData:(id)data storageType:(NSString *)type;

//读取
+ (id)readWithStorageType:(NSString *)type;

//移除
+ (BOOL)removeDataWithStorageType:(NSString *)type;

@end

