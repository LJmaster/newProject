//
//  HSStarCell.m
//  horoscope2018
//
//  Created by 杰刘 on 2017/12/14.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//  overall  星星cell

#import "HSStarCell.h"


#define cellScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define cellScreenHeight 66

@implementation HSStarCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self markUI];
    }
    return self;
}

-(void)markUI{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(16, 20, 69, 25)];
    label.text = @"Overall";
    label.textColor = KWhiteColor;
    label.font = [UIFont fontWithName:@"DIN-Medium" size:21];
    [self addSubview:label];
    
    _starRateView = [[XHStarRateView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame) + 16, 20, cellScreenWidth - 240, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES delegate:nil];
    _starRateView.isAnimation = YES;
    _starRateView.userInteractionEnabled = NO;
//    _starRateView.currentScore = 3;
    [self addSubview:_starRateView];
}
- (void)layoutSubviews{
//    NSString * sss = [self.data objectForKey:@"starNum"];
    _starRateView.currentScore = 3;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
