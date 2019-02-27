//
//  HFacePieceViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/18.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HFacePieceViewController.h"
#import "HFaceCell.h"
#import "UIImage+Himage.h"
#import "UIColor+HColor.h"

@interface HFacePieceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * collectionView;



@end

@implementation HFacePieceViewController



- (void)viewDidLoad {
    [super viewDidLoad];


    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.itemSize = CGSizeMake((KScreenWidth - 50) / 4, (KScreenWidth - 50) / 4);
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , KScreenHeight - 350- 44 - kBottomSafeHeight) collectionViewLayout:flowlayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = KWhiteColor;
    [self.view addSubview:self.collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.facearray.count;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString*identifier=[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    [self.collectionView registerClass:[HFaceCell class] forCellWithReuseIdentifier:identifier];
    HFaceCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    for(id subView in cell.contentView.subviews){
        if(subView){
            [subView removeFromSuperview];
        }
    }
    cell.backgroundColor = KGrayColor;
    id data = self.facearray[indexPath.row];
// 通过类型判断展示样式
    if ([data isKindOfClass:[NSArray class]]) {
        UIColor * color = [[UIColor alloc] init] ;
        if (self.facetype == 1) {
            color = [UIColor blackColor];
            NSArray * facearr = (NSArray *)data;
            cell.imageViewbg.image = [[UIImage imageNamed:facearr[0]] imageWithBgColor:color];
            if (facearr.count > 1) {
                cell.imageView.image = [[UIImage imageNamed:facearr[1]] imageWithBgColor:color];
            }
        }
        if (self.facetype == 2) {
            color = [UIColor colorWithHexString:@"6f6f6f"];
            NSArray * eyearr = (NSArray *)data;
            cell.imageViewbg.image = [UIImage imageNamed:eyearr[0]] ;
             if (eyearr.count > 1) {
            cell.imageView.image = [[UIImage imageNamed:eyearr[1] ] imageWithBgColor:color];
             }
        }
    }else{
        cell.imageView.image = [UIImage imageNamed:data];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HFaceCell *cell =(HFaceCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    NSIndexPath * path = [NSIndexPath indexPathForRow:indexPath.row inSection:self.facetype];
    [self.delegate selectFaceComponentIndexPath:path];
    
}

@end
