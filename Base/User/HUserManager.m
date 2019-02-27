//
//  HUserManager.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HUserManager.h"

#define kuserfilename @"usermodel"

@implementation HUserManager
+(HUserManager *)shareManager{
    static HUserManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

//写入
- (BOOL)writeWithUser:(id)data{
    NSString *path = [self userstringByAppendingPathComponent:kuserfilename];
    NSData *temp = [NSKeyedArchiver archivedDataWithRootObject:data];
    return [NSKeyedArchiver archiveRootObject:temp toFile:path];
}

//读取
- (id)readWithUser {
    
    NSString *path = [self userstringByAppendingPathComponent:kuserfilename];
    NSData *data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!data) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
}

//移除
- (BOOL)removeUserData{
    
    NSString *path = [self userstringByAppendingPathComponent:kuserfilename];
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


//获取documents文件夹下对应的目录
- (NSString *)userstringByAppendingPathComponent:(NSString *)filename{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [documents stringByAppendingPathComponent:filename];
}
@end
