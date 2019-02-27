
//
//  HSelectHoroscopeViewModel.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HSelectHoroscopeViewModel.h"
#import <UIKit/UIKit.h>

@interface HSelectHoroscopeViewModel ()

@end


@implementation HSelectHoroscopeViewModel

+(instancetype)shareManager{
    static id vm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vm = [[self alloc] init];
    });
    return vm;
}

-(void)initialization{
    HUser * userModel = [[HUser alloc] init];
    if (userModel.Br_Date == nil) {
        
    }
}




-(void)DynamicChangeHoroscopeDate:(UILabel *)dlabel withName:(UILabel *)nlabel WithItem:(NSInteger)compassItem{
    
    NSMutableDictionary * hsdict = [self heavenlyNameWithItem:compassItem];
    dlabel.text = [hsdict objectForKey:@"date"];
    nlabel.text = [hsdict objectForKey:@"name"];
}

-(NSMutableDictionary *)heavenlyNameWithItem:(NSInteger)compassItem{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (compassItem == 0) {
        [dict setObject:@"ARIES" forKey:@"name"];
        [dict setObject: @"03.24~04.19" forKey:@"date"];
        [dict setObject: @"btnAries" forKey:@"icon"];
    }
    if (compassItem == 1) {
        [dict setObject:@"TAURUS" forKey:@"name"];
        [dict setObject: @"04.20~05.20" forKey:@"date"];
        [dict setObject: @"btnTaurus" forKey:@"icon"];
    }
    if (compassItem == 2) {
        [dict setObject:@"GEMINI" forKey:@"name"];
        [dict setObject: @"05.21~06.21" forKey:@"date"];
        [dict setObject: @"btnGemini" forKey:@"icon"];
    }
    if (compassItem == 3) {
        [dict setObject:@"CANCER" forKey:@"name"];
        [dict setObject: @"06.22~07.22" forKey:@"date"];
        [dict setObject: @"btnCancer" forKey:@"icon"];
    }
    if (compassItem == 4) {
        [dict setObject:@"LEO" forKey:@"name"];
        [dict setObject: @"07.23~08.22" forKey:@"date"];
        [dict setObject: @"btnLeo" forKey:@"icon"];
    }
    if (compassItem == 5) {
        [dict setObject:@"VIRGO" forKey:@"name"];
        [dict setObject: @"08.23~09.22" forKey:@"date"];
        [dict setObject: @"btnVirgo" forKey:@"icon"];
    }
    if (compassItem == 6) {
        [dict setObject:@"LIBRA" forKey:@"name"];
        [dict setObject: @"09.23~10.23" forKey:@"date"];
        [dict setObject: @"iconLibra" forKey:@"icon"];
    }
    if (compassItem == 7) {
        [dict setObject:@"SCORPIO" forKey:@"name"];
        [dict setObject: @"10.24~11.22" forKey:@"date"];
        [dict setObject: @"btnScorpio" forKey:@"icon"];
    }
    if (compassItem == 8) {
        [dict setObject:@"SAGITTARIUS" forKey:@"name"];
        [dict setObject: @"11.23~12.21" forKey:@"date"];
        [dict setObject: @"btnSagittarius" forKey:@"icon"];
    }
    if (compassItem == 9) {
        [dict setObject:@"CAPRICORN" forKey:@"name"];
        [dict setObject: @"12.22~01.19" forKey:@"date"];
        [dict setObject: @"btnCapricorn" forKey:@"icon"];
    }
    if (compassItem == 10) {
        [dict setObject:@"AQUARIUS" forKey:@"name"];
        [dict setObject: @"01.20~02.18" forKey:@"date"];
        [dict setObject: @"btnAquarius" forKey:@"icon"];
    }
    if (compassItem == 11) {
        [dict setObject:@"PISCES" forKey:@"name"];
        [dict setObject: @"02.19~03.20" forKey:@"date"];
        [dict setObject: @"btnPisces" forKey:@"icon"];
    }
    
    return dict;
}

-(int)hsItemWithdate:(NSString *)userBirthYearstring{
    
    int _compassNum = 0;
    NSInteger _moth = [[userBirthYearstring substringWithRange:NSMakeRange(5,2)] integerValue];
    NSInteger _day = [[userBirthYearstring substringWithRange:NSMakeRange(8,2)] integerValue];
    
    if ( (_moth == 3 && _day >= 21) || (_moth == 4 && _day <= 19)) {
        NSLog(@"我是白羊座");
        _compassNum = 1;
    }
    if ( (_moth == 4 && _day >= 20) || (_moth == 5 && _day <= 20)) {
        NSLog(@"我是金牛座");
        _compassNum = 1;
    }
    if ( (_moth == 5 && _day >= 21) || (_moth == 6 && _day <= 21)) {
        NSLog(@"我是双子座");
        _compassNum = 2;
    }
    if ( (_moth == 6 && _day >= 22) || (_moth == 7 && _day <= 22)) {
        NSLog(@"我是巨蟹座");
        _compassNum = 3;
    }
    if ( (_moth == 7 && _day >= 23) || (_moth == 8 && _day <= 22)) {
        NSLog(@"我是狮子座");
        _compassNum = 4;
    }
    if ( (_moth == 8 && _day >= 23) || (_moth == 9 && _day <= 22)) {
        NSLog(@"我是处女座");
        _compassNum = 5;
    }
    if ( (_moth == 9 && _day >= 23) || (_moth == 10 && _day <= 23)) {
        NSLog(@"我是天秤座");
        _compassNum = 6;
    }
    if ( (_moth == 10 && _day >= 24) || (_moth == 11 && _day <= 22)) {
        NSLog(@"我是天蝎座");
        _compassNum = 7;
    }
    if ( (_moth == 11 && _day >= 23) || (_moth == 12 && _day <= 21)) {
        NSLog(@"我是射手座");
        _compassNum = 8;
    }
    if ( (_moth == 12 && _day >= 22) || (_moth == 1 && _day <= 19)) {
        NSLog(@"我是摩羯座");
        _compassNum = 9;
    }
    if ( (_moth == 1 && _day >= 20) || (_moth == 2 && _day <= 18)) {
        NSLog(@"我是水瓶座");
        _compassNum = 10;
    }
    if ( (_moth == 2 && _day >= 19) || (_moth == 3 && _day <= 20)) {
        NSLog(@"我是双鱼座");
        _compassNum = 11;
    }
    return _compassNum;
    
}
-(NSDateComponents *)datechangecomponents:(NSString *)date{
    NSString * datastr = [NSString stringWithFormat:@"%@ 00:00:00.000",date];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];//创建一个日期格式化器
    dateFormatter.dateFormat=@"yyyy-MM-dd HH:mm:ss.SSS";
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *datee = [dateFormatter dateFromString:datastr];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:datee];
    return dateComponent;
}

//获取出生年
-(NSString *)getyearWithDate:(NSString *)date{
    
    NSDateComponents *dateComponent = [self datechangecomponents:date];
    NSInteger year = [dateComponent year];
    return [NSString stringWithFormat:@"%ld",(long)year];
}
//获取
-(NSString *)getmonthordayWithDate:(NSString *)date{
    NSDateComponents *dateComponent = [self datechangecomponents:date];
    
    NSInteger month =  [dateComponent month];
    NSString * monthstr;
    if (month == 1) {
        monthstr = @"January";
    }
    if (month == 2) {
        monthstr = @"February";
    }
    if (month == 3) {
        monthstr = @"March";
    }
    if (month == 4) {
        monthstr = @"April";
    }
    if (month == 5) {
        monthstr = @"May";
    }
    if (month == 6) {
        monthstr = @"June";
    }
    if (month == 7) {
        monthstr = @"July";
    }
    if (month == 8) {
        monthstr = @"Aguest";
    }
    if (month == 9) {
        monthstr = @"September";
    }
    if (month == 10) {
        monthstr = @"October";
    }
    if (month == 11) {
        monthstr = @"November";
    }
    if (month == 12) {
        monthstr = @"December";
    }
    NSInteger day = [dateComponent day];
    
    NSString * daystr = [NSString stringWithFormat:@"%ld",(long)day];
    if ([daystr isEqualToString:@"0"]) {
        daystr = @"00";
    }
    if ([daystr isEqualToString:@"1"]) {
        daystr = @"01";
    }
    if ([daystr isEqualToString:@"2"]) {
        daystr = @"02";
    }
    if ([daystr isEqualToString:@"3"]) {
        daystr = @"03";
    }
    if ([daystr isEqualToString:@"4"]) {
        daystr = @"04";
    }
    if ([daystr isEqualToString:@"5"]) {
        daystr = @"05";
    }
    if ([daystr isEqualToString:@"6"]) {
        daystr = @"06";
    }
    if ([daystr isEqualToString:@"7"]) {
        daystr = @"07";
    }
    if ([daystr isEqualToString:@"8"]) {
        daystr = @"08";
    }
    if ([daystr isEqualToString:@"9"]) {
        daystr = @"09";
    }
    
    return [NSString stringWithFormat:@"%ld,%@",(long)day,monthstr];
    
    
}
//获取时间
-(NSString *)getminorsenWithDate:(NSString *)date{
    
    NSDateComponents *dateComponent = [self datechangecomponents:date];
    
    NSInteger hour =  [dateComponent hour];
    NSInteger minute =  [dateComponent minute];
    
    NSString * minstr = [NSString stringWithFormat:@"%ld",(long)minute];
    switch (minute) {
        case 0:
            minstr = @"00";
            break;
        case 1:
            minstr = @"01";
            break;
        case 2:
            minstr = @"02";
            break;
        case 3:
            minstr = @"03";
            break;
        case 4:
            minstr = @"05";
            break;
        case 6:
            minstr = @"06";
            break;
        case 7:
            minstr = @"07";
            break;
        case 8:
            minstr = @"08";
            break;
        case 9:
            minstr = @"09";
            break;
            
        default:
            break;
    }
    
    return [NSString stringWithFormat:@"%ld:%@",(long)hour,minstr];
}

@end
