//
//  HSHeavenlyBodyDataModel.h
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSHeavenlyBodyDataModel : NSObject
@property (nonatomic, copy) NSString *Imgicon;
@property (nonatomic, copy) NSString *Imgname;
@property (nonatomic, copy) NSString *HeavenlyBodyName;
@property (nonatomic, copy) NSString *starName;

+ (instancetype)heavenlyBodyListWithDict:(NSDictionary *)dict;

@end
