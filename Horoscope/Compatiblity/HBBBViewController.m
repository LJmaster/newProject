//
//  HBbbViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HBBBViewController.h"
#import "ZYQSphereView.h"
#import "HMatchModel.h"
#import "HMatchViewModel.h"
#import "HHoroscopeMatchView.h"
#import "HMatchDetailViewController.h"

@interface HBBBViewController ()
//头部nav
@property(nonatomic,strong) HNameNavView  * navView;
//旋转的星球
@property(nonatomic,strong) ZYQSphereView  * sphereView;
//选中的模块
@property(nonatomic,strong) HHoroscopeMatchView  * matchView;

@end

@implementation HBBBViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBgImage];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.sphereView];
    [self.view addSubview:self.matchView];
}




//=======================

-(HNameNavView *)navView{
    if (!_navView) {
        _navView = [[HNameNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 16 + 34)];
        _navView.title = @"Compatiblity";
    }
    return _navView;
}
-(ZYQSphereView *)sphereView{
    if (!_sphereView) {
        _sphereView = [[ZYQSphereView alloc] initWithFrame:CGRectMake(00,
                                                                      CGRectGetMaxY(self.navView.frame),
                                                                      KScreenWidth,
                                                                      KScreenHeight - CGRectGetMaxY(self.navView.frame) - kTabBarHeight - kBottomSafeHeight - 100)];
        NSMutableArray *views = [[NSMutableArray alloc] init];
        for (int i = 0; i < 12; i++) {
            UIButton *subV = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            [subV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"planet_0%dnew",i+1]] forState:UIControlStateNormal];
            if (i >= 10) {
              [subV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"planet_%dnew",i+1]] forState:UIControlStateNormal];
            }
            subV.layer.masksToBounds=YES;
            subV.layer.cornerRadius=3;
            [subV addTarget:self action:@selector(subVClick:) forControlEvents:UIControlEventTouchUpInside];
            [views addObject:subV];
        }
        //    传递数据视图
        [_sphereView setItems:views];
        _sphereView.isPanTimerStart=YES;
        //    开始滚动
        [_sphereView timerStart];
    }
    
    return _sphereView;
}

-(HHoroscopeMatchView *)matchView{
    if (!_matchView) {
        _matchView = [[HHoroscopeMatchView alloc] initWithFrame:CGRectMake(0, KScreenHeight - 90- 17 - kTabBarHeight - kBottomSafeHeight, KScreenWidth, 90)];

    }
    return _matchView;
}

-(void)demo3dvvvv{
  
}

-(void)subVClick:(UIButton*)sender{
    
//    BOOL isStart=[self.sphereView isTimerStart];
//    [self.sphereView timerStop];
//    [UIView animateWithDuration:0.1 animations:^{
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.05 animations:^{
//            sender.transform=CGAffineTransformMakeScale(1, 1);
//            if (isStart) {
//                [self.sphereView timerStart];
//            }
//        }];
//    }];
    
//

//    x相对当前屏幕的位置
   CGRect f = [_sphereView convertRect:sender.frame toView:self.view];
    [[HMatchViewModel shared] selectHoroscope:sender withEndView:self.matchView withFrame:f];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        HMatchDetailViewController * detailVC = [[HMatchDetailViewController alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    });
    
}



-(void)changePF:(UIButton*)sender{
    if ([self.sphereView isTimerStart]) {
        [self.sphereView timerStop];
    }
    else{
        [self.sphereView timerStart];
    }
}

-(void)selectHoroscpeWithmatch:(UIButton *)sender{
    
}



@end
