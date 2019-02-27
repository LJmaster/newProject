//
//  HBitrhdayPickerView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/30.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HBitrhdayPickerView.h"
#import "PGPickerView.h"

@interface HBitrhdayPickerView ()<PGPickerViewDelegate,PGPickerViewDataSource>
{
    NSInteger yearRange;
    NSInteger dayRange;
    NSInteger startYear;
    NSInteger selectedYear;
    NSInteger selectedMonth;
    NSInteger selectedDay;
    NSInteger selectedHour;
    NSInteger selectedMinute;
    NSInteger selectedSecond;
    NSCalendar *calendar;

}

@property (nonatomic, strong) PGPickerView *pickerView;
@property (nonatomic, strong) NSArray * monthEnArr;

@end

@implementation HBitrhdayPickerView

-(NSArray *)monthEnArr{
    
    if (!_monthEnArr) {
        _monthEnArr = [[NSArray alloc] initWithObjects:@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec", nil];
    }
    return _monthEnArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pickerView= [[PGPickerView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        self.pickerView.lineHeight = 0;
        self.pickerView.textFontOfOtherRow = [UIFont fontWithName:@"DIN-Medium" size:19];
        self.pickerView.textFontOfSelectedRow = [UIFont fontWithName:@"DIN-Medium" size:19];
        self.pickerView.textColorOfSelectedRow = [UIColor whiteColor];
        self.pickerView.textColorOfOtherRow = RGBA(255, 255, 255, 0.2);
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self addSubview:self.pickerView];
        
        
        NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
        comps = [calendar0 components:unitFlags fromDate:[NSDate date]];
        NSInteger year=[comps year];
        startYear=year-50;
        yearRange=100;
        [self setCurrentDate:[NSDate date]];
    }
    return self;
}



#pragma mark -- UIPickerViewDelegate
//默认时间的处理
-(void)setCurrentDate:(NSDate *)currentDate
{
    //获取当前时间
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    comps = [calendar0 components:unitFlags fromDate:currentDate];
    NSInteger year=[comps year];
    NSInteger month=[comps month];
    NSInteger day=[comps day];
    NSInteger hour=[comps hour];
    NSInteger minute=[comps minute];
    
    selectedYear=year;
    selectedMonth=month;
    selectedDay=day;
    selectedHour=hour;
    selectedMinute=minute;
    
    dayRange=[self isAllDay:year andMonth:month];
    
 
    [self.pickerView selectRow:year-startYear inComponent:2 animated:NO];
    [self.pickerView selectRow:month-1 inComponent:1 animated:NO];
    [self.pickerView selectRow:day-1 inComponent:0 animated:NO];

//    [self pickerView:self.pickerView didSelectRow:year-startYear inComponent:2];
//    [self pickerView:self.pickerView didSelectRow:month-1 inComponent:1];
//    [self pickerView:self.pickerView didSelectRow:day-1 inComponent:0];
//
//    [self.pickerView reloadAllComponents];
}

-(NSInteger)isAllDay:(NSInteger)year andMonth:(NSInteger)month
{
    int day=0;
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day=31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day=30;
            break;
        case 2:
        {
            if(((year%4==0)&&(year%100!=0))||(year%400==0))
            {
                day=29;
                break;
            }
            else
            {
                day=28;
                break;
            }
        }
        default:
            break;
    }
    return day;
}



#pragma PGPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(PGPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(PGPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    
    if (component == 0) {
        return dayRange;
    }else if (component == 1) {
        return 12;
    }else{
       return yearRange;
    }

}
#pragma  PGPickerViewDelegate
- (nullable NSString *)pickerView:(PGPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        return [NSString stringWithFormat:@"%ld",(long)row+1];
    }else if (component == 1) {
        return self.monthEnArr[row];
    }else{
        return [NSString stringWithFormat:@"%ld",(long)(startYear + row)];
    }
    
}

- (void)pickerView:(PGPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (component) {
        case 0:
        {
            selectedDay=row+1;
        }
            break;
        case 1:
        {
            selectedMonth=row+1;
            dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 2:
        {
            selectedYear=startYear + row;
            dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
            
        default:
            break;
    }
    
    NSLog(@"%@",[NSString stringWithFormat:@"%ld-%.2ld-%.2ld",selectedYear,selectedMonth,selectedDay]);
    
    
}
@end
