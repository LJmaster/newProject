//
//  HEmoteColorView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/26.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectColorDelegate <NSObject>
-(void)selectColorComponentIndexPath:(NSIndexPath *)selectIndexPath;
@end

NS_ASSUME_NONNULL_BEGIN

@interface HEmoteColorView : UIView

@property(nonatomic,weak)id<SelectColorDelegate> delegate;

@property(nonatomic,strong)NSArray * colorarr;

@property(nonatomic,assign)int       colortype;

-(void)ajjajajajaja:(NSArray *)arrrr;

@end

NS_ASSUME_NONNULL_END
