//
//  HEmoteViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HEmoteViewController.h"
#import "HEmoteView.h"
#import "HEmoteViewModel.h"
#import "HFacePieceViewController.h"
#import "HEmoteColorView.h"

@interface HEmoteViewController ()<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate,SelectFaceDelegate,SelectColorDelegate>
@property (nonatomic, strong) SGPageTitleView         * pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView * pageContentScrollView;
@property (nonatomic, strong) HEmoteView              * faceview;
@property (nonatomic, assign) NSInteger                 currentSelect;
@property (nonatomic, strong) NSMutableArray          * titleName;
@property (nonatomic, strong) UILabel                 * titleNameLabel;
@property (nonatomic, strong) UIButton                * changeColorButton;
@property (nonatomic, strong) HEmoteColorView         * colorView;

@property (nonatomic, strong) NSArray                * emotearray;//用户总数据
@end

@implementation HEmoteViewController

-(NSMutableArray *)titleName{
    if (_titleName == nil) {
        _titleName = [[NSMutableArray alloc] initWithObjects:@"Face Shape",@"Hairstyle",@"Eye shape",@"Eyebrow",@"Nose",@"Mouth",@"Feature",@"Facial Hair", nil];
    }
    return _titleName;
}
-(NSArray *)emotearray{
    if (_emotearray == nil) {
        _emotearray = [[NSArray alloc] initWithArray:[HEmoteViewModel dataofManorWoman:1]];
    }
    return _emotearray;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBgImage] ;
    
    
    self.faceview = [[HEmoteView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 364.5) withuserSex:1];
    [self.view addSubview:self.faceview];
    
    [[BaseView baseShare] creatButtonFrame:CGRectMake(10, 40, 30, 30) withimageOrtext:@"iconBack" withrootView:self.view withtarget:self withaction:@selector(backBtnClicked)];
    
    [[BaseView baseShare] creatButtonFrame:CGRectMake(KScreenWidth - 40, 40, 30, 30) withimageOrtext:@"iconLogo" withrootView:self.view withtarget:self withaction:@selector(saveBtnClicked)];
    
    [self setupPageView];
}
//颜色view
-(void)setupcolorView{
    self.colorView = [[HEmoteColorView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, _pageContentScrollView.frame.size.height)];
    self.colorView.delegate = self;
    [_pageContentScrollView addSubview:self.colorView];
}

//选择器
- (void)setupPageView {
    
    NSMutableArray *titleArr = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
    NSMutableArray * buttonSelectimage  = [[NSMutableArray alloc] initWithObjects:@"iconFace",@"icon_hair",@"iconEyes",@"iconEyebrow",@"iconNose",@"iconMouth",@"icon_feature",@"iconBeard", nil];
    NSMutableArray * buttonimage =[[NSMutableArray alloc] initWithObjects:@"iconFaceDark",@"icon_hair_dark",@"iconEyesDark",@"iconEyebrowDark",@"iconNoseDark",@"iconMouthDark",@"icon_feature_dark",@"iconBeardDark", nil];
    if (self.sexttype != 1) {
        [titleArr removeLastObject];
        [buttonSelectimage removeLastObject];
        [buttonimage removeLastObject];
        [self.titleName removeLastObject];
    }
    
    
    UIImageView * topMenuView = [[BaseView baseShare] creatImageViewFrame:CGRectMake(0, 306, KScreenWidth, 44) withImage:@"icontopBg" withrootView:self.view];
    topMenuView.userInteractionEnabled = YES;
    self.changeColorButton = [[BaseView baseShare] creatButtonFrame:CGRectMake( KScreenWidth - 44,17, 24, 24) withimageOrtext:@"iconColor" withrootView:topMenuView withtarget:self withaction:@selector(showColorMenuAction:)];
    self.titleNameLabel = [[BaseView baseShare] creatLabelFrame:CGRectMake(20, 17, 100, 24) withtext:@"Face Shape" withrootView:topMenuView fontWithName:@"" size:14];
    CGFloat pageTitleViewY = CGRectGetMaxY(topMenuView.frame);
//    表头数据title

    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorStyle = SGIndicatorStyleDynamic;
    configure.titleAdditionalWidth = 60;
    configure.showBottomSeparator = NO;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, KScreenHeight - 44 - kBottomSafeHeight, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
//    _pageTitleView.selectedIndex = 1;
    _pageTitleView.backgroundColor = KWhiteColor;
    
    [_pageTitleView setImages:buttonimage selectedImages:buttonSelectimage imagePositionType:(SGImagePositionTypeRight) spacing:5];
    
//    用户数据
    
    NSMutableArray *childArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < buttonSelectimage.count; i++) {
        HFacePieceViewController *newVC = [[HFacePieceViewController alloc] init];
        newVC.facearray = self.emotearray[i];
        newVC.delegate = self;
        newVC.facetype = i;
        [childArr addObject:newVC];
    }

    
    /// pageContentScrollView
    CGFloat contentViewHeight = self.view.frame.size.height - pageTitleViewY - 44 - kBottomSafeHeight;
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, pageTitleViewY, KScreenWidth, contentViewHeight) parentVC:self childVCs:childArr];
    _pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
  
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView index:(NSInteger)index {
    /// 说明：在此获取标题or当前子控制器下标值
    NSLog(@"face index - - %ld", index);
    self.currentSelect = index;
    self.titleNameLabel.text = self.titleName[index];
    if (index > 2) {
        self.changeColorButton.hidden = YES;
    }else{
        self.changeColorButton.hidden = NO;
    }
}
// 更改试图的代理
-(void)selectFaceComponentIndexPath:(NSIndexPath *)selectIndexPath{
    [self.faceview changeEmoji:selectIndexPath];
}
-(void)selectColorComponentIndexPath:(NSIndexPath *)selectIndexPath{
     [self.faceview changeEmoji:selectIndexPath];
}
//点击color事件
-(void)showColorMenuAction:(UIButton *)sender{
    
    if (sender.selected == NO) {
        [sender setImage:[UIImage imageNamed:@"iconColorGreen"] forState:(UIControlStateNormal)];
        [self setupcolorView];
        [self.colorView ajjajajajaja:self.emotearray[self.currentSelect +8]];
        self.colorView.colortype = (int)(self.currentSelect + 8);
        
        self.pageTitleView.userInteractionEnabled = NO;
    }else{
        [sender setImage:[UIImage imageNamed:@"iconColor"] forState:(UIControlStateNormal)];
        [self.colorView removeFromSuperview];
        
        self.pageTitleView.userInteractionEnabled = YES;
    }
    sender.selected = !sender.selected;
}

-(void)saveBtnClicked{
// 保存生成的表情
     [self.faceview endEmoji];
    
    
}

@end
