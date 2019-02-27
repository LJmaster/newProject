//
//  HSTopCompassCell.h
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/16.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSTopCompassDataModel;
@interface HSTopCompassCell : UICollectionViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIImageView *xinZuoImgView;
@property (nonatomic, strong) HSTopCompassDataModel *topCompassDataModel;
@end
