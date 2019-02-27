
//
//  HSThreeImageCell.m
//  horoscope2018
//
//  Created by 杰刘 on 2018/4/9.
//  Copyright © 2018年 Horoscope 2018 Group. All rights reserved.
//

#import "HSThreeImageCell.h"

#define cellScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define cellScreenHeight 60

@implementation HSThreeImageCell
    
    
    -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 14, cellScreenWidth - 34, 52)];
            self.titleLabel.numberOfLines = 0;
            self.titleLabel.font = [UIFont fontWithName:@"DIN-Bold" size:18];
            self.titleLabel.textColor = KWhiteColor;
            self.titleLabel.text = @"This Is What Each Zodiac Sign Should Look Forword To In April";
            [self addSubview:self.titleLabel];
            
            CGFloat w = (cellScreenWidth - 5 - 34)/3 ;
            
            self.headimage1View = [[UIImageView alloc] initWithFrame:CGRectMake(17, CGRectGetMaxY(self.titleLabel.frame) + 9, w, 84)];
            self.headimage1View.backgroundColor = [UIColor grayColor];
            [self addSubview:self.headimage1View];
            
            self.headimage2View = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headimage1View.frame) + 2.5, CGRectGetMaxY(self.titleLabel.frame) + 9, w, 84)];
            self.headimage2View.backgroundColor = [UIColor grayColor];
            [self addSubview:self.headimage2View];
            
            self.headimage3View = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headimage2View.frame) + 2.5, CGRectGetMaxY(self.titleLabel.frame) + 9, w, 84)];
            self.headimage3View.backgroundColor = [UIColor grayColor];
            [self addSubview:self.headimage3View];
            
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, CGRectGetMaxY(self.headimage3View.frame) +14, cellScreenWidth - 34, 16.5)];
            self.timeLabel.font = [UIFont fontWithName:@"DIN-Bold" size:12];
            self.timeLabel.textColor = KWhiteColor;
            self.timeLabel.textColor = RGBA(153, 153, 153, 1);
            self.timeLabel.text = @"2018-04-03 10:23";
            [self addSubview:self.timeLabel];
            
            UILabel * line = [[UILabel alloc] initWithFrame:CGRectMake(16.5, CGRectGetMaxY(self.timeLabel.frame) + 10, cellScreenWidth - 33, 0.5)];
            line.backgroundColor = RGB(234, 234, 234);
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
