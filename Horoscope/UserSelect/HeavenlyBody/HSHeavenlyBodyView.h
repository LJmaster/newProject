//
//  HSHeavenlyBodyView.h
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSHeavenlyBodyCell;

@protocol HeavenlyBodyDelegate <NSObject>
- (void)changeHeavenlyItem:(NSInteger )heavenlyItem;
- (void)changeHeavenlyIndexpath:(NSIndexPath * )indexPath;

@end

@interface HSHeavenlyBodyView : UIView
/// 保存所有星球名称
@property (nonatomic, strong) NSArray *heavenlyBodyImageNameData;
@property (nonatomic,weak) id<HeavenlyBodyDelegate> delegate;
///全局cell
@property (nonatomic, strong) HSHeavenlyBodyCell *heavenlyBodyCell;

/**
 动态更新选中星球

 @param indexpath index
 */
-(void)heavenlyUpdateCurrentlySelectedWithIndexpath:(NSIndexPath *)indexpath;

@end
