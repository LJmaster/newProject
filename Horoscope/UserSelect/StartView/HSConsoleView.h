//
//  HSConsoleView.h
//  horoscope2018
//
//  Created by 刘杰 on 2019/1/9.
//  Copyright © 2019 Horoscope 2018 Group. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface HSConsoleView : UIView

///Personal Tailor按钮
@property (strong, nonatomic) UIButton *personalBtn;
///Start Now按钮
@property (strong, nonatomic) UIButton *startNowBtn;
//说明
@property (nonatomic,strong)UILabel  * detailLabel;


//说明
@property (nonatomic,strong)UILabel  * nikeLabel;

-(void)refreshUI;
@end

NS_ASSUME_NONNULL_END
