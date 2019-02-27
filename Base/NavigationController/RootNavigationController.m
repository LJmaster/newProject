
//
//  RootNavigationController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,weak) UIViewController* currentShowVC;
@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    if (@available(iOS 11.0, *)) {
//        // 版本适配
//        [UINavigationBar appearance].prefersLargeTitles = YES;
//        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
//    }
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
//    [UINavigationBar appearance].barStyle = UIBarStyleDefault;
//    [UINavigationBar appearance].translucent = NO;
//    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
}


//push时隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
            viewController.hidesBottomBarWhenPushed = NO;
            viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ( gestureRecognizer == self.interactivePopGestureRecognizer )
    {
//        UIViewController *vc = self.viewControllers.lastObject;
        //  禁用某些不支持侧滑返回的页面
//        if ([vc isKindOfClass:[ class]]) {
//            return NO;
//        }
        //  禁用根目录的侧滑手势
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        if (gestureRecognizer.state != UIGestureRecognizerStatePossible) {
            return YES;
        }
    }
    return NO;
}

@end
