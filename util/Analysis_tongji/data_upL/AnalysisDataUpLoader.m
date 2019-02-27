//
//  AnalysisDataUpLoader.m
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "AnalysisDataUpLoader.h"
#import "AnalysisDataCache.h"

@implementation AnalysisDataUpLoader
+ (void)load {
    //程序启动、上报记录
    __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        [AnalysisDataUpLoader upLoadData];
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }];
}

+ (void)upLoadData {
    id data = [AnalysisDataCache readWithStorageType:kBehaviorLogData];
    if (data) {
        //上报
        NSLog(@"程序启动、上报记录：%@",data);
        [AnalysisDataCache removeDataWithStorageType:kBehaviorLogData];
    }
}
@end
