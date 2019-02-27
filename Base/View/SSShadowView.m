//
//  SSShadowView.m
//  SafeTy
//
//  Created by 刘杰 on 2018/8/30.
//  Copyright © 2018年 maker. All rights reserved.
//

#import "SSShadowView.h"

@implementation SSShadowView

-(instancetype)initWithFrame:(CGRect)frame shadowColor:(UIColor*)shadowColor cornerRadius:(CGFloat)cornerRadius{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //v.layer.masksToBounds=YES;这行去掉
        self.layer.cornerRadius = cornerRadius;
        self.layer.shadowColor = shadowColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(2, 2);
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowRadius = 5;
    }
    return self;
}

@end
