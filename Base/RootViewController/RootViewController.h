//
//  ViewController.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+HiddeNav.h"
/**
 VC 基类
 */
@interface RootViewController : UIViewController

/**
 *  修改状态栏颜色
 */
@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

///**
// 懒加载tableView
// */
//@property (nonatomic, strong) UITableView * tableView;
///**
// 懒加载collectionView
// */
//@property (nonatomic, strong) UICollectionView * collectionView;


/**
 隐藏nnavi  需要在 viewWillAppear  使用
 */
-(void)hidenNaviBar;
/**
 透明nnavi  需要在 viewWillAppear  使用
 */
-(void)navBarClearColor;

/**
 *  显示没有数据页面
 */
-(void)showNoDataImage;

/**
 *  移除无数据页面
 */
-(void)removeNoDataImage;
/**
 *  设置背景图片
 */
-(void)setBgImage;
/**
 *  停止加载
 */
- (void)stopLoadingAnimation;


/**
 *  默认返回按钮的点击事件，默认是返回，子类可重写
 */
- (void)backBtnClicked;

//取消网络请求
- (void)cancelRequest;

-(void)ActivityShareImage:(UIImage *)shareImage;

@end
