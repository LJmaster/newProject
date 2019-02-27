//
//  HSThreeImageCell.h
//  horoscope2018
//
//  Created by 杰刘 on 2018/4/9.
//  Copyright © 2018年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSThreeImageCell : UITableViewCell
    
    @property (nonatomic,strong) UILabel * titleLabel;
    
    @property (nonatomic,strong) UILabel * timeLabel;
    
    @property (nonatomic,strong) UIImageView * headimage1View;
    @property (nonatomic,strong) UIImageView * headimage2View;
    @property (nonatomic,strong) UIImageView * headimage3View;

@end
