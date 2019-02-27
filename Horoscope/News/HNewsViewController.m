//
//  HNewsViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/12.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HNewsViewController.h"
#import "SGPagingView.h"
#import "HNewsPageViewController.h"

@interface HNewsViewController ()<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;
@property (nonatomic,strong) HNameNavView  * navView;

@end

@implementation HNewsViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KMainColor;
    // Do any additional setup after loading the view.
    [self.view addSubview:self.navView];
//    [self setupPageView];
    [self gettitlecategor];
}


-(HNameNavView *)navView{
    if (!_navView) {
        _navView = [[HNameNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 50)];
        _navView.title = @"News";
    }
    return _navView;
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView index:(NSInteger)index {
    /// 说明：在此获取标题or当前子控制器下标值
    NSLog(@"index - - %ld", index);
}
//获取网络数据
-(void)gettitlecategor{
    
    NSString * urlStr = [NSString stringWithFormat:@"%@/%@?version=%@&platform=%d&app_id=%@",URL_main,URL_newcategory,@"1.0",2,@"com.paper.spacewalk"];
    [PPNetworkHelper GET:urlStr parameters:nil success:^(id responseObject) {
//        数据解析 ，获取对应的分类名字
        NSDictionary * titleDict = (NSDictionary *)responseObject;
        NSArray *  categoryarray = [titleDict objectForKey:@"data"];
        NSMutableArray *titleArr = [NSMutableArray array];
        for (NSDictionary * dict in categoryarray) {
            [titleArr addObject:[dict objectForKey:@"category"]];
        }
//        设置title
        CGFloat pageTitleViewY = CGRectGetMaxY(self.navView.frame);
        SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
        configure.indicatorStyle = SGIndicatorStyleFixed;
        configure.indicatorCornerRadius = 4;
        configure.indicatorBorderWidth = 100;
        configure.titleAdditionalWidth = 40;
        configure.showBottomSeparator = NO;
        configure.indicatorAdditionalWidth = 100;
        configure.indicatorHeight = 4;
        configure.titleFont = [UIFont fontWithName:@"DIN-Medium" size:17];
        configure.titleColor = RGBA(255, 255, 255, 0.6);
        configure.titleSelectedColor = RGBA(101, 151, 240, 1);
        configure.indicatorColor = RGBA(101, 151, 240, 1);
        
        self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
        [self.view addSubview:self.pageTitleView];
        self.pageTitleView.selectedIndex = 1;
        self.pageTitleView.backgroundColor = KClearColor;
        
        NSMutableArray *childArr = [[NSMutableArray alloc] init];
        for (NSString * title in titleArr) {
            HNewsPageViewController *pageVC = [[HNewsPageViewController alloc] init];
            pageVC.type = title;
            [childArr addObject:pageVC];
        }

        /// pageContentScrollView
        CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(self.pageTitleView.frame);
        self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childArr];
        self.pageContentScrollView.delegatePageContentScrollView = self;
        [self.view addSubview:self.pageContentScrollView];
        
        
    } failure:^(NSError *error) {
        
    }];
}

@end
