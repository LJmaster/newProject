//
//  HMatchViewModel.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/23.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HMatchViewModel.h"

@implementation HMatchViewModel

+(HMatchViewModel *)shared{
    static HMatchViewModel * viewmodel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewmodel = [[self alloc] init];
    });
    return viewmodel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.model = [[HMatchModel alloc] init];
    }
    return self;
}


-(void)selectHoroscope:(UIButton *)horoscopeButton
           withEndView:(HHoroscopeMatchView *)changeView
             withFrame:(CGRect)f{

    
//        selectView.frame = f;
//        selectView.tag = horoscopeButton.tag;
//        [selectView setImage:horoscopeButton.currentImage forState:(UIControlStateNormal)];
//        [UIView animateWithDuration:0.3 animations:^{
//            selectView.y = KScreenHeight - 200;
//            selectView.x = KScreenWidth - 100;
//        } completion:^(BOOL finished) {
//            selectView.width = 100;
//            selectView.height = 100;
//        }];


    changeView.righthoroscopIImage.image = horoscopeButton.currentImage;
    changeView.righthoroscopName.text = @"10000";
    changeView.righthoroscopIcon.image = [UIImage imageNamed:@"zodiac_02"];
    
}


//- (void)xxxxxxxanimatio:(UIView*)bview{
//     /* 移动 */
//    CABasicAnimation * posAni = [CABasicAnimation animationWithKeyPath:@"position"];
//        // 起始帧和终了帧的设定
//        posAni.fromValue = [NSValue valueWithCGPoint:bview.layer.position]; // 起始帧
//        posAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, KScreenHeight - 200)]; // 终了帧
//
//    CABasicAnimation * bodAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    bodAni.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
//
//    CAAnimationGroup * groupAni = [CAAnimationGroup animation];
//    groupAni.animations = @[posAni, bodAni];
//    groupAni.duration = 1.0; // 持续时间
//    groupAni.fillMode = kCAFillModeForwards;
//    groupAni.removedOnCompletion = NO;
//    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [bview.layer addAnimation:groupAni forKey:@"groupAni"];
//}

@end
