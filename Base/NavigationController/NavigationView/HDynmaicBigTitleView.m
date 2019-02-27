//
//  HDynmaicBigTitleView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HDynmaicBigTitleView.h"


@implementation HDynmaicBigTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.detailTitleLabel];

        [self addSubview:self.bigTitleLabel];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.bigImageView];
    
}

-(UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bigTitleLabel.frame) + 10, 0, 40, 40)];
        _bigImageView.centerY = self.bigTitleLabel.centerY;
//        _bigImageView.image = [UIImage imageNamed:@"planet_01new"];
        _bigImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bigImageView;
}

- (UILabel *)bigTitleLabel{
    if (!_bigTitleLabel) {
        _bigTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_detailTitleLabel.frame) + 10, self.frame.size.width - 150, 28)];
        _bigTitleLabel.font = [UIFont boldSystemFontOfSize:28];
        _bigTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return _bigTitleLabel;
}
- (UILabel *)detailTitleLabel{
    if (!_detailTitleLabel) {
        _detailTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, KScreenWidth - 150, 12)];
        _detailTitleLabel.font = [UIFont systemFontOfSize:14];
        _detailTitleLabel.textColor = [UIColor grayColor];
        [self addSubview:_detailTitleLabel];
    }
    return _detailTitleLabel;
}



@end
