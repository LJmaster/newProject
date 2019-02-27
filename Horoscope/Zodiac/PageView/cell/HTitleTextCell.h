//
//  HTitleTextCell.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTitleTextCell : UITableViewCell

@property(nonatomic,strong) UILabel * titleLabel;
@property(nonatomic,strong) UILabel * contentLabel;

//动态计算cell的高度
+ (CGFloat)moreHeight:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
