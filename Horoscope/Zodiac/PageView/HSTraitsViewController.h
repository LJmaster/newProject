//
//  HSTraitsViewController.h
//  horoscope2018
//
//  Created by 杰刘 on 2017/12/20.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "PersonalCenterChildBaseVC.h"

@interface HSTraitsViewController : PersonalCenterChildBaseVC

/**
 这是星座的名称
 */
@property (nonatomic,copy) NSString  * horoscopeName;

@property (nonatomic,strong) NSDictionary * traitsDict;

@end
