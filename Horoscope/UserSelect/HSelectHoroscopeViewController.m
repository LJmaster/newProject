//
//  HSelectHoroscopeViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HSelectHoroscopeViewController.h"
#import "HSTopCompassView.h"
#import "HSHeavenlyBodyView.h"
#import "AISnowView.h"
#import "HSStopStarView.h"
#import "AppDelegate+Service.h"
#import "RootTabBarController.h"
#import "HSelectHoroscopeViewModel.h"
#import "HSetUserView.h"
#import "HSConsoleView.h"

@interface HSelectHoroscopeViewController ()<HeavenlyBodyDelegate,CompassDelegate,HSetUserDelegate>

///状态栏d自定义
@property (nonatomic, strong) UIView                *statusView;
///星球循环
@property (nonatomic, strong) HSHeavenlyBodyView    *heavenlyBodyView;
///星座循环
@property (nonatomic, strong) HSTopCompassView      *compassView;
/** 飞行流星动画*/
@property (nonatomic, strong) AISnowView            *meteorView;
/** 停止流星动画*/
@property (nonatomic, strong) HSStopStarView        *stopStarView;
@property (nonatomic, strong) UILabel               *horoscopeName;
@property (nonatomic, strong) UILabel               * horoscopeDate;

//控制台试图的view
@property (nonatomic,strong)HSConsoleView * consoleView;

@property (nonatomic,strong)HSetUserView  * v;



@end

@implementation HSelectHoroscopeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBgImage];
    [self meterorAnimation];
    [self.view addSubview:self.statusView];
    [self.view addSubview:self.heavenlyBodyView];
    [self.view addSubview:self.compassView];
    [self.view addSubview:self.consoleView];
    
    self.horoscopeName.text = @"ARIES";
    self.horoscopeDate.text = @"03.24~04.19";
//    [self reload];
}

-(void)reload{
    HUser *samePeople = [[HUserManager shareManager] readWithUser];
    if (samePeople.Br_Date == nil) {
        self.horoscopeName.text = @"ARIES";
        self.horoscopeDate.text = @"03.24~04.19";
    }else{
        //根据生日改变星球跟icon
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:samePeople.horoscopeInt inSection:1];
        [self.compassView compassUpdateCurrentlySelectedWithIndexpath:indexPath];
        [self.heavenlyBodyView heavenlyUpdateCurrentlySelectedWithIndexpath:indexPath];
        [[HSelectHoroscopeViewModel shareManager] DynamicChangeHoroscopeDate:self.horoscopeDate withName:self.horoscopeName WithItem:samePeople.horoscopeInt];
        
        [self.consoleView refreshUI];
    }

}
-(BOOL)prefersStatusBarHidden
{
    return YES;// 返回YES表示隐藏，返回NO表示显示
}
//用户信息填写时间，方法
-(void)personalInformationAction:(UIButton *)sender{
    self.v = [[HSetUserView alloc] initWithFrame:self.view.bounds];
    self.v.delegate = self;
    [self.view addSubview:self.v];
}
//开始星座方法
-(void)startnowAction:(UIButton *)sender{
    
    
//    HUser *samePeople = [[HUserManager shareManager] readWithUser];
//    if (samePeople == nil) {
//        samePeople = [[HUser alloc] init];
//        samePeople.sex = @"nc";
//        samePeople.Br_Date = @"1993.11.02";
//
//        int hi = [[HSelectHoroscopeViewModel shareManager] hsItemWithdate:@"1993.11.02"];
//        NSDictionary * hdict = [[HSelectHoroscopeViewModel shareManager] heavenlyNameWithItem:hi];
//        samePeople.horoscope = [NSString stringWithFormat:@"%@",[hdict objectForKey:@"name"]];
//        samePeople.horoscopeInt = hi;
//    }else{
//        samePeople.sex = @"nc";
//        samePeople.Br_Date = @"1993.11.02";
//
//        int hi = [[HSelectHoroscopeViewModel shareManager] hsItemWithdate:@"1993.11.02"];
//        NSDictionary * hdict = [[HSelectHoroscopeViewModel shareManager] heavenlyNameWithItem:hi];
//        samePeople.horoscope = [NSString stringWithFormat:@"%@",[hdict objectForKey:@"name"]];
//        samePeople.horoscopeInt = hi;
//
//    }
//
//
//    BOOL hh =   [[HUserManager shareManager] writeWithUser:samePeople];
//    NSLog(@"%d",hh);
    
    if ([kAppWindow.rootViewController isEqual:self]){
         kAppWindow.rootViewController = [RootTabBarController new];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
//TODO:接收代理方法传过来的值   更新星球跟icon 已经名称缩略图
- (void)changeHeavenlyItem:(NSInteger )heavenlyItem{
    [[HSelectHoroscopeViewModel shareManager] DynamicChangeHoroscopeDate:self.horoscopeDate withName:self.horoscopeName WithItem:heavenlyItem];
}
-(void)changeHeavenlyIndexpath:(NSIndexPath *)indexPath{
    [self.compassView compassUpdateCurrentlySelectedWithIndexpath:indexPath];
}
- (void)changeCompassItem:(NSInteger )compassItem{
    [[HSelectHoroscopeViewModel shareManager] DynamicChangeHoroscopeDate:self.horoscopeDate withName:self.horoscopeName WithItem:compassItem];
}
-(void)changeCompassIndexpath:(NSIndexPath *)indexpath{
    [self.heavenlyBodyView heavenlyUpdateCurrentlySelectedWithIndexpath:indexpath];
}
#pragma mark -懒加载

-(UIView*)statusView{
    if (!_statusView) {
        CGFloat h = 0;
        if (kIphone_x) {
            h = 44;
        };
        _statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, h)];
        _statusView.backgroundColor = RGBA(0, 0, 0, 0.3);
    }
   
    return _statusView;
}
-(HSTopCompassView *)compassView{
    //星座轮播
    if (!_compassView) {
    
        _compassView = [[HSTopCompassView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.statusView.frame), KScreenWidth, 55)];
        _compassView.delegate = self;
    }
    return _compassView;
}
-(HSHeavenlyBodyView *)heavenlyBodyView{
    //星球轮播
    if (!_heavenlyBodyView) {
        _heavenlyBodyView = [[HSHeavenlyBodyView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.compassView.frame) + 10, KScreenWidth, KScreenWidth)];
        [self.view addSubview:_heavenlyBodyView];
        _heavenlyBodyView.delegate = self;
    }
    return _heavenlyBodyView;
}
-(UILabel *)horoscopeName{
    if (!_horoscopeName) {
        _horoscopeName = [[BaseView baseShare] creatLabelFrame:CGRectMake(KScreenWidth/2 - 100, CGRectGetMaxY(self.compassView.frame) + 9, 200, 25) withtext:@"" withrootView:self.view fontWithName:@"ARJULIAN" size:22];
        _horoscopeName.textAlignment = NSTextAlignmentCenter;
        _horoscopeName.alpha = 0.8;
        _horoscopeName.textColor = RGB(255, 255, 255);
    }
    return _horoscopeName;
}
-(UILabel *)horoscopeDate{
    if (!_horoscopeDate) {
        _horoscopeDate = [[BaseView baseShare] creatLabelFrame:CGRectMake(KScreenWidth/2 - 100, CGRectGetMaxY(self.horoscopeName.frame), 200, 18) withtext:@"" withrootView:self.view fontWithName:@"ARJULIAN" size:16];
        _horoscopeDate.textAlignment = NSTextAlignmentCenter;
        _horoscopeDate.alpha = 0.8;
        _horoscopeDate.textColor = RGBA(255, 255, 255,0.6);
    }
    return _horoscopeDate;
}
-(HSConsoleView *)consoleView{
    if (!_consoleView) {
        _consoleView = [[HSConsoleView alloc] initWithFrame:CGRectMake(0, KScreenHeight - 234 - kBottomSafeHeight, KScreenWidth, 234)];
        [_consoleView.personalBtn addTarget:self action:@selector(personalInformationAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_consoleView.startNowBtn addTarget:self action:@selector(startnowAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _consoleView;
}

#pragma mark -//流星背景动画
- (void)meterorAnimation{
    self.meteorView       = [[AISnowView alloc]initWithFrame: CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.meteorView];
    
    self.stopStarView       = [[HSStopStarView alloc]initWithFrame: CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.stopStarView];
    
}
#pragma mark -用户信息h填写成功回调代理
-(void)userdataFillIn{
    
    [self.v removeFromSuperview];
    
    HUser *samePeople = [[HUserManager shareManager] readWithUser];
    
    //根据生日改变星球跟icon
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:samePeople.horoscopeInt inSection:1];
    [self.compassView compassUpdateCurrentlySelectedWithIndexpath:indexPath];
    [self.heavenlyBodyView heavenlyUpdateCurrentlySelectedWithIndexpath:indexPath];
    [[HSelectHoroscopeViewModel shareManager] DynamicChangeHoroscopeDate:self.horoscopeDate withName:self.horoscopeName WithItem:samePeople.horoscopeInt];
        
    [self.consoleView refreshUI];
  
}
@end
