//
//  HqralcetProblemCell.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/19.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HqralcetProblemCell.h"

@implementation HqralcetProblemCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.bgimageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth/2 - 279/2, 15, 279, 37)];
//        self.bgimageView.backgroundColor = RGBA(255, 106, 106, 0.1);
        [self addSubview:self.bgimageView];
        
        self.problemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bgimageView.frame.size.width, self.bgimageView.frame.size.height)];
        self.problemLabel.numberOfLines = 0;
        self.problemLabel.font = [UIFont fontWithName:@"DIN-Medium" size:14];
        self.problemLabel.textAlignment = NSTextAlignmentCenter;
        self.problemLabel.textColor = KWhiteColor;
        self.problemLabel.text = @"These 4 Zodiac Signs Play Hard To Get The Most, So Don’t Give Up";
        [self.bgimageView addSubview:self.problemLabel];
        
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
