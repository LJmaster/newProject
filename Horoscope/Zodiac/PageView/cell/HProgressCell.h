//
//  HProgressCell.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJProgressView;
NS_ASSUME_NONNULL_BEGIN

@interface HProgressCell : UITableViewCell

@property (nonatomic,strong)LJProgressView * progressView;
@property (nonatomic,strong) NSDictionary * data;

@end

NS_ASSUME_NONNULL_END
