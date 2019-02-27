//
//  HUserManager.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUserManager : NSObject

+(HUserManager *)shareManager;

//写入
- (BOOL)writeWithUser:(id)data;
//读取
- (id)readWithUser;
//移除
- (BOOL)removeUserData;

@end

NS_ASSUME_NONNULL_END
