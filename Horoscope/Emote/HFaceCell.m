//
//  HFaceCell.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/18.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HFaceCell.h"

@implementation HFaceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.imageViewbg = [[BaseView baseShare] creatImageViewFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) withImage:@"" withrootView:self];
        [self addSubview:self.imageViewbg];
        self.imageView = [[BaseView baseShare] creatImageViewFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) withImage:@"" withrootView:self];
        [self addSubview:self.imageView];

        
    }
    return self;
}

@end
