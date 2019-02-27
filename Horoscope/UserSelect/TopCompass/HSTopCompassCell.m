//
//  HSTopCompassCell.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/16.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSTopCompassCell.h"
#import "HSTopCompassDataModel.h"

@interface HSTopCompassCell ()

@end
@implementation HSTopCompassCell

- (void)setTopCompassDataModel:(HSTopCompassDataModel *)topCompassDataModel{
    _topCompassDataModel = topCompassDataModel;
    
    _xinZuoImgView.image = [UIImage imageNamed:topCompassDataModel.icon];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
