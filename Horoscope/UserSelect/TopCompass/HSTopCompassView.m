//
//  HSTopCompassView.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/20.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSTopCompassView.h"
#import "HSTopCompassFlowLayout.h"
#import "HSTopCompassCell.h"
#import "HSTopCompassDataModel.h"
//#import <Masonry.h>
#import "UtilsMacros.h"

#define KImageCount 12 // 图片个数
#define KSectionCount 3// 组数
#define KHeavenlyMoveDistance [UIScreen mainScreen].bounds.size.width//星球移动的距离
#define KCompassMoveDistance ([UIScreen mainScreen].bounds.size.width/7)//星座移动的距离

@interface HSTopCompassView ()<UICollectionViewDelegate,UICollectionViewDataSource>
///星座轮控制器
@property (nonatomic, weak) UICollectionView *collectionView;
///顶部中心绿色视图
@property (nonatomic, weak) UIView *greenView;
@end

static NSString *cellID = @"cellID";//星座重用标识
@implementation HSTopCompassView

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

    //加载星座图标数据
    [self loadImagesData];
    //头部星座的轮播视图
    [self setupTopColleciton];
    //星座循环背景图片
    [self addSubview:self.compassBGImgView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //改变透明度
        [self calculateAlphaWithItem:0 andSection:1];
    });
}
//TODO: 星球跟星座接受改变  通知方法
-(void)compassUpdateCurrentlySelectedWithIndexpath:(NSIndexPath *)indexpath{
   [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}
#pragma mark -头部星座轮转图
- (void)setupTopColleciton{
    HSTopCompassFlowLayout *flowLayout = [[HSTopCompassFlowLayout alloc] init];
    //下面的控制器需要用约束
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 65) collectionViewLayout:flowLayout];
    [self addSubview:collectionView];
   
    //设置背景色为透明色
    collectionView.backgroundColor = [UIColor clearColor];
    [self bringSubviewToFront:collectionView];
    // 设置数据源和代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:@"HSTopCompassCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    // 隐藏滚动条
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    // 关闭弹簧
    collectionView.bounces = NO;
    
    //TODO:无限轮播
    // 尽量不要用,先用着,后面改点,让约束提前计算
    //        [self layoutIfNeeded];
    //     一启动默认就滚动到中间这一组的第0个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:KSectionCount / 2];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    //给collectionView设置代理
    collectionView.delegate = self;
    //限制滚动速度,快速减速
    collectionView.decelerationRate = .001;
    _collectionView = collectionView;
}

#pragma mark -无限轮播内部
#pragma mark - 手动拖得并且完全停下来会调用此方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    // 计算总共滚动到第几页了
    CGFloat distance =  scrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width / 2 ;
    NSInteger previousCellCount = distance / KCompassMoveDistance;
    // 计算界面上当前显示cell的组的索引
    NSInteger section = previousCellCount / _compassImageNameData.count;
    // 计算界面上当前显示cell的item的索引
    NSInteger item = previousCellCount % _compassImageNameData.count;
    
    if (section != KSectionCount / 2){
        // 不在中间这一组就让它悄悄回到中间这一组,回中间组的第几个Item?
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForItem:item inSection:KSectionCount / 2];
        [_collectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self calculateAlphaWithItem:item andSection:1];
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self calculateAlphaWithItem:item andSection:section];
        });
    }
    
    //监听滚动通知
    NSIndexPath *topCompassCurrentIndexPath = [NSIndexPath indexPathForRow:item inSection:section];    
    //TODO: 代理方法传值
    [self.delegate changeCompassItem:item];
    [self.delegate changeCompassIndexpath:topCompassCurrentIndexPath];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    CGFloat distance =  scrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width / 2 ;
    NSInteger previousCellCount = distance / KCompassMoveDistance;
    NSInteger section = previousCellCount / _compassImageNameData.count;
    NSInteger item = previousCellCount % _compassImageNameData.count;
    if (section != KSectionCount / 2){
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForItem:item inSection:KSectionCount / 2];
        [_collectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self calculateAlphaWithItem:item andSection:1];
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self calculateAlphaWithItem:item andSection:section];
        });
    }

}
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return KSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _compassImageNameData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
    HSTopCompassCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    //设置数据
    cell.topCompassDataModel = _compassImageNameData[indexPath.item];
    return cell;
}

#pragma mark -点击不同星座cell刷新下面的数据
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark -透明度渐变方法封装
- (void)calculateAlphaWithItem: (NSInteger )item andSection: (NSInteger )section;{

    //设置一下透明度
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection: section];
    // 中间的
    HSTopCompassCell * cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.xinZuoImgView.alpha = 1.0f;
    
    // 如果是第一个
    if (item == 0) {
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:11 inSection: section - 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:10 inSection: section - 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:9 inSection: section - 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item + 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:item + 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
    }else if (item == 1){
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:11 inSection: section - 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:10 inSection: section - 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item + 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:item + 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
    }else if (item == 2){
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:0 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:11 inSection: section - 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item + 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:item + 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
    }else if (item == 3){
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:0 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item + 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:item + 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
    }else if (item == 9){
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item - 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:item - 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:item - 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item + 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:0 inSection: section + 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
    }else if (item == 11){
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item - 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:item - 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:item - 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item - 11 inSection: section + 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item - 10 inSection: section + 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:item - 9 inSection: section + 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
    }else if (item == 10){
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item - 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:item - 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:item - 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section ];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:0 inSection: section + 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:1 inSection: section + 1];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
    }else{
        //左边第一个
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item - 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //左边第二个
        indexPath = [NSIndexPath indexPathForItem:item - 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //左边第三个
        indexPath = [NSIndexPath indexPathForItem:item - 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
        
        //右边第一个
        indexPath = [NSIndexPath indexPathForItem:item + 1 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.4f;
        
        //右边第二个
        indexPath = [NSIndexPath indexPathForItem:item + 2 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.3f;
        
        //右边第三个
        indexPath = [NSIndexPath indexPathForItem:item + 3 inSection: section];
        cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.xinZuoImgView.alpha = 0.2f;
    }
}

#pragma mark -正在滚动中的透明度计算
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // 计算总共滚动到第几页了
    CGFloat distance =  scrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width / 2 ;
    NSInteger previousCellCount = distance / KCompassMoveDistance;
    // 计算界面上当前显示cell的组的索引
    NSInteger section = previousCellCount / _compassImageNameData.count;
    // 计算界面上当前显示cell的item的索引
    NSInteger item = previousCellCount % _compassImageNameData.count;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection: section];
    // 中间的
    HSTopCompassCell * cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.xinZuoImgView.alpha = 1.0f;

    //左边第一个
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForItem:item - 1 inSection: section];
    cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath2];
    cell.xinZuoImgView.alpha = 0.4f;
    
    //左边第二个
    indexPath2 = [NSIndexPath indexPathForItem:item - 2 inSection: section];
    cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath2];
    cell.xinZuoImgView.alpha = 0.3f;
    
    //左边第三个
    indexPath2 = [NSIndexPath indexPathForItem:item - 3 inSection: section];
    cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath2];
    cell.xinZuoImgView.alpha = 0.2f;
    
    //右边第一个
    indexPath2 = [NSIndexPath indexPathForItem:item + 1 inSection: section];
    cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath2];
    cell.xinZuoImgView.alpha = 0.4f;
    
    //右边第二个
    indexPath2 = [NSIndexPath indexPathForItem:item + 2 inSection: section];
    cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath2];
    cell.xinZuoImgView.alpha = 0.3f;
    
    //右边第三个
    indexPath2 = [NSIndexPath indexPathForItem:item + 3 inSection: section];
    cell =(HSTopCompassCell *)[self.collectionView cellForItemAtIndexPath:indexPath2];
    cell.xinZuoImgView.alpha = 0.2f;
}

#pragma mark -加载星座图片数据
- (void)loadImagesData {
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"TopCompassData.plist" withExtension:nil]];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    [dictArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arrM addObject:[HSTopCompassDataModel functionListWithDict:obj]];
    }];
    _compassImageNameData = arrM.copy;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(UIImageView *)compassBGImgView{
    if (!_compassBGImgView) {
        _compassBGImgView = [[UIImageView alloc] init];
        _compassBGImgView.image=[UIImage imageNamed:@"bgZodiacTopCopy"];
        _compassBGImgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    return _compassBGImgView;
}

@end
