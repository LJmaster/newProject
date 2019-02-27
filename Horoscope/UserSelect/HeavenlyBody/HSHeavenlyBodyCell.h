//
//  HSHeavenlyBodyCell.h
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSHeavenlyBodyDataModel;
@interface HSHeavenlyBodyCell : UICollectionViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UILabel *heavenlyBodyNameLab;
@property (nonatomic, strong) HSHeavenlyBodyDataModel *heavenlyBodyDataModel;
@end
