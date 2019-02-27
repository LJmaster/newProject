//
//  HNewsDetailViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HNewsDetailViewController.h"
#import "DesimageCell.h"
#import "DesTextCell.h"
#import "HNewsViewModel.h"

@interface HNewsDetailViewController ()<UITableViewDelegate,UITableViewDataSource,NewsViewModelDelegate>

@property(nonatomic,strong)UITableView * tableViewDes;

//头部数据
@property(nonatomic,strong)UIImageView * headimageView;
@property(nonatomic,strong)UILabel * tltlabel;
//尾部
@property(nonatomic,strong)UIView * footview;
@property(nonatomic,strong)HNewsViewModel * viewmodel;


/**展示数据*/
@property(nonatomic,strong)NSMutableArray * desArray;
//相关新闻
@property(nonatomic,strong)NSMutableArray * relatedArray;
@end

@implementation HNewsDetailViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self navBarClearColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBgImage];
    
    self.viewmodel = [[HNewsViewModel alloc] init];
    self.viewmodel.delegate = self;
    [self.viewmodel getnewsDetail:self.hnew_category withnews_id:self.hnew_id];

    self.desArray = [[NSMutableArray alloc] init];
    self.relatedArray = [[NSMutableArray alloc] init];
    
    [self setUI];
    
    // Do any additional setup after loading the view.
}

#pragma mark ---- 创建UI
-(void)setUI{
    self.tableViewDes = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableViewDes];
    self.tableViewDes.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableViewDes.delegate = self;
    self.tableViewDes.dataSource = self;
    /**头标题 ----- 试图*/
    
    // 计算文本高度
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont fontWithName:@"ARJULIAN" size:24]};
//    NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
//    CGSize size = [[self.dataDict objectForKey:@"title"] boundingRectWithSize:CGSizeMake(KScreenWidth - 34, 10000) options:option attributes:attribute context:nil].size;
    
    UIView * headview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 318)];
    self.headimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 210)];
    self.headimageView.backgroundColor = [UIColor grayColor];
    self.headimageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headimageView.layer.masksToBounds = YES;
    [headview addSubview:self.headimageView];
    
    self.tltlabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.headimageView.frame) + 24, KScreenWidth - 40, 46)];
    self.tltlabel.font = [UIFont fontWithName:@"DIN-Bold" size:18];
    self.tltlabel.numberOfLines = 0;
    [headview addSubview:self.tltlabel];
    
    UILabel * timelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.tltlabel.frame) + 12, KScreenWidth - 34, 16)];
    timelabel.font = [UIFont fontWithName:@"DIN-Medium" size:16];
    timelabel.textColor = RGBA(165, 165, 165, 1);
    [headview addSubview:timelabel];
    
    self.tableViewDes.tableHeaderView = headview;
    
    self.footview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 190)];
    self.tableViewDes.tableFooterView = self.footview;
}


-(void)creatRelatedUI:(NSMutableArray *)relatedar{
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, self.footview.frame.size.height)];
    demoContainerView.contentSize = CGSizeMake(20 + (320 * relatedar.count), self.footview.frame.size.height);
    [self.footview addSubview:demoContainerView];
    for (int i = 0; i < relatedar.count; i++) {
        NSDictionary *dict = relatedar[i];
        
        UIView * bcview = [[UIView alloc] initWithFrame:CGRectMake(20 + 320*i , 0, 300, 107)];
        bcview.backgroundColor = RGB(65, 65, 65);
        
        UILabel * titleLael = [[BaseView baseShare] creatLabelFrame:CGRectMake(12, 15, 155, 73) withtext:[dict objectForKey:@"title"] withrootView:bcview fontWithName:@"DIN-Medium" size:14];
        titleLael.textColor = KWhiteColor;
        
        UIImageView * imagev = [[BaseView baseShare] creatImageViewFrame:CGRectMake(bcview.frame.size.width - 102, 8.5, 90, 90) withImage:@"" withrootView:bcview];
        [imagev sd_setImageWithURL:[dict objectForKey:@"image"]];
        imagev.contentMode = UIViewContentModeScaleAspectFill;
        imagev.layer.masksToBounds = YES;
        
        [demoContainerView addSubview:bcview];
    }
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.desArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell;
    NSDictionary * dict = self.desArray[indexPath.row];
    if ([[dict objectForKey:@"type"] isEqualToString:@"text"]) {
        static NSString * indexpathString = @"articlescelltext";
        cell = [self.tableViewDes dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[DesTextCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
        DesTextCell * textcell = (DesTextCell *)cell;
        textcell.dict = dict;
    }
    if ([[dict objectForKey:@"type"] isEqualToString:@"image"]) {
        static NSString * indexpathString = @"articlescelloimage";
        cell = [self.tableViewDes dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[DesimageCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
        DesimageCell * imagecell = (DesimageCell *)cell;
        imagecell.dict = dict;

    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dict = self.desArray[indexPath.row];
    if ([[dict objectForKey:@"type"] isEqualToString:@"text"]) {
        return [DesTextCell moreHeight:dict];
    }else{
        return 170;
    }
}
#pragma mark ------------------    渐变显示
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offsety = scrollView.contentOffset.y;
//    if (offsety > 200 ) {
//        CGFloat aa = offsety/300.00;
//        _bcView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_zodiac-1"]];
//        _bcView.bcImageView.alpha = aa;
//    }else{
//        _bcView.backgroundColor = [UIColor clearColor];
//        _bcView.bcImageView.alpha = 0;
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --------  网络代理

- (void)requestSuccess:(id)responseObject withrcode:(NSInteger)code{
    
    NSDictionary * responsedict = (NSDictionary *)responseObject;
    NSString * responsecode = [NSString stringWithFormat:@"%@",[responsedict objectForKey:@"code"]];
    if ([responsecode isEqualToString:@"0"]) {
       
        NSDictionary * datarr = [responsedict objectForKey:@"data"];
        
        NSArray * listArr = [datarr objectForKey:@"content"];
        [self.desArray addObjectsFromArray:listArr];
        
        NSArray * relArr = [datarr objectForKey:@"related"];
        [self.relatedArray addObjectsFromArray:relArr];
        
        [self.headimageView sd_setImageWithURL:[NSURL URLWithString:[datarr objectForKey:@"image"]]
                              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        self.tltlabel.text = [datarr objectForKey:@"title"];
    }else{
        
        
    }
    
    
    [self creatRelatedUI:self.relatedArray];
    [self.tableViewDes reloadData];
//    NSLog(@"======== %@",responseObject);
}
- (void)requestError:(NSError *)error withrcode:(NSInteger)code{
    
    
}





@end
