//
//  HSelectHoroscopeViewModel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HSelectHoroscopeViewModel : NSObject

+(instancetype)shareManager;

/**
 初始化 ，数据分析，展示不通
 */
-(void)initialization;

/**
 滑动改变星座日期姓名

 @param dlabel 日期
 @param nlabel 姓名
 @param compassItem 选中第几个
 */
-(void)DynamicChangeHoroscopeDate:(UILabel *)dlabel withName:(UILabel *)nlabel WithItem:(NSInteger)compassItem;

/**
 滑动厚的数据

 @param compassItem 选中第几个
 @return 当前的信息
 */
-(NSMutableDictionary *)heavenlyNameWithItem:(NSInteger)compassItem;

-(int)hsItemWithdate:(NSString *)userBirthYearstring;


//获取出生年
-(NSString *)getyearWithDate:(NSString *)date;
//获取生日英文
-(NSString *)getmonthordayWithDate:(NSString *)date;
//获取时间
-(NSString *)getminorsenWithDate:(NSString *)date;

@end

NS_ASSUME_NONNULL_END
