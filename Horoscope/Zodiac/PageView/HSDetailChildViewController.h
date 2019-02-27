//
//  HSDetailChildViewController.h
//  horoscope2018
//
//  Created by 杰刘 on 2017/12/14.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "PersonalCenterChildBaseVC.h"


@interface HSDetailChildViewController : PersonalCenterChildBaseVC

/**
 进行数据判断
 今天 明天 后天
 */
@property (nonatomic,copy) NSString * type;

/**
 这是星座的名称
 */
@property (nonatomic,copy) NSString  * horoscopeName;


@property (nonatomic,strong) NSDictionary * networkHoroscopeDict;

@end
