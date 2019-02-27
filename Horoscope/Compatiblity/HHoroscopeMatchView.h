//
//  HHoroscopeMatchView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHoroscopeMatchView : UIView

@property(nonatomic,strong) UIImageView * lefthoroscopIImage;
@property(nonatomic,strong) UIImageView * lefthoroscopIcon;
@property(nonatomic,strong) UILabel     * lefthoroscopName;
@property(nonatomic,strong) UIImageView * righthoroscopIImage;
@property(nonatomic,strong) UIImageView * righthoroscopIcon;
@property(nonatomic,strong) UILabel     * righthoroscopName;

@end

NS_ASSUME_NONNULL_END
