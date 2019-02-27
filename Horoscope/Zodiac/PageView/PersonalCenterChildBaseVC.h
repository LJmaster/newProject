//
//  PersonalCenterChildBaseVC.h
//  SGPageViewExample
//
//  Created by 杰刘 on 2017/12/14.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PersonalCenterChildBaseVCDelegate <NSObject>

- (void)personalCenterChildBaseVCScrollViewDidScroll:(UIScrollView *)scrollView;

@end

@interface PersonalCenterChildBaseVC : UIViewController
@property (nonatomic, weak) id<PersonalCenterChildBaseVCDelegate> delegatePersonalCenterChildBaseVC;
@end
