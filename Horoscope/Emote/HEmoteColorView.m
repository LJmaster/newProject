
//
//  HEmoteColorView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/26.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HEmoteColorView.h"

@interface HEmoteColorView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * collectionView;



@end

@implementation HEmoteColorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.itemSize = CGSizeMake((KScreenWidth - 50) / 4, (KScreenWidth - 50) / 4);
        flowlayout.minimumLineSpacing = 10;
        flowlayout.minimumInteritemSpacing = 10;
        flowlayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , KScreenHeight - 350- 44 - kBottomSafeHeight) collectionViewLayout:flowlayout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = KWhiteColor;
        [self addSubview:self.collectionView];
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.colorarr.count;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString*identifier=[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    for(id subView in cell.contentView.subviews){
        if(subView){
            [subView removeFromSuperview];
        }
    }
    cell.backgroundColor = [UIColor colorWithHexString:self.colorarr[indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSIndexPath * path = [NSIndexPath indexPathForRow:indexPath.row inSection:self.colortype];
    [self.delegate selectColorComponentIndexPath:path];
    
}


-(void)ajjajajajaja:(NSArray *)arrrr{
    self.colorarr = [[NSArray alloc] initWithArray:arrrr];
    [self.collectionView reloadData];
    
}
@end
