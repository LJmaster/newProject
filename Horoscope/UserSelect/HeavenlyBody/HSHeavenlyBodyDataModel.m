//
//  HSHeavenlyBodyDataModel.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSHeavenlyBodyDataModel.h"

@implementation HSHeavenlyBodyDataModel

+(instancetype)heavenlyBodyListWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
