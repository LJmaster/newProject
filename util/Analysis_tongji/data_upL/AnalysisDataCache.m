//
//  AnalysisDataCache.m
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "AnalysisDataCache.h"
#import "AnalysisDataManager.h"

NSString *const FileName = @"LocalStorage1";
NSString *const kBehaviorLogData = @"kBehaviorLogData";

@interface AnalysisDataCache ()
@property (nonatomic, strong) NSString *storagePath;
@end

@implementation AnalysisDataCache

+ (instancetype)sharedManager {
    static id sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}


//写入
+ (BOOL)writeWithData:(id)data storageType:(NSString *)type {
    
    AnalysisDataCache *mamager = [AnalysisDataCache sharedManager];
    NSString *path = [mamager.storagePath stringByAppendingPathComponent:type];
    NSData *temp = [NSKeyedArchiver archivedDataWithRootObject:data];
//     NSData *temp = [NSKeyedArchiver archivedDataWithRootObject:data requiringSecureCoding:YES error:nil];
    return [NSKeyedArchiver archiveRootObject:temp toFile:path];
//    return [NSKeyedArchiver archivedDataWithRootObject:temp requiringSecureCoding:YES error:nil]
}

//读取
+ (id)readWithStorageType:(NSString *)type {
    
    AnalysisDataCache *mamager = [AnalysisDataCache sharedManager];
    NSString *path = [mamager.storagePath stringByAppendingPathComponent:type];
    NSData *data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!data) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
}

//移除
+ (BOOL)removeDataWithStorageType:(NSString *)type {
    
    AnalysisDataCache *mamager = [AnalysisDataCache sharedManager];
    NSString *path = [mamager.storagePath stringByAppendingPathComponent:type];
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


#pragma mark - getter
- (NSString *)storagePath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:FileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    return path;
}


@end
