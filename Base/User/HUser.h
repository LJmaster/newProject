//
//  HUser.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUser : NSObject<NSCoding>     // 给自定义类归档，首先要遵守NSCoding协议。

@property (nonatomic, strong) NSString *name; // 姓名
@property (nonatomic, strong) NSString *Br_Date; // 出生日期
@property (nonatomic, strong) NSString *sex; //性别
@property (nonatomic, strong) NSString *horoscope; // 星座
@property (nonatomic, assign) int       horoscopeInt; // 星座的位置
@property (nonatomic, assign) BOOL      marry; // 结婚
@property (nonatomic, strong) UIImage  * avatar; // 头像

//- (NSDictionary *)dicValue;

@end

NS_ASSUME_NONNULL_END
