//
//  HLaunchScreenViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/21.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HLaunchScreenViewController.h"
#import "HSelectHoroscopeViewController.h"

@interface HLaunchScreenViewController ()

@property (strong, nonatomic)  UIImageView *iconImgView;
@property (strong, nonatomic)  UILabel *iconNameLab;

@end

@implementation HLaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBgImage];
    
    self.iconImgView = [[BaseView baseShare] creatImageViewFrame:CGRectMake((KScreenWidth - 84)/2, 146, 84, 84) withImage:@"iconLogo" withrootView:self.view];
    self.iconNameLab = [[BaseView baseShare] creatLabelFrame:CGRectMake((KScreenWidth - 200)/2, CGRectGetMaxY(self.iconImgView.frame) + 17, 200, 20) withtext:@"Destiny Journey" withrootView:self.view fontWithName:@"ARJULIAN" size:18];
    self.iconNameLab.textColor = RGBA(132 ,157, 255, 1);
    self.iconNameLab.textAlignment = NSTextAlignmentCenter;
    
    
    [self downAnimation];
    // Do any additional setup after loading the view.
}

//动画效果
-(void)downAnimation{
    
    //开启延迟 block中就是延迟多秒去执行的代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.iconImgView.layer addAnimation:[self moveX:1.2 X:[NSNumber numberWithFloat:100]] forKey:nil];
        [self.iconNameLab.layer addAnimation:[self moveX:1.2 X:[NSNumber numberWithFloat:100]] forKey:nil];
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        HSelectHoroscopeViewController *startNowVC = [HSelectHoroscopeViewController new];
        //创建动画
        CATransition *animation = [CATransition animation];
        //设置运动轨迹的速度
//        animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        //设置动画类型为立方体动画
        animation.type = @"Fade";
        //设置动画时长
        animation.duration =0.5f;
        //设置运动的方向
        animation.subtype =kCATransitionFromRight;
        //控制器间跳转动画
        [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];

        UIWindow * window =   [[UIApplication sharedApplication].delegate window];
        window.rootViewController = startNowVC;
//        kAppWindow.rootViewController = startNowVC;

    });
}

-(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。
    animation.toValue = x;
    animation.duration = time;
    animation.removedOnCompletion = NO;//yes的话，又返回原位置了。
    animation.repeatCount = 1;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

@end
