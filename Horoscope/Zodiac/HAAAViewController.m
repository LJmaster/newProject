//
//  HAAAViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HAAAViewController.h"
#import "HabbViewController.h"
#import "SGPagingView.h"
#import "PersonalCenterTableView.h"
#import "HSDetailChildViewController.h"
#import "AFNetworking.h"
#import "UIButton+ImageTitle.h"
#import "HSTraitsViewController.h"
#import "HSelectHoroscopeViewController.h"
#import "HEmoteViewController.h"

@interface HAAAViewController ()<SGPageTitleViewDelegate, SGPageContentCollectionViewDelegate,UITableViewDelegate,UITableViewDataSource,PersonalCenterChildBaseVCDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) HNameNavView  * navView;

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentCollectionView *pageContentView;
@property (nonatomic, strong) PersonalCenterTableView * ptableView;
@property (nonatomic, strong) UIScrollView *childVCScrollView;
@property (nonatomic, strong) UIView  * topView;


@property (nonatomic,assign) CGFloat  EarthImageViewHeight;
@end

@implementation HAAAViewController


#define PersonalCenterVCNavHeight kstatusBarH + 50
static CGFloat const PersonalCenterVCPageTitleViewHeight = 44;
static CGFloat const PersonalCenterVCTopViewHeight = 215;


//static CGFloat const PersonalCenterVCPageTitleViewHeight = 40;
//#define PersonalCenterVCTopViewHeight 215
//#define PersonalCenterVCNavHeight kstatusBarH + 74

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    隐藏系统的NaviBar
    [self hidenNaviBar];
//    状态栏
    self.StatusBarStyle = UIStatusBarStyleDefault;
}

// 懒加载自定义头部标题
-(HNameNavView *)navView{
    if (!_navView) {
        _navView = [[HNameNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 50)];
        _navView.title = @"My Zodiac";
        
         HUser *samePeople = [[HUserManager shareManager] readWithUser];
        if (samePeople.Br_Date == nil) {
             NSLog(@"用户 不配 过生日");
        }else{
             NSLog(@"用户的生日%@",samePeople.horoscope);
        }

       NSDictionary * dict = [[HSelectHoroscopeViewModel shareManager] heavenlyNameWithItem:samePeople.horoscopeInt];
        
        _navView.buttonimage = [UIImage imageNamed:[dict objectForKey:@"icon"]];
        [_navView.backButton addTarget:self action:@selector(selecthoroscope:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _navView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBgImage];

    [self.view addSubview:self.navView];
    self.EarthImageViewHeight = KScreenWidth - 100;
    
    [self foundTableView];
}

- (void)foundTableView {
    CGFloat tableViewX = 0;
    CGFloat tableViewY = PersonalCenterVCNavHeight;
    CGFloat tableViewW = self.view.frame.size.width;
    CGFloat tableViewH = KScreenHeight - PersonalCenterVCNavHeight - kBottomSafeHeight - kTabBarHeight;
    self.ptableView = [[PersonalCenterTableView alloc] initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH) style:(UITableViewStylePlain)];
    _ptableView.delegate = self;
    _ptableView.dataSource = self;
    [_ptableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _ptableView.backgroundColor = [UIColor clearColor];
    _ptableView.tableHeaderView = self.topView;
    _ptableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _ptableView.sectionHeaderHeight = PersonalCenterVCPageTitleViewHeight;
    _ptableView.rowHeight = self.view.frame.size.height - PersonalCenterVCPageTitleViewHeight;
    _ptableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.ptableView];
}


#pragma mark
#pragma mark - - - scrollDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.childVCScrollView && _childVCScrollView.contentOffset.y > 0) {
        self.ptableView.contentOffset = CGPointMake(0, PersonalCenterVCTopViewHeight);
    }
    CGFloat offSetY = scrollView.contentOffset.y;
    if (offSetY < PersonalCenterVCTopViewHeight) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pageTitleViewToTop" object:nil];
    }

}
#pragma mark
#pragma mark - - - Delegate
- (void)personalCenterChildBaseVCScrollViewDidScroll:(UIScrollView *)scrollView {
    self.childVCScrollView = scrollView;
    if (self.ptableView.contentOffset.y < PersonalCenterVCTopViewHeight) {
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
    } else {
        self.ptableView.contentOffset = CGPointMake(0, PersonalCenterVCTopViewHeight);
        scrollView.showsVerticalScrollIndicator = YES;
    }
}
#pragma mark
#pragma mark - - - tabbleDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.contentView addSubview:self.pageContentView];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.pageTitleView;
}
#pragma mark
#pragma mark - - - SGPageTitleViewDelegate - SGPageContentViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageContentCollectionViewCurrentIndex:selectedIndex];
}

-(void)pageContentCollectionView:(SGPageContentCollectionView *)pageContentCollectionView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

#pragma mark
#pragma mark - - - action
//返回选择星座页面
-(void)selecthoroscope:(UIButton *)sender{
    HSelectHoroscopeViewController * HoroscopeVC = [HSelectHoroscopeViewController new];
    [self presentViewController:HoroscopeVC animated:YES completion:nil];
}
-(void)emojiTapGes:(UITapGestureRecognizer *)ges{
    HEmoteViewController * emojiVC = [[HEmoteViewController alloc] init];
//    [self presentViewController:emojiVC animated:YES completion:nil];
    [self.navigationController pushViewController:emojiVC animated:YES];
    
}


#pragma mark
#pragma mark - - - gettting


- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, KScreenWidth, PersonalCenterVCTopViewHeight)];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, _topView.frame.size.width - 30, _topView.frame.size.height)];
         imageView.image = [UIImage imageNamed:@"btnEmoji"];
        [_topView addSubview:imageView];
        
        UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emojiTapGes:)];
        [_topView addGestureRecognizer:tapGes];
        
    }
    return _topView;
}
- (SGPageTitleView *)pageTitleView {
    if (!_pageTitleView) {
        NSArray *titleArr = @[@"Traits    ", @"Today    ", @"Tommrrow    ",@"7 Days    ",@"30 Days    "];
        SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
        configure.indicatorStyle = SGIndicatorStyleFixed;
        configure.indicatorCornerRadius = 4;
        configure.indicatorBorderWidth = 30;
        configure.showBottomSeparator = NO;
        configure.indicatorAdditionalWidth = 30;
        configure.indicatorHeight = 4;
        configure.titleFont = [UIFont fontWithName:@"DIN-Medium" size:17];
        configure.titleColor = RGBA(255, 255, 255, 0.6);
        configure.titleSelectedColor = RGBA(101, 151, 240, 1);
        configure.indicatorColor = RGBA(101, 151, 240, 1);
        /// pageTitleView
        _pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, PersonalCenterVCPageTitleViewHeight) delegate:self titleNames:titleArr configure:configure];
        _pageTitleView.selectedIndex = 0;
        _pageTitleView.backgroundColor = [UIColor clearColor];
    }
    return _pageTitleView;
}
- (SGPageContentCollectionView *)pageContentView {
    if (!_pageContentView) {
        HSTraitsViewController *oneVC = [[HSTraitsViewController alloc] init];
        oneVC.horoscopeName =self.horoscopeName;
        oneVC.delegatePersonalCenterChildBaseVC = self;
        HSDetailChildViewController *twoVC = [[HSDetailChildViewController alloc] init];
        twoVC.type = @"Today";
        twoVC.horoscopeName = self.horoscopeName;
        twoVC.delegatePersonalCenterChildBaseVC = self;
        HSDetailChildViewController *threeVC = [[HSDetailChildViewController alloc] init];
        threeVC.type = @"Tommrrow";
        threeVC.horoscopeName = self.horoscopeName;
        threeVC.delegatePersonalCenterChildBaseVC = self;
        HSDetailChildViewController *fourVC = [[HSDetailChildViewController alloc] init];
        fourVC.type = @"Week";
        fourVC.horoscopeName = self.horoscopeName;
        fourVC.delegatePersonalCenterChildBaseVC = self;
        HSDetailChildViewController *fiveVC = [[HSDetailChildViewController alloc] init];
        fiveVC.type = @"Month";
        fiveVC.horoscopeName = self.horoscopeName;
        fiveVC.delegatePersonalCenterChildBaseVC = self;
        NSArray *childArr = @[oneVC, twoVC, threeVC,fourVC,fiveVC];
        /// pageContentView
        CGFloat contentViewHeight = self.view.frame.size.height - PersonalCenterVCNavHeight - PersonalCenterVCPageTitleViewHeight;
        _pageContentView = [[SGPageContentCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childArr];
        _pageContentView.delegatePageContentCollectionView = self;
    }
    return _pageContentView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
