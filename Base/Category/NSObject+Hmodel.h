//
//  NSObject+Hmodel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/3/11.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Hmodel <NSObject>
//Model协议，协议方法可以返回一个字典，表明特殊字段的处理规则
@optional
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Hmodel)

+(instancetype)h_modelWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
