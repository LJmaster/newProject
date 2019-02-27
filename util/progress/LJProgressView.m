//
//  LJProgressView.m
//  NowTest
//
//  Created by heiheihei on 2017/11/18.
//  Copyright © 2017年 heiheihei. All rights reserved.
//

#import "LJProgressView.h"
#import "UtilsMacros.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
@interface LJProgressView ()

@property (nonatomic, strong) CALayer *bgLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;


@end

@implementation LJProgressView


 #pragma mark -
 #pragma mark - GET ---> view
 
 - (CALayer *)bgLayer {
 if (!_bgLayer) {
 _bgLayer = [CALayer layer];
 //一般不用frame，因为不支持隐式动画
 _bgLayer.bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
 _bgLayer.anchorPoint = CGPointMake(0, 0);
 _bgLayer.backgroundColor = self.bgProgressColor.CGColor;
 _bgLayer.cornerRadius = self.frame.size.height / 2.;
 [self.layer addSublayer:_bgLayer];
 }
 return _bgLayer;
 }
- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.bounds = CGRectMake(0, 0, self.frame.size.width * self.progress, self.frame.size.height);
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 0);
        _gradientLayer.anchorPoint = CGPointMake(0, 0);
        NSArray *colorArr = self.colorArr;
        _gradientLayer.colors = colorArr;
        _gradientLayer.cornerRadius = self.frame.size.height / 2.;
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

#pragma mark -
#pragma mark - SET ---> data

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self updateView];
}

- (void)setColorArr:(NSArray *)colorArr {
    if (colorArr.count >= 2) {
        _colorArr = colorArr;
        [self updateView];
    }else {
        
    }
}

#pragma mark -
#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
        [self simulateViewDidLoad];
        self.colorArr = @[(id)RGB(252, 244, 77).CGColor,(id)RGB(252, 93, 59).CGColor];
        self.progress = 0.65;
    }
    return self;
}

- (void)simulateViewDidLoad {
    [self addSubViewTree];
}

- (void)config {
    self.bgProgressColor = RGB(230., 244., 245.);
}

- (void)addSubViewTree {
    [self bgLayer];
    [self gradientLayer];
}

- (void)updateView {
    self.gradientLayer.bounds = CGRectMake(0, 0, self.frame.size.width * self.progress, self.frame.size.height);
    self.gradientLayer.colors = self.colorArr;
}

@end
