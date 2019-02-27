//
//  HSetUserView.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBitrhdayPickerView.h"
#import "DateTimePickerView.h"
#import "HCardView.h"//卡片view
#import "HEmoteViewModel.h"
#import "HEmoteModel.h"
#import "UIImage+Himage.h"

@protocol HSetUserDelegate <NSObject>

-(void)userdataFillIn;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HSetUserView : UIView<DateTimePickerViewDelegate>

@property(nonatomic,weak) id<HSetUserDelegate> delegate;



@property(nonatomic,strong) HCardView * cardView;//卡片布局
@property(nonatomic,strong) UIView    * bitrhdayView;
@property(nonatomic,strong) UIView    * horoscopeView;
@property(nonatomic,strong) UIView    * genderView;
@property(nonatomic,strong) UIView    * marryView;
@property(nonatomic,strong) UIView    * nicknameView;
@property(nonatomic,strong) UIView    * emojiView;

@property(nonatomic,strong) UILabel    * apmLabel;//上下午label
@property(nonatomic,strong) UIButton   * datebutton;//月日
@property(nonatomic,strong) UIButton   * yearbutton;//年
@property(nonatomic,strong) UIButton   * apmbutton;//时间
@property(nonatomic,strong) UIImageView * horoscopeicon;//星座图片
@property(nonatomic,strong) UILabel     * horoscopename;//星座名称
@property(nonatomic,strong) UILabel     * manlab;//男生命名
@property(nonatomic,strong) UILabel     * womanlab;//女生命名
@property(nonatomic,strong) UILabel     * yeslab;//
@property(nonatomic,strong) UILabel     * metlab;//

@property(nonatomic,strong) UITextField * textfield;
@property(nonatomic,strong) HUser       *userData;

@property (nonatomic, strong) DateTimePickerView *datePickerView;
@property (nonatomic, strong) DateTimePickerView *timePickerView;

@property (nonatomic, strong) NSArray * emojifaceData;

@property (nonatomic, strong) NSMutableArray * FaceImageArr;//用户表情图片

@end

NS_ASSUME_NONNULL_END
