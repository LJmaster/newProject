//
//  PersonalCenterTableView.m
//  SGPageViewExample
//
//  Created by apple on 2017/12/14.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "PersonalCenterTableView.h"

@implementation PersonalCenterTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}


@end
