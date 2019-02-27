//
//  HMatchDetailViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HMatchDetailViewController.h"
#import "HTPolygonCell.h"
#import "HTitleTextCell.h"
#import "LJCircleProgressView.h"

@interface HMatchDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * matchtableview;
@property (nonatomic, strong) UIView  * topView;
@property (nonatomic, strong) LJCircleProgressView  * cycle;

@end

@implementation HMatchDetailViewController

//+ (UIImage *)imageWithColor:(UIColor *)color {
//    return [self imageWithColor:color size:CGSizeMake(1, 1)];
//}
//
//+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
//    if (!color || size.width <= 0 || size.height <= 0) return nil;
//    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, color.CGColor);
//    CGContextFillRect(context, rect);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self navBarClearColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KMainColor;
    
//    if (@available(iOS 11.0, *)) {
//        // 作用于指定的UIScrollView
//        self.matchtableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
    

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.translucent = NO;
   
    
    self.matchtableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:(UITableViewStylePlain)];
    self.matchtableview.dataSource = self;
    self.matchtableview.delegate  = self;
    self.matchtableview.backgroundColor = KClearColor;
    self.matchtableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.matchtableview.tableHeaderView = self.topView;
    [self.view addSubview:self.matchtableview];
}


- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, KScreenWidth , 60+kstatusBarH + 44)];
        UILabel * namelabel =  [[BaseView baseShare] creatLabelFrame:CGRectMake(20, 10 +kstatusBarH + 44, 100, 34)
                                     withtext:@"RESULT"
                                 withrootView:_topView
                                 fontWithName:@"DIN-Medium" size:24];
        namelabel.textColor = KWhiteColor;
        
        
        self.cycle = [[LJCircleProgressView alloc]initWithFrame:CGRectMake(KScreenWidth - 70, kstatusBarH + 40, 50, 50)];
        [_topView addSubview:self.cycle];
        self.cycle.progress = 0.5;
        
    }
    return _topView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell;
    if (indexPath.row == 0) {
        static NSString * indexpathString = @"cell_Polygon";
        cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[HTPolygonCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
    }else{
        static NSString * indexpathString = @"cell_titletext";
        cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[HTitleTextCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
    }
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = KClearColor;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    预缓存cell的高度
    return 210;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    动态计算告诉
    if (indexPath.row == 0) {
        return  KScreenWidth - 160 + 20;
    }else{
        return  210;
    }
    
}


@end
