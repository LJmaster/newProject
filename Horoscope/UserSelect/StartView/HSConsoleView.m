//
//  HSConsoleView.m
//  horoscope2018
//
//  Created by 刘杰 on 2019/1/9.
//  Copyright © 2019 Horoscope 2018 Group. All rights reserved.
//

#import "HSConsoleView.h"
#import "UtilsMacros.h"

@implementation HSConsoleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.detailLabel];
        [self addSubview:self.personalBtn];
        [self addSubview:self.startNowBtn];
    }
    return self;
}

-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(37.5, 0, self.frame.size.width - 75, 37)];
        _detailLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        _detailLabel.textColor = RGBA(255, 255, 255, 0.5);
        _detailLabel.text = @"Enter your details and we will tailor more matching forecasts for you.";
        _detailLabel.numberOfLines = 2;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}
-(UIButton *)personalBtn{
    if (!_personalBtn) {
        _personalBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.detailLabel.frame) + 10, KScreenWidth, 50)];
        [_personalBtn setImage:[UIImage imageNamed:@"btnPt"] forState:(UIControlStateNormal)];
        _personalBtn.layer.shadowColor = RGB(0, 0, 0).CGColor;
        _personalBtn.layer.shadowOpacity = 0.27;
        _personalBtn.layer.shadowOffset = CGSizeMake(5,5);
        _personalBtn.layer.shadowRadius = 9;
    }
    return _personalBtn;
}
-(UIButton *)startNowBtn{
    if (!_startNowBtn) {
        CGFloat h;
        if (KScreenHeight < 667) {
            if (KScreenHeight < 568) {
                h =5;
            }else{
                h = 15;
            }
        }else{
            h = 26;
        }
        _startNowBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.personalBtn.frame) + h, KScreenWidth, 50)];
        [_startNowBtn setImage:[UIImage imageNamed:@"btSkip"] forState:(UIControlStateNormal)];
        _startNowBtn.layer.shadowColor = RGB(0, 0, 0).CGColor;
        _startNowBtn.layer.shadowOpacity = 0.27;
        _startNowBtn.layer.shadowOffset = CGSizeMake(5,5);
        _startNowBtn.layer.shadowRadius = 9;
       
    }
    return _startNowBtn;
}

-(UILabel *)nikeLabel{
    if (!_nikeLabel) {
        _nikeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 37, self.frame.size.width, 37)];
        _nikeLabel.font = [UIFont fontWithName:@"ARJULIAN" size:15];
        _nikeLabel.textColor = RGB( 70, 187 ,119);
        _nikeLabel.text = @"hello word";
        _nikeLabel.numberOfLines = 2;
        _nikeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nikeLabel;
}

-(void)refreshUI{
    
    [self.detailLabel removeFromSuperview];
    
    [self.personalBtn removeFromSuperview];
    
    [self addSubview:self.nikeLabel];
    self.nikeLabel.text = @"Welcome Moric";
    
    [UIView animateWithDuration:0.5 animations:^{
        self.startNowBtn.y  = CGRectGetMaxY(self.nikeLabel.frame) + 20;
    }];

}
@end
