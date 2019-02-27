
//
//  HNewsPageViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/12.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HNewsPageViewController.h"
#import "HNewsDetailViewController.h"
#import "HSOneImageCell.h"
#import "HSThreeImageCell.h"
#import "HHeaderCell.h"
#import "HNewsViewModel.h"
#import "SDCycleScrollView.h"

@interface HNewsPageViewController ()<UITableViewDelegate,UITableViewDataSource,NewsViewModelDelegate,SDCycleScrollViewDelegate>

@property(nonatomic,strong)UITableView * lisettabeview;

@property(nonatomic,strong) HNewsViewModel * articlesNetworking;
/**数据*/
@property (nonatomic,strong) NSMutableArray * listDataArray;
@property (nonatomic,strong) NSMutableArray * topDataArray;
@property (nonatomic,strong) NSMutableArray * topimageArray;
@property (nonatomic,strong) NSMutableArray * toptextArray;
/**上来加载记录page*/
@property (nonatomic,assign) int page_no;

@property (nonatomic,strong) SDCycleScrollView * cycleScrollView;


@end

@implementation HNewsPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KMainColor;
    
    self.articlesNetworking = [[HNewsViewModel alloc] init];
    self.articlesNetworking.delegate = self;
    
    self.listDataArray = [[NSMutableArray alloc] init];
    self.topDataArray = [[NSMutableArray alloc] init];
    self.topimageArray = [[NSMutableArray alloc] init];
    self.toptextArray = [[NSMutableArray alloc] init];
    self.page_no = 0;
    
    self.lisettabeview =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - kCustomizeBottomHeught - 44 - kCustomizeNaiHeight) style:(UITableViewStylePlain)] ;
    self.lisettabeview.delegate = self;
    self.lisettabeview.dataSource = self;
    self.lisettabeview.backgroundColor = KClearColor;
    self.lisettabeview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView * topview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    self.lisettabeview.tableHeaderView = topview;
    
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 200) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.cycleScrollView.showPageControl = NO;
    self.cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    self.cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    self.cycleScrollView.delegate = self;
    [topview addSubview:self.cycleScrollView];
    
    
    [self.view addSubview:self.lisettabeview];
    //头部刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = NO;
    self.lisettabeview.mj_header = header;
    [self.lisettabeview.mj_header beginRefreshing];
    
    if ([self.type isEqualToString:@"best_hots"] || [self.type isEqualToString:@"best_news"]) {
    }else{
        //底部刷新
        self.lisettabeview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
}
-(void)headerRereshing{
//    上啦刷新
    [self.articlesNetworking getnewsListCategortitle:self.type withPage:0 withRcode:0];
}
-(void)footerRereshing{
    self.page_no += 1;
    [self.articlesNetworking getnewsListCategortitle:self.type withPage:self.page_no withRcode:1];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listDataArray.count;
}
-(void)loadinggifimage:(UIImageView *)imageview imageStr:(NSString *)imsgeStr{
    NSString * url = imsgeStr;
    if ([[url substringFromIndex:url.length - 1] isEqualToString:@"4"]) {
        //2.匹配字符串
        NSString *str3 = [url stringByReplacingOccurrencesOfString:@"?fm=mp4" withString:@""];
        NSLog(@"截取的值为：%@",str3);
        [imageview sd_setImageWithURL:[NSURL URLWithString:str3]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }else{
        
        [imageview sd_setImageWithURL:[NSURL URLWithString:imsgeStr]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell;
    NSDictionary * dict = self.listDataArray[indexPath.row];
    
    static NSString * indexpathString = @"articlescell";
    cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
    if (cell == nil) {
        cell = [[HSOneImageCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
    }
    HSOneImageCell * threeCell = (HSOneImageCell *)cell;
    threeCell.titleLabel.text = [dict objectForKey:@"title"];
    [threeCell.headimageView sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:@"image"]]
                               placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = KClearColor;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return  137;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HNewsDetailViewController * dvc = [HNewsDetailViewController new];
    NSDictionary * dict = self.listDataArray[indexPath.row];
    dvc.hnew_category = self.type;
    dvc.hnew_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"news_id"]];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

#pragma mark --------  网络代理

- (void)requestSuccess:(id)responseObject withrcode:(NSInteger)code{
    [self.lisettabeview.mj_footer endRefreshing];
    [self.lisettabeview.mj_header endRefreshing];

    NSDictionary * dict = (NSDictionary *)responseObject;
    
    NSString * responsecode = [NSString stringWithFormat:@"%@",[dict objectForKey:@"code"]];
    if ([responsecode isEqualToString:@"0"]) {

        NSDictionary * data = [dict objectForKey:@"data"];
        if (code == 0) {
            [self.listDataArray removeAllObjects];
            [self.topDataArray removeAllObjects];
            [self.topimageArray removeAllObjects];
            [self.toptextArray removeAllObjects];
            NSArray * listArr = [data objectForKey:@"list"];
            [self.listDataArray addObjectsFromArray:listArr];
            
            NSArray * topArr = [data objectForKey:@"tops"];
            [self.topDataArray addObjectsFromArray:topArr];
            
                NSLog(@"我走了一次");
            
            for (NSDictionary * dict in self.topDataArray) {
                [self.topimageArray addObject:[dict objectForKey:@"image"]];
                [self.toptextArray addObject:[dict objectForKey:@"title"]];
            }
        }
        if (code == 1) {
            NSArray * otherArr = [data objectForKey:@"list"];
            [self.listDataArray addObjectsFromArray:otherArr];
        }
    }else{


    }

    self.cycleScrollView.titlesGroup = self.toptextArray;
    self.cycleScrollView.imageURLStringsGroup = self.topimageArray;
    
    [self.lisettabeview reloadData];
    
}
- (void)requestError:(NSError *)error withrcode:(NSInteger)code{
    [self.lisettabeview.mj_footer endRefreshing];
    [self.lisettabeview.mj_header endRefreshing];
}

#pragma mark --------  滑动代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    HNewsDetailViewController * dvc = [HNewsDetailViewController new];
    NSDictionary * dict = self.topDataArray[index];
    dvc.hnew_category = self.type;
    dvc.hnew_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"news_id"]];
    [self.navigationController pushViewController:dvc animated:YES];

}
@end
