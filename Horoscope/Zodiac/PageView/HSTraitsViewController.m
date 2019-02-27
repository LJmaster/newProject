//
//  HSTraitsViewController.m
//  horoscope2018
//
//  Created by 杰刘 on 2017/12/20.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSTraitsViewController.h"
#import "HGeneralTextViewCell.h"
#import "HSStarCell.h"
#import "HProgressCell.h"


@interface HSTraitsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * ttableview;

@end

@implementation HSTraitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(55, 59, 71, 1);
    
    self.ttableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - 120 - 30) style:(UITableViewStylePlain)];
    self.ttableview.dataSource = self;
    self.ttableview.delegate  = self;
    self.ttableview.backgroundColor = KClearColor;
    self.ttableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.ttableview];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell;
    
    if (indexPath.row == 0) {
        static NSString * indexpathString = @"cell_text";
        cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[HGeneralTextViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
        HGeneralTextViewCell * textCell = (HGeneralTextViewCell *)cell;
        textCell.contentLabel.text = @"Financial matters are under favorable stars at the moment and if you make an effort to do something new on the work Financial matters are under.on the work Financial matters are undern.";
    }else if (indexPath.row == 1) {
        static NSString * indexpathString = @"cell_start";
        cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[HSStarCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
    }else{
        static NSString * indexpathString = @"cell_progress";
        cell = [tableView dequeueReusableCellWithIdentifier:indexpathString];
        if (!cell) {
            cell = [[HProgressCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:indexpathString];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = KClearColor;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    预缓存cell的高度
        return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    动态计算告诉
    if (indexPath.row == 0) {
       return  [HGeneralTextViewCell moreHeight:@"Financial matters are under favorable stars at the moment and if you make an effort to do something new on the work Financial matters are under.on the work Financial matters are undern."];
    }else if (indexPath.row == 1) {
        return  65;
    }else{
        return  130;
    }

}



@end
