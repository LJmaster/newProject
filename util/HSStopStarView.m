//
//  HSStopStarView.m
//  horoscope2018
//
//  Created by 杰刘  on 2018/1/9.
//  Copyright © 2018年 Horoscope 2018 Group. All rights reserved.
//

#import "HSStopStarView.h"

@interface HSStopStarView ()

@property(nonatomic,strong)CAEmitterLayer *emitter;
/** 发射器cell*/
@property(nonatomic,strong)CAEmitterCell *emitterCell;
@end

@implementation HSStopStarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.emitter     = [[CAEmitterLayer alloc]init];//创建一个CAEmitterLayer *
        self.emitterCell = [CAEmitterCell emitterCell];//创建CAEmitterCell *
        
        self.emitter.emitterPosition = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);//指定发射源的位置 *
        self.emitter.emitterSize     = self.bounds.size;//指定发射源的大小 *
        //        self.emitter.emitterSize     = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2);//指定发射源的大小 *
        
        //指定发射源的形状 和 模式
        self.emitter.emitterShape    = kCAEmitterLayerRectangle;
        self.emitter.emitterMode     = kCAEmitterLayerSurface;
        
        self.emitterCell.contents        = (__bridge id _Nullable)([UIImage imageNamed:@"star_stop.png"].CGImage);//cell的内容。通常是一个指针CGImageRef。*
        self.emitterCell.birthRate       = 1;//每秒生成多少个粒子 *
        self.emitterCell.lifetime        = 10;//粒子存活的时间,以秒为单位 *
        self.emitterCell.lifetimeRange   = 5;
        //上面两个属性如果只用了lifetime那么粒子的存活时间就是固定的，比如lifetime=10,那么粒子10s秒后就消失了。
        //如果使用了lifetimeRange，比如lifetimeRange=5，那么粒子的存活时间就是在5s~15s这个范围内消失。
        
        
//        self.emitterCell.velocity        = 100;//粒子平均初始速度。正数表示竖直向上，负数竖直向下。 *
        //        self.emitterCell.velocityRange   = 10;//可以再指定一个范围。 *
        //上面两个属性同lifetime和lifetimeRange
        
        self.emitterCell.emissionRange   = M_PI;//发射范围
        self.emitterCell.emissionLongitude  = M_PI;//以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
        
        //        self.emitterCell.yAcceleration   = 0;//y轴速度
        //        self.emitterCell.xAcceleration   = 0;//x轴速度 数值越大越快
        //        self.emitterCell.zAcceleration   = 0;
        
        self.emitterCell.spin            = 2;//粒子的平均旋转速度 *
        
//                self.emitterCell.scale           = 0.5;//对象的初始缩放大小 *
                self.emitterCell.scaleRange      = .25;//对象的缩放扰动范围 *
                self.emitterCell.scaleSpeed      = -.08;//对象缩放的速度 *
        
                self.emitterCell.alphaRange      = .5;//对象的透明度扰动范围
                self.emitterCell.alphaSpeed      = -.08;//对象的透明度的变动速度
        
        
        
        
        self.emitter.emitterCells    = @[self.emitterCell];
        [self.layer addSublayer:self.emitter];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
}
+(Class)layerClass {
    return CAEmitterLayer.self;
}


@end


