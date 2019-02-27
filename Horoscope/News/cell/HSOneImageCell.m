
//
//  HSOneImageCell.m
//  horoscope2018
//
//  Created by 杰刘 on 2018/4/9.
//  Copyright © 2018年 Horoscope 2018 Group. All rights reserved.
//

#import "HSOneImageCell.h"

#define cellScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define cellScreenHeight 60

@implementation HSOneImageCell
    
    -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 28, KScreenWidth - 148, 85)];
            self.titleLabel.numberOfLines = 0;
            self.titleLabel.font = [UIFont fontWithName:@"DIN-Medium" size:15];
            self.titleLabel.textColor = KWhiteColor;
            self.titleLabel.text = @"These 4 Zodiac Signs Play Hard To Get The Most, So Don’t Give Up";
            [self addSubview:self.titleLabel];
            
            self.headimageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 105, 28, 85, 85)];
            self.headimageView.backgroundColor = [UIColor grayColor];
            [self addSubview:self.headimageView];
            
//            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, CGRectGetMaxY(self.titleLabel.frame) +14, cellScreenWidth - 34, 16.5)];
//            self.timeLabel.font = [UIFont fontWithName:@"DIN-Bold" size:12];
//            self.timeLabel.textColor = KWhiteColor;
//            self.timeLabel.textColor = RGBA(153, 153, 153, 1);
//            self.timeLabel.text = @"2018-04-03 10:23";
//            [self addSubview:self.timeLabel];
            
            UILabel * line = [[UILabel alloc] initWithFrame:CGRectMake(20, 136, KScreenWidth - 40, 0.5)];
            line.backgroundColor = RGB(53, 53, 53);
            [self addSubview:line];
            
            
        }
        
        return self;
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
