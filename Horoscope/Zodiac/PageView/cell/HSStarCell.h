//
//  HSStarCell.h
//  horoscope2018
//
//  Created by 杰刘 on 2017/12/14.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHStarRateView.h"
@interface HSStarCell : UITableViewCell
/**
 星星控件
 */
@property (nonatomic,strong) XHStarRateView *starRateView;

@property (nonatomic,strong) NSDictionary * data;

@end
