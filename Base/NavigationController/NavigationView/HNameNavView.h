//
//  HNameNavView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/12.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNameNavView : UIView

@property (nonatomic, copy)   NSString * title;
@property (nonatomic, strong) UIColor  * textcolor;
@property (nonatomic, copy)   NSString * buttontitle;
@property (nonatomic, strong) UIImage  * buttonimage;
@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UILabel  * nameTitleLabel;

@end

NS_ASSUME_NONNULL_END
