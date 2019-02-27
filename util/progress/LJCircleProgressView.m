//
//  LJCircleProgressView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "LJCircleProgressView.h"
#define PROGRESS_LINE_WIDTH 5 //弧线的宽度
#define RYUIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation LJCircleProgressView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        CGPoint arcCenter = CGPointMake(frame.size.width/2, frame.size.width/2);
        CGFloat radius = frame.size.width/2;
        //圆形路径
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                            radius:radius
                                                        startAngle:0
                                                          endAngle:M_PI*2
                                                         clockwise:YES];
        
        //CAShapeLayer
        CAShapeLayer *shapLayer = [CAShapeLayer layer];
        shapLayer.path = path.CGPath;
        shapLayer.fillColor = [UIColor clearColor].CGColor;//图形填充色
        UIColor *grayColor =  [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1];
        shapLayer.strokeColor =  grayColor.CGColor;//边线颜色
        shapLayer.lineWidth = PROGRESS_LINE_WIDTH;
        [self.layer addSublayer:shapLayer];
        
        //渐变图层 渐变：RYUIColorWithRGB(140, 94, 0)   >>  RYUIColorWithRGB(229, 168, 46)   >>    RYUIColorWithRGB(140, 94, 0)
        CALayer * grain = [CALayer layer];
        [self.layer addSublayer:grain];
        //我们是两种渐变色，所以我么要用一个grain 对象将两个渐变图层放到一起。
        CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(-PROGRESS_LINE_WIDTH, -PROGRESS_LINE_WIDTH, frame.size.width/2+PROGRESS_LINE_WIDTH*2, frame.size.height+PROGRESS_LINE_WIDTH*2);
        [gradientLayer setColors:[NSArray arrayWithObjects:
                                  (id)[RYUIColorWithRGB(140, 94, 0) CGColor],
                                  (id)[RYUIColorWithRGB(229, 168, 46) CGColor], nil]];// 颜色分配
        [gradientLayer setLocations:@[@0.1,@0.9]];// 颜色分割线
        [gradientLayer setStartPoint:CGPointMake(0.05, 1)];// 起始点
        [gradientLayer setEndPoint:CGPointMake(0.9, 0)]; // 结束点
        [grain addSublayer:gradientLayer];
        
        
        CAGradientLayer * gradientLayer1 = [CAGradientLayer layer];
        gradientLayer1.frame = CGRectMake(self.bounds.size.width/2-PROGRESS_LINE_WIDTH, -PROGRESS_LINE_WIDTH, frame.size.width/2+PROGRESS_LINE_WIDTH*2, frame.size.height+PROGRESS_LINE_WIDTH*2);
        [gradientLayer1 setColors:[NSArray arrayWithObjects:
                                   (id)[RYUIColorWithRGB(229, 168, 46) CGColor],
                                   (id)[RYUIColorWithRGB(140, 94, 0) CGColor], nil]];// 颜色分配
        [gradientLayer1 setLocations:@[@0.3,@1]];// 颜色分割线
        [gradientLayer1 setStartPoint:CGPointMake(0.9, 0.05)];// 起始点
        [gradientLayer1 setEndPoint:CGPointMake(1, 1)];// 结束点
        [grain addSublayer:gradientLayer1];
        
        //设置遮罩层:
        //进度layer
        _progressLayer = [CAShapeLayer layer];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.path = path.CGPath;
        _progressLayer.strokeColor = [UIColor blueColor].CGColor;
        _progressLayer.fillColor = [[UIColor clearColor] CGColor];
        _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
        _progressLayer.strokeEnd = 0.f;
        grain.mask = _progressLayer;//设置遮盖层
        
        _progressLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 30, 10)];
        _progressLab.textColor = KWhiteColor;
        
        _progressLab.font = [UIFont fontWithName:@"DIN-Bold" size:14];
        [self addSubview:_progressLab];
        
    }
    return self;
}

-(void)setProgress:(float)progress
{
    [self startAninationWithPro:progress];
    _progressLab.text = [NSString stringWithFormat:@"%.1f",progress];
}

-(void)startAninationWithPro:(CGFloat)pro
{
    //增加动画
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3;
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:pro];
    pathAnimation.autoreverses=NO;
    
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = 1;
    [_progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}

@end
