//
//  HEmoteView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HEmoteView : UIView
- (instancetype)initWithFrame:(CGRect)frame withuserSex:(int)sextype;
//更新面部表情
-(void)changeEmoji:(NSIndexPath *)index;

-(UIImage *)endEmoji;
@end

NS_ASSUME_NONNULL_END
