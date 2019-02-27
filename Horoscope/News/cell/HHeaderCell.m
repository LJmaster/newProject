//
//  HHeaderCell.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/13.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HHeaderCell.h"

@implementation HHeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        
        self.headimageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 8, KScreenWidth - 40, 188)];
        self.headimageView.backgroundColor = RGBA(255, 106, 106, 0.1);
        [self addSubview:self.headimageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 122, self.headimageView.frame.size.width - 40, 46)];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont fontWithName:@"DIN-Bold" size:18];
        self.titleLabel.textColor = KWhiteColor;
        self.titleLabel.text = @"These 4 Zodiac Signs Play Hard To Get The Most, So Don’t Give Up";
        [self.headimageView addSubview:self.titleLabel];

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
