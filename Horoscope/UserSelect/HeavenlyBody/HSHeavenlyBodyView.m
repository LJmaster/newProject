//
//  HSHeavenlyBodyView.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSHeavenlyBodyView.h"
#import "HSHeavenlyBodyFlowLayout.h"
#import "HSHeavenlyBodyDataModel.h"
#import "HSHeavenlyBodyCell.h"
//#import <Masonry.h>

#define KImageCount 12 // 图片个数
#define KSectionCount 3 // 组数
#define KHeavenlyMoveDistance [UIScreen mainScreen].bounds.size.width//星球移动的距离
#define KCompassMoveDistance ([UIScreen mainScreen].bounds.size.width/7)//星座移动的距离
@interface HSHeavenlyBodyView () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@end

static NSString *heavenlybodyCellID = @"heavenlybodyCellID";//星球重用标识
@implementation HSHeavenlyBodyView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //加载星球图片
    [self loadHeavenlyBodyImagesData];
    //星球轮播视图
    [self setupheavenlyBodyColleciton];

}

-(void)heavenlyUpdateCurrentlySelectedWithIndexpath:(NSIndexPath *)indexpath{
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}
#pragma mark - 加载星球图片数据
- (void)loadHeavenlyBodyImagesData {
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"HeavenlyBodyData.plist" withExtension:nil]];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    [dictArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arrM addObject:[HSHeavenlyBodyDataModel heavenlyBodyListWithDict:obj]];
    }];
    _heavenlyBodyImageNameData = arrM.copy;
}

#pragma mark -星球轮转图
- (void)setupheavenlyBodyColleciton{
    // 1.创建自定义布局对象
    HSHeavenlyBodyFlowLayout *flowLayout = [[HSHeavenlyBodyFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc]  initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    [self addSubview:collectionView];
    collectionView.backgroundColor = [UIColor clearColor];
    [self bringSubviewToFront:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"HSHeavenlyBodyCell" bundle:nil] forCellWithReuseIdentifier:heavenlybodyCellID];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    //一启动默认就滚动到中间这一组的第0个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:KSectionCount / 2];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    _collectionView = collectionView;
}

#pragma mark -无限轮播内部
#pragma mark - 手动拖得并且完全停下来会调用此方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 计算总共滚动到第几页了
    NSInteger previousCellCount = _collectionView.contentOffset.x / _collectionView.bounds.size.width ;
    // 计算界面上当前显示cell的组的索引
    NSInteger section = previousCellCount / _heavenlyBodyImageNameData.count;
    // 计算界面上当前显示cell的item的索引
    NSInteger item = previousCellCount % _heavenlyBodyImageNameData.count;
    // 如果当前界面滚动的cell还是在中间这一组什么也不做,直接跳出此方法
    if (section != KSectionCount / 2){
        // 不在中间这一组就让它悄悄回到中间这一组,回中间组的第几个Item?
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForItem:item inSection:KSectionCount / 2];
        [_collectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:item inSection:section];
    //代理方法传值
    [self.delegate changeHeavenlyItem:item];
    [self.delegate changeHeavenlyIndexpath:currentIndexPath];
    
        
}
#pragma mark - 不是手动的会调用此方法
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSInteger previousCellCount = _collectionView.contentOffset.x / _collectionView.bounds.size.width;
    NSInteger section = previousCellCount / _heavenlyBodyImageNameData.count;
    NSInteger item = previousCellCount % _heavenlyBodyImageNameData.count;
    if (section != KSectionCount / 2){
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForItem:item inSection:KSectionCount / 2];
        [_collectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    
}






#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return KSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _heavenlyBodyImageNameData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HSHeavenlyBodyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:heavenlybodyCellID forIndexPath:indexPath];
    cell.heavenlyBodyDataModel = _heavenlyBodyImageNameData[indexPath.item];
    return cell;
}

#pragma mark -点击不同星座cell刷新下面的数据
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void)dealloc{
    // 移除当前所有通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
