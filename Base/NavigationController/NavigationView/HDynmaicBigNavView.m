//
//  HDynmaicBigNavView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HDynmaicBigNavView.h"


#define statusBar_height  ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define nav_normal_height 44
#define nav_expand_height 62

@interface HDynmaicBigNavView ()


@property (nonatomic, assign) CGFloat defaultBackButtonTitleWidth;
@property (nonatomic, assign) CGFloat statusBarHeight;
@property (nonatomic, assign) CGFloat navViewTotalHeight;
@property (nonatomic, assign) CGFloat bigTitleViewHeight;

@end

@implementation HDynmaicBigNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
        self.changebackgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)configSubviews
{
    self.statusBarHeight = statusBar_height;
    self.navViewTotalHeight = statusBar_height + nav_normal_height + nav_expand_height;//(导航条 44 底部导航拓展部分 62)
    self.bigTitleViewHeight = nav_expand_height;
    
    [self addSubview:self.navView];
    [self addSubview:self.bigTitleView];
    
}

- (void)dynamic_suspensionNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view
{
    CGFloat headViewNormalHeight  = statusBar_height + nav_normal_height;
    CGFloat smallTitleAlpha       = 0;
    CGFloat bigTitleTop           = self.navViewTotalHeight - self.bigTitleViewHeight;
    CGFloat viewy                 = CGRectGetMaxY(self.frame);
    CGFloat buttony               = self.bigTitleView.centerY;
    if (yOffset > 0 ) { //折叠。。。
        if (yOffset < headViewNormalHeight) {
            bigTitleTop = headViewNormalHeight - yOffset;
            viewy       = CGRectGetMaxY(self.bigTitleView.frame) < headViewNormalHeight ? headViewNormalHeight : CGRectGetMaxY(self.bigTitleView.frame);
            buttony     = (buttony - yOffset + 17) <= self.navView.centerY + 5 ?  self.navView.centerY  + 5 : buttony;
        }else{
            bigTitleTop     =  - self.bigTitleViewHeight;
            smallTitleAlpha = yOffset/self.bigTitleViewHeight;
            viewy           = headViewNormalHeight;
            buttony         = self.navView.centerY + 5;
        }
    }
    //    大标题的渐变（）
    self.navView.navViewAlpha = smallTitleAlpha;
    self.bigTitleView.y = bigTitleTop;
    //    右边按钮的位置变化
    self.titleRightView.centerY = buttony;
    //    滑动试图g跟随位置变化
    view.y =  viewy;
    view.height = KScreenHeight - viewy;
}
- (void)dynamic_allNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view{
    CGFloat headViewNormalHeight = statusBar_height + nav_normal_height + nav_expand_height;
    CGFloat bigTitleTop = 0;
    if (yOffset > 0 ) { //折叠。。。
        if (yOffset < headViewNormalHeight) {
            bigTitleTop = - yOffset;
        }else{
            bigTitleTop =   -headViewNormalHeight ;
        }
    }
    
    self.y = bigTitleTop;
    //    滑动试图g跟随位置变化
    view.y =  CGRectGetMaxY(self.frame);
    view.height = KScreenHeight - CGRectGetMaxY(self.frame) - kBottomSafeHeight - kTabBarHeight;
}

- (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(CGFloat)font{
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                     context:nil];
    return rect.size.width;
}


-(HNormalNavView *)navView{
    if (!_navView) {
        _navView = [[HNormalNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, nav_normal_height + statusBar_height)];
        _navView.navViewAlpha = 0;
    }
    return _navView;
}
- (HDynmaicBigTitleView *)bigTitleView
{
    if (!_bigTitleView) {
        _bigTitleView = [[HDynmaicBigTitleView alloc]initWithFrame:CGRectMake(0, nav_normal_height + statusBar_height, KScreenWidth, self.bigTitleViewHeight)];
    }
    return _bigTitleView;
}


// getting - setting
- (void)setBackButtonTitle:(NSString *)backButtonTitle
{
    if (!backButtonTitle) {
        backButtonTitle = @"";
        return;
    }
    _navView.backStr = backButtonTitle;
}
-(void)setBigTitle:(NSString *)bigTitle{
    _bigTitle = bigTitle;
    //    根据传入的文字动态计算宽度
    CGFloat w = [self getWidthWithText:bigTitle height:28 font:28];
    if (w >= KScreenWidth - 140) {
        self.bigTitleView.bigTitleLabel.width = KScreenWidth - 140;
    }else{
        self.bigTitleView.bigTitleLabel.width = w;
    }
    self.bigTitleView.bigTitleLabel.text = bigTitle;
    self.navView.title = self.bigTitle;
}

- (void)setTitleRightView:(UIView *)titleRightView{
    if (titleRightView != nil) {
        _titleRightView = titleRightView;
        _titleRightView.frame = CGRectMake(KScreenWidth - 50, 0, 36, 36);
        _titleRightView.centerY = self.bigTitleView.centerY;
        [self addSubview:_titleRightView];
    }
}

- (void)setDetaileTitle:(NSString *)detaileTitle{
    _detaileTitle = detaileTitle;
    self.bigTitleView.detailTitleLabel.text = detaileTitle;
}
-(void)setIsBackButtonHide:(BOOL)isBackButtonHide{
    [self.navView.backButton setHidden:isBackButtonHide];
}
-(void)setChangebackgroundColor:(UIColor *)changebackgroundColor{
    self.backgroundColor = changebackgroundColor;
    self.bigTitleView.backgroundColor = changebackgroundColor;
    self.navView.backgroundColor = changebackgroundColor;
}
-(void)setChangebackgroundImage:(UIImage *)changebackgroundImage{
    self.bigTitleView.backgroundColor = [UIColor clearColor];
    self.navView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor colorWithPatternImage:changebackgroundImage];
}
-(void)setTitleColor:(UIColor *)titleColor{
    if (titleColor != nil) {
        self.bigTitleView.bigTitleLabel.textColor = titleColor;
        self.navView.smallTitleLabel.textColor = titleColor;
    }
}
-(void)setDetaileTitleColor:(UIColor *)detaileTitleColor{
    if (detaileTitleColor != nil) {
       self.bigTitleView.detailTitleLabel.textColor = detaileTitleColor;
    }
}
@end
