//
//  RootTabBarController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "RootTabBarController.h"
#import "HAAAViewController.h"
#import "HBBBViewController.h"
#import "HQralceViewController.h"
#import "HEmoteViewController.h"
#import "RootNavigationController.h"
#import "HNewsViewController.h"

@interface RootTabBarController ()
@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC
@end

@implementation RootTabBarController

- (void)viewDidLoad {
//    [super viewDidLoad];
//    UIView * view = [[UIView alloc] init];
//    view.backgroundColor = RGBA(255, 106, 106, 0.1);
//    view.frame = self.tabBar.bounds;
//    [[UITabBar appearance] insertSubview:view atIndex:0];
    
    [[UITabBar appearance] setBarTintColor:RGBA(48, 37, 41, 1)];
    [UITabBar appearance].translucent = NO;
    
    //添加子控制器
    [self setUpAllChildViewController];
}

#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    _VCS = @[].mutableCopy;
    //    HomeViewController *homeVC = [[HomeViewController alloc]init];
    //    WaterFallListViewController *homeVC = [WaterFallListViewController new];
    HAAAViewController *homeVC = [[HAAAViewController alloc]init];
    [self setupChildViewController:homeVC title:@"" imageName:@"iconZodiacGrayExport" seleceImageName:@"iconZodiacExport"];
    
    HBBBViewController *makeFriendVC = [[HBBBViewController alloc]init];
    [self setupChildViewController:makeFriendVC title:@"" imageName:@"iconComGrayExport" seleceImageName:@"iconComExport"];
    
    HQralceViewController *QralceVC = [[HQralceViewController alloc]init];
    [self setupChildViewController:QralceVC title:@"" imageName:@"iconQralceGrayExport" seleceImageName:@"iconQralceExport"];
    
    HNewsViewController *mineVC = [[HNewsViewController alloc]init];
    [self setupChildViewController:mineVC title:@"" imageName:@"iconNewsGrayExport" seleceImageName:@"iconNewsExport"];
    self.viewControllers = _VCS;
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    //    controller.title = title;
    
    
    controller.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //设置图片的渲染模式为原图original，然后在赋给tabBarItem
    UIImage * image = [UIImage imageNamed:selectImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = image;
    
    //    controller.tabBarItem.badgeValue = _VCS.count%2==0 ? @"100": @"1";
    //包装导航控制器
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
    controller.title = title;
    [_VCS addObject:nav];
    
}

@end
