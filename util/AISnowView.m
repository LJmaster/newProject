//
//  AISnowView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/2.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AISnowView.h"

@interface AISnowView ()

@property(nonatomic,strong)CAEmitterLayer *emitter;
/** 发射器cell*/
@property(nonatomic,strong)CAEmitterCell *emitterCell;
@end

@implementation AISnowView

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
        
        self.emitterCell.contents        = (__bridge id _Nullable)([UIImage imageNamed:@"star_flying.png"].CGImage);//cell的内容。通常是一个指针CGImageRef。*
        self.emitterCell.birthRate       = 1;//每秒生成多少个粒子 *
        self.emitterCell.lifetime        = 10;//粒子存活的时间,以秒为单位 *
        self.emitterCell.lifetimeRange   = 5;
        //上面两个属性如果只用了lifetime那么粒子的存活时间就是固定的，比如lifetime=10,那么粒子10s秒后就消失了。
        //如果使用了lifetimeRange，比如lifetimeRange=5，那么粒子的存活时间就是在5s~15s这个范围内消失。
        
        
        self.emitterCell.velocity        = 10;//粒子平均初始速度。正数表示竖直向上，负数竖直向下。 *
//        self.emitterCell.velocityRange   = 10;//可以再指定一个范围。 *
        //上面两个属性同lifetime和lifetimeRange
        
        self.emitterCell.emissionRange   = M_PI;//发射范围
        self.emitterCell.emissionLongitude  = M_PI;//以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
        
//        self.emitterCell.yAcceleration   = 0;//y轴速度
//        self.emitterCell.xAcceleration   = 0;//x轴速度 数值越大越快
//        self.emitterCell.zAcceleration   = 0;
        
        self.emitterCell.spin            = 2;//粒子的平均旋转速度 *
        
//        self.emitterCell.scale           = 0.5;//比例 数值越大越小
//        self.emitterCell.scaleRange      = .25;//刻度范围
//        self.emitterCell.scaleSpeed      = -.08;//规模速度 数值越大越小
        
//        self.emitterCell.alphaRange      = .5;//阿尔法范围
//        self.emitterCell.alphaSpeed      = -.05;//阿尔法速度
        
        
        
//        self.emitter     = [[CAEmitterLayer alloc]init];
//        self.emitterCell = [CAEmitterCell emitterCell];
//        self.emitter.emitterPosition = CGPointMake(100, self.bounds.size.height*5);//发射器位置
//        self.emitter.emitterSize     = self.bounds.size;
//        self.emitter.emitterShape    = kCAEmitterLayerRectangle;
//        self.emitterCell.contents        = (__bridge id _Nullable)([UIImage imageNamed:@"snowflake1.png"].CGImage);
//        self.emitterCell.birthRate       = 3;//密度
//        self.emitterCell.lifetime        = 20.5;//消失时间 数值越大消失越慢
//
//        self.emitterCell.color           = [UIColor whiteColor].CGColor;
//        self.emitterCell.redRange        = 0.;
//        self.emitterCell.blueRange       = 0.;
//        self.emitterCell.greenRange      = 0.;
//
//        self.emitterCell.velocity        = 10.;//发射速度 数值越小越慢
//        self.emitterCell.velocityRange   = 350;//偏移角度
//        self.emitterCell.emissionRange   = M_PI_2;//发射范围
//        self.emitterCell.emissionLongitude  = -M_PI;//发射经度
//        self.emitterCell.yAcceleration   = 0;//y轴速度
//        self.emitterCell.xAcceleration   = .0001;//x轴速度 数值越大越快
//        self.emitterCell.scale           = 0.13;//比例 数值越大越小
//        self.emitterCell.scaleRange      = .25;//刻度范围
//        self.emitterCell.scaleSpeed      = -.08;//规模速度 数值越大越小
//        self.emitterCell.alphaRange      = .5;//阿尔法范围
//        self.emitterCell.alphaSpeed      = -.05;//阿尔法速度
        

//        self.emitterCell.birthRate       = 5;//密度
//        self.emitterCell.lifetime        = 10.5;//消失时间

//        self.emitterCell.velocity        = 100.;//速度
//        self.emitterCell.velocityRange   = 350;//偏移角度
//        self.emitterCell.emissionRange   = M_PI_2;
//        self.emitterCell.emissionLongitude  = -M_PI;
//        self.emitterCell.yAcceleration   = 0;//y轴速度
//        self.emitterCell.xAcceleration   = 10;//x轴速度
//        self.emitterCell.scale           = .33;//比例
//        self.emitterCell.scaleRange      = 1.25;//刻度范围
//        self.emitterCell.scaleSpeed      = -.25;//规模速度
//        self.emitterCell.alphaRange      = .5;//阿尔法范围
//        self.emitterCell.alphaSpeed      = -.15;//阿尔法速度
        
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
