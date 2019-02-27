//
//  HHoroscopeMatchView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HHoroscopeMatchView.h"

@implementation HHoroscopeMatchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.lefthoroscopIImage = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth/2 - 126, 0, 65, 65)];
        self.lefthoroscopIImage.image = [UIImage imageNamed:@"iconGemini"];
        [self addSubview:self.lefthoroscopIImage];
        
        
        self.lefthoroscopIcon = [[BaseView baseShare] creatImageViewFrame:CGRectMake(
                                                                                     CGRectGetMinX(self.lefthoroscopIImage.frame),
                                                                                     CGRectGetMaxY(self.lefthoroscopIImage.frame) + 7,
                                                                                     17, 17)
                                                                withImage:@"zodiac_01" withrootView:self];
        
        self.lefthoroscopName = [[BaseView baseShare] creatLabelFrame:CGRectMake(
                                                                                 CGRectGetMaxX(self.lefthoroscopIcon.frame) + 2.8,
                                                                                 CGRectGetMaxY(self.lefthoroscopIImage.frame) + 7,
                                                                                 80, 17)
                                                             withtext:@"Aries"
                                                         withrootView:self
                                                         fontWithName:@"DIN-Bold" size:14];
        self.lefthoroscopName.textColor = KWhiteColor;
        
        
        
        
        self.righthoroscopIImage = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth/2 + 61, 0, 65, 65)];
        self.righthoroscopIImage.image = [UIImage imageNamed:@"iconTaurus"];
        [self addSubview:self.righthoroscopIImage];
        
        self.righthoroscopIcon = [[BaseView baseShare] creatImageViewFrame:CGRectMake(
                                                                                     CGRectGetMinX(self.righthoroscopIImage.frame),
                                                                                     CGRectGetMaxY(self.righthoroscopIImage.frame) + 7,
                                                                                     17, 17)
                                                                withImage:@"zodiac_01" withrootView:self];
        
        self.righthoroscopName = [[BaseView baseShare] creatLabelFrame:CGRectMake(
                                                                                 CGRectGetMaxX(self.righthoroscopIcon.frame) + 2.8,
                                                                                 CGRectGetMaxY(self.righthoroscopIImage.frame) + 7,
                                                                                 80, 17)
                                                             withtext:@"Aries"
                                                         withrootView:self
                                                         fontWithName:@"DIN-Bold" size:14];
        self.righthoroscopName.textColor = KWhiteColor;
    }
    return self;
}




@end
