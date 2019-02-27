//
//  HNewsDetailViewController.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "RootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNewsDetailViewController : RootViewController

@property(nonatomic,strong) NSDictionary * dataDict;
@property(nonatomic,strong) NSString   * hnew_id;
@property(nonatomic,strong) NSString   * hnew_category;

@end

NS_ASSUME_NONNULL_END
