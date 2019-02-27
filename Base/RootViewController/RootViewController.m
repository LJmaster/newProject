//
//  ViewController.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@property (nonatomic,strong) UIImageView* noDataView;

@end

@implementation RootViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return _StatusBarStyle;
}
//动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    _StatusBarStyle=StatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.StatusBarStyle = UIStatusBarStyleLightContent;
    
    
    if (@available(iOS 11.0, *)) {
        // 作用于指定的UIScrollView
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        // 作用与所有的UIScrollView
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    //设置代理即可
//
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


-(void)navBarClearColor{
    UIView * barBackground = self.navigationController.navigationBar.subviews.firstObject;
    if (@available(iOS 11.0, *))
    {
        barBackground.alpha = 0;
        [barBackground.subviews setValue:@(0) forKeyPath:@"alpha"];
    } else {
        barBackground.alpha = 0;
    }
    //
    //    [self.navigationController.navigationBar setBackgroundImage:[HMatchDetailViewController imageWithColor:KClearColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
#pragma mark ————— 跳转登录界面 —————



-(void)showNoDataImage{
    _noDataView=[[UIImageView alloc] init];
    [_noDataView setImage:[UIImage imageNamed:@"generl_nodata"]];
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [_noDataView setFrame:CGRectMake(0, 0,obj.frame.size.width, obj.frame.size.height)];
            [obj addSubview:_noDataView];
        }
    }];
}

-(void)removeNoDataImage{
    if (_noDataView) {
        [_noDataView removeFromSuperview];
        _noDataView = nil;
    }
}

-(void)hidenNaviBar{
//    此方法是配合 UIViewController+HiddeNav  使用，隐藏nav
    self.navigationController.delegate = self;
}
///**
// *  懒加载UITableView
// *
// *  @return UITableView
// */
//- (UITableView *)tableView
//{
//    if (_tableView == nil) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
//        //头部刷新
//        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
//        header.automaticallyChangeAlpha = YES;
//        header.lastUpdatedTimeLabel.hidden = NO;
//        _tableView.mj_header = header;
//
//        //底部刷新
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
//        _tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
//
//        _tableView.backgroundColor=CViewBgColor;
//        _tableView.scrollsToTop = YES;
//        //        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//        //        _tableView.separatorInset = UIEdgeInsetsMake(0, -10, 0, -10);//{top, left, bottom, right}
//        _tableView.tableFooterView = [[UIView alloc] init];
//    }
//    return _tableView;
//}
//
///**
// *  懒加载collectionView
// *
// *  @return collectionView
// */
//- (UICollectionView *)collectionView
//{
//    if (_collectionView == nil) {
//        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
//
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , KScreenHeight) collectionViewLayout:flow];
//
//        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
//        header.automaticallyChangeAlpha = YES;
//        header.lastUpdatedTimeLabel.hidden = NO;
//        _collectionView.mj_header = header;
//
//        //底部刷新
//        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
//        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
//        _collectionView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
//
//        _collectionView.backgroundColor=CViewBgColor;
//        _collectionView.scrollsToTop = YES;
//    }
//    return _collectionView;
//}
//-(void)headerRereshing{
//
//}
//
//-(void)footerRereshing{
//
//}



-(void)setBgImage{
    
   UIImageView * imagev = [[BaseView baseShare] creatImageViewFrame:self.view.bounds withImage:@"bgZodiac" withrootView:self.view];
    imagev.userInteractionEnabled = YES;
}

- (void)backBtnClicked
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



//取消请求
- (void)cancelRequest
{
    [PPNetworkHelper cancelAllRequest];
    
}

- (void)dealloc
{
    [self cancelRequest];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    // 默认进去类型
    return   UIInterfaceOrientationPortrait;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
