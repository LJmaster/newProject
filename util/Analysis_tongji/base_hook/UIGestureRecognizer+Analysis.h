//
//  UIGestureRecognizer+Analysis.h
//  Swizzling-Demo
//
//  Created by 刘杰 on 2019/1/28.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Analysis)

@property(nonatomic,copy)NSString * methodName;

@end

NS_ASSUME_NONNULL_END
