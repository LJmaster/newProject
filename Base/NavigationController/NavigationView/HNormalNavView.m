
//
//  HNormalNavView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HNormalNavView.h"

#define statusBar_height  ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define nav_normal_height 44

@interface HNormalNavView ()



@end

@implementation HNormalNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        [self addSubview:self.backButton];
        [self addSubview:self.smallTitleLabel];
        
        self.backButton.frame = CGRectMake(7, statusBar_height, 60, 36);
        self.smallTitleLabel.frame = CGRectMake(0, statusBar_height + 5, 100, 30);
        self.smallTitleLabel.centerX = self.centerX;
    }
    return self;
}
- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view{
    
    CGFloat headViewNormalHeight = statusBar_height + nav_normal_height;
    CGFloat bigTitleTop = 0;
    if (yOffset > 0 ) { //折叠。。。
        if (yOffset < headViewNormalHeight) {
            bigTitleTop = - yOffset;
        }else{
            bigTitleTop =   -headViewNormalHeight ;
            
        }
    }

    self.y = bigTitleTop;
    view.y =  CGRectGetMaxY(self.frame);
    view.height = KScreenHeight - CGRectGetMaxY(self.frame);
}
-(void)setNavViewAlpha:(CGFloat)navViewAlpha{
    
    self.smallTitleLabel.alpha = navViewAlpha;
}
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        UIColor *color = [UIColor orangeColor];
        [_backButton setTintColor:color];
        [_backButton setTitleColor:color forState:UIControlStateNormal];
        [_backButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_backButton setImage:[UIImage imageNamed:@"planet_10new11"] forState:UIControlStateNormal];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//左右方向，居左对齐
        _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    }
    return _backButton;
}

- (UILabel *)smallTitleLabel
{
    if (!_smallTitleLabel) {
        _smallTitleLabel = [UILabel new];
        _smallTitleLabel.font = [UIFont boldSystemFontOfSize:16];
        _smallTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _smallTitleLabel.textAlignment = NSTextAlignmentCenter;
        _smallTitleLabel.centerY = self.backButton.centerY;
        _smallTitleLabel.text = @"小标题";
    }
    return _smallTitleLabel;
}


-(void)setTitle:(NSString *)title{
    _title = title;
    _smallTitleLabel.text = title;
}
-(void)setBackStr:(NSString *)backStr{
     [_backButton setTitle:backStr forState:UIControlStateNormal];
}
-(void)setBackImage:(UIImage *)backImage{
    [_backButton setImage:backImage forState:UIControlStateNormal];
}

-(void)setRightView:(UIView *)rightView{
    _rightView = rightView;
    rightView.frame = CGRectMake(KScreenWidth - 50, statusBar_height, 36, 36);
    rightView.centerY = self.backButton.centerY;
    [self addSubview:rightView];
}


@end
