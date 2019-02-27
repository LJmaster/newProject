
//
//  HNameNavView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/12.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HNameNavView.h"

#define statusBar_height  ([[UIApplication sharedApplication] statusBarFrame].size.height)

@implementation HNameNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        self.backButton.frame = CGRectMake(KScreenWidth - 57, statusBar_height + 15, 37, 37);
        [self addSubview:self.nameTitleLabel];
    }
    return self;
}

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        UIColor *color = [UIColor orangeColor];
        [_backButton setTintColor:color];
        [_backButton setTitleColor:color forState:UIControlStateNormal];
        [_backButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
        
        [self addSubview:_backButton];
    }
    return _backButton;
}

- (UILabel *)nameTitleLabel
{
    if (!_nameTitleLabel) {
        _nameTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, statusBar_height + 16, KScreenWidth - 87, 34)];
        _nameTitleLabel.font = [UIFont fontWithName:@"Nissan" size:24];
        _nameTitleLabel.textColor = [UIColor whiteColor];
        
    }
    return _nameTitleLabel;
}


-(void)setTitle:(NSString *)title{
    _nameTitleLabel.text = title;
}

//-(void)setBackImage:(UIImage *)backImage{
//    [_backButton setImage:backImage forState:UIControlStateNormal];
//}
-(void)setTextcolor:(UIColor *)textcolor{
    _nameTitleLabel.textColor = textcolor;
}
-(void)setButtonimage:(UIImage *)buttonimage{
    [self.backButton setImage:buttonimage forState:(UIControlStateNormal)];
}
-(void)setButtontitle:(NSString *)buttontitle{
    [self.backButton setTitle:buttontitle forState:(UIControlStateNormal)];
}
@end
