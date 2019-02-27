//
//  HQralceViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/19.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HQralceViewController.h"
#import "HNameNavView.h"
#import "HqralcetProblemCell.h"
#import "AnimationLabel.h"//文字动画
@interface HQralceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * qralcetabeview;
@property(nonatomic,strong)HNameNavView * navView;
@property(nonatomic,strong)UIButton * startQralceButton;//开始神域按钮
@property(nonatomic,strong)NSArray *problemArray;//问题数据
@property (nonatomic, strong) AnimationLabel *animationLabel;//文字动画效果
@end

@implementation HQralceViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}

-(NSArray *)problemArray{
    
    if (!_problemArray) {
        _problemArray = [[NSArray alloc] initWithObjects:
                         @"Will I get money today?",
                         @"Should I start new project today?",
                         @"Should I create a deposit today?",
                         @"Will I be happy with love today?", nil];
    }
    return _problemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.navView];
    
    CGFloat qralcehw = 175;
    self.startQralceButton = [[BaseView baseShare] creatButtonFrame:CGRectMake(KScreenWidth/2 - qralcehw/2, KScreenHeight - kBottomSafeHeight -kTabBarHeight - 35-qralcehw, qralcehw, qralcehw)
                                                    withimageOrtext:@"btnqralce"
                                                    withrootView:self.view
                                                         withtarget:self withaction:@selector(clickStartQralceTest:)];
    
    
    self.qralcetabeview =[[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame) + 40, KScreenWidth, KScreenHeight) style:(UITableViewStylePlain)] ;
    self.qralcetabeview.delegate = self;
    self.qralcetabeview.dataSource = self;
    self.qralcetabeview.backgroundColor = KClearColor;
    self.qralcetabeview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.qralcetabeview];
    
}

// 懒加载自定义头部标题
-(HNameNavView *)navView{
    if (!_navView) {
        _navView = [[HNameNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 50)];
        _navView.title = @"QRALCE";
        _navView.buttonimage = [UIImage imageNamed:@"btnAries"];
        [_navView.backButton addTarget:self action:@selector(selecthoroscope:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _navView;
}
-(void)cgrectanimationLabel{
    self.animationLabel = [[AnimationLabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 175) / 2,
                                                                       CGRectGetMaxY(self.startQralceButton.frame) - 70,
                                                                       175.f,
                                                                       20.f)];
    self.animationLabel.textAlignment = NSTextAlignmentCenter;
    self.animationLabel.font = [UIFont fontWithName:@"DIN-Medium" size:14];
    self.animationLabel.textColor = [UIColor redColor];
    self.animationLabel.text = @"Will I be happy with love today?";
//    self.animationLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.animationLabel];
    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.animationLabel.x = (self.view.frame.size.width - 175) / 2;
//        self.animationLabel.width = 175;
//    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.animationLabel removeFromSuperview];
    });
}

-(void)selecthoroscope:(UIButton *)sender{
  
}
-(void)clickStartQralceTest:(UIButton *)sender{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.problemArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell;
    static NSString * indexpathString = @"problemqralcet_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
    if (!cell) {
        cell = [[HqralcetProblemCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
    }
    
    HqralcetProblemCell * pcell = (HqralcetProblemCell*)cell;
    pcell.problemLabel.text = self.problemArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = KClearColor;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 61;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == self.problemArray.count - 1) {
    
        [self cgrectanimationLabel];
    }
}
@end
