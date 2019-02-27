//
//  HSTopCompassDataModel.h
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/18.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSTopCompassDataModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

+ (instancetype)functionListWithDict:(NSDictionary *)dict;
@end
