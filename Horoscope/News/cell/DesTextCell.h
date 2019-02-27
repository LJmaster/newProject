//
//  DesTextCell.h
//  NowTest
//
//  Created by 杰刘 on 2018/4/12.
//  Copyright © 2018年 刘杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DesTextCell : UITableViewCell

@property (nonatomic,strong) UILabel     * titleLabel;

@property (nonatomic,strong) NSDictionary * dict;

+ (CGFloat)moreHeight:(NSDictionary *)dict;

@end
