//
//  HSetUserView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HSetUserView.h"
#import "HEmoteViewController.h"

@implementation HSetUserView

-(NSArray *)emojifaceData{
    
    if (!_emojifaceData) {
        _emojifaceData = [[NSArray alloc] initWithArray:[HEmoteViewModel dataofManorWoman:1]];
    }
    return _emojifaceData;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(0, 0, 0, 0.4);
        
        self.userData = [[HUserManager shareManager] readWithUser];
        if (self.userData == nil) {
            self.userData = [[HUser alloc] init];
        }
        [self addFelicityView];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        
        tapGestureRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tapGestureRecognizer];
        
        self.userData.sex = @"2";
        self.userData.marry = YES;
      
    }
    return self;
}

- (void)addFelicityView {
    self.cardView = [[HCardView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    [self.cardView setCardSwitchViewAry:[self ittemsCardSwitchViewAry] delegate:self];
    [self addSubview:self.cardView];
}

- (NSArray *)ittemsCardSwitchViewAry {
    NSMutableArray *ary = [NSMutableArray new];
    [ary addObject:self.bitrhdayView];
    [ary addObject:self.horoscopeView];
    [ary addObject:self.genderView];
    [ary addObject:self.marryView];
    [ary addObject:self.nicknameView];
    [ary addObject:self.emojiView];
    return ary;
}

-(UIView *)bitrhdayView{
    if (!_bitrhdayView) {
        _bitrhdayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 448)];
        _bitrhdayView.center = self.center;
        _bitrhdayView.backgroundColor = KWhiteColor;
        ViewRadius(_bitrhdayView, 10);
        
        [self creatTopButtons:_bitrhdayView];
        
        UILabel * label = [[BaseView baseShare] creatLabelFrame:CGRectMake(27, 75, _bitrhdayView.frame.size.width - 54, 40) withtext:@"When were you born?" withrootView:_bitrhdayView fontWithName:KMainFONT size:23];
        label.textColor = KBlackColor;
        label.textAlignment = NSTextAlignmentCenter;
        
        UILabel * label2 = [[BaseView baseShare] creatLabelFrame:CGRectMake(34, CGRectGetMaxY(label.frame) + 20, _bitrhdayView.width - 34, 19) withtext:@"Birth Date" withrootView:_bitrhdayView fontWithName:KMainFONT size:16];
        label2.textColor = RGB(180, 180, 180);
//       date
        UILabel * datelabel = [[BaseView baseShare] creatLabelFrame:CGRectMake(34, CGRectGetMaxY(label2.frame) + 19, 29, 16) withtext:@"Date" withrootView:_bitrhdayView fontWithName:KMainFONT size:13];
        datelabel.textColor = RGB(180, 180, 180);
        
        self.datebutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(CGRectGetMaxX(datelabel.frame) + 9, CGRectGetMaxY(label2.frame) + 13, 100, 22) withimageOrtext:@"23, March" withrootView:_bitrhdayView withtarget:self withaction:@selector(bitrhdateAction:)];
        self.datebutton.titleLabel.font = [UIFont fontWithName:KMainFONT size:18];
        [self.datebutton setTitleColor:RGB(49, 27, 146) forState:(UIControlStateNormal)];
//  year
        UILabel * yearlabel = [[BaseView baseShare] creatLabelFrame:CGRectMake(CGRectGetMaxX(self.datebutton.frame) + 10, CGRectGetMaxY(label2.frame) + 19, 35, 16) withtext:@"YEAR" withrootView:_bitrhdayView fontWithName:KMainFONT size:13];
        yearlabel.textColor = RGB(180, 180, 180);
        
        self.yearbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(CGRectGetMaxX(yearlabel.frame)+1, CGRectGetMaxY(label2.frame) + 13, 45, 22) withimageOrtext:@"1990" withrootView:_bitrhdayView withtarget:self withaction:@selector(bitrhdateAction:)];
        self.yearbutton.titleLabel.font = [UIFont fontWithName:KMainFONT size:18];
        [self.yearbutton setTitleColor:RGB(49, 27, 146) forState:(UIControlStateNormal)];
        
        [[BaseView baseShare] creatImageViewFrame:CGRectMake(CGRectGetMaxX(self.yearbutton.frame) + 7, CGRectGetMaxY(label2.frame) + 25, 12, 10) withImage:@"fill1" withrootView:_bitrhdayView];
        
        UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(35, CGRectGetMaxY(yearlabel.frame) + 7,_bitrhdayView.frame.size.width - 70 , 1)];
        line1.backgroundColor = RGBA(222, 222, 222, 1);
        [_bitrhdayView addSubview:line1];
//   time
        UILabel * label3 = [[BaseView baseShare] creatLabelFrame:CGRectMake(34, CGRectGetMaxY(line1.frame) + 35, 119, 19) withtext:@"YTime of Birth" withrootView:_bitrhdayView fontWithName:KMainFONT size:16];
        label3.textColor = RGB(180, 180, 180);
        
        UIButton * dontknowbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(CGRectGetMaxX(label3.frame) + 30, CGRectGetMaxY(line1.frame) + 35, 100, 22) withimageOrtext:@"btnDonotknowOff" withrootView:_bitrhdayView withtarget:self withaction:@selector(dontbitrhdayAction:)];
        dontknowbutton.titleLabel.font = [UIFont fontWithName:KMainFONT size:20];
        
        self.apmLabel = [[BaseView baseShare] creatLabelFrame:CGRectMake(35, CGRectGetMaxY(label3.frame) + 19, 40, 16) withtext:@"AM" withrootView:_bitrhdayView fontWithName:KMainFONT size:13];
        self.apmLabel.textColor = RGB(180, 180, 180);
        
        self.apmbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(CGRectGetMaxX(self.apmLabel.frame)+10, CGRectGetMaxY(label3.frame) + 14, 60, 22) withimageOrtext:@"12 : 00" withrootView:_bitrhdayView withtarget:self withaction:@selector(bitrhapmtimeAction:)];
        self.apmbutton.titleLabel.font = [UIFont fontWithName:KMainFONT size:18];
        [self.apmbutton setTitleColor:RGB(49, 27, 146) forState:(UIControlStateNormal)];
        
        [[BaseView baseShare] creatImageViewFrame:CGRectMake(_bitrhdayView.frame.size.width - 45, CGRectGetMaxY(label3.frame) + 20, 12, 10) withImage:@"fill1" withrootView:_bitrhdayView];
        
        UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(35, CGRectGetMaxY(self.apmLabel.frame) + 7,_bitrhdayView.frame.size.width - 70 , 1)];
        line2.backgroundColor = RGBA(222, 222, 222, 1);
        [_bitrhdayView addSubview:line2];
//   next
       UILabel *deslabel = [[BaseView baseShare] creatLabelFrame:CGRectMake((_bitrhdayView.width - 266)/2, _bitrhdayView.height - 114, 266, 14) withtext:@"Only to make the prediction more accurate" withrootView:_bitrhdayView fontWithName:@"ARJULIAN" size:12];
        deslabel.textAlignment = NSTextAlignmentCenter;
        deslabel.textColor = RGB(180, 180, 180);
        
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake((_bitrhdayView.width - 266)/2, _bitrhdayView.height - 98, 266, 50) withimageOrtext:@"NEXT" withrootView:_bitrhdayView withtarget:self withaction:@selector(bitrhdayAction:)];
        button.titleLabel.font = [UIFont fontWithName:KMainFONT size:20];
        [button setBackgroundImage:[UIImage imageNamed:@"btnPopupOn"] forState:(UIControlStateNormal)];
    }
    
    return _bitrhdayView;
}
-(UIView *)horoscopeView{
    if (!_horoscopeView) {
       _horoscopeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 448)];
       _horoscopeView.backgroundColor = KWhiteColor;
        ViewRadius(_horoscopeView, 10);
        
       [self creatTopButtons:_horoscopeView];
        
       UIImageView * horimageview = [[BaseView baseShare] creatImageViewFrame:CGRectMake((_horoscopeView.width - 164)/2, 103, 164, 164) withImage:@"oval" withrootView:_horoscopeView];
        
        self.horoscopeicon = [[BaseView baseShare] creatImageViewFrame:CGRectMake(20, 20, horimageview.frame.size.width - 40, horimageview.frame.size.height - 40) withImage:@"oval" withrootView:horimageview];
        
        self.horoscopename = [[BaseView baseShare] creatLabelFrame:CGRectMake((_horoscopeView.width - 266)/2, CGRectGetMaxY(horimageview.frame) +11, 266, 22) withtext:@"PISCES" withrootView:_horoscopeView fontWithName:KMainFONT size:12];
        self.horoscopename.textAlignment = NSTextAlignmentCenter;
        
       UILabel * deslabel = [[BaseView baseShare] creatLabelFrame:CGRectMake((_horoscopeView.width - 266)/2, _horoscopeView.height - 114, 266, 14) withtext:@"Only to make the prediction more accurate" withrootView:_horoscopeView fontWithName:@"HelveticaNeue" size:12];
        deslabel.textAlignment = NSTextAlignmentCenter;
        deslabel.textColor = RGB(180, 180, 180);
        
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake((_horoscopeView.width - 266)/2, _horoscopeView.height - 98, 266, 50) withimageOrtext:@"GET" withrootView:_horoscopeView withtarget:self withaction:@selector(horoscopeAction:)];
        button.titleLabel.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:20];
        [button setBackgroundImage:[UIImage imageNamed:@"btnPopupOn"] forState:(UIControlStateNormal)];
    }
    
    return _horoscopeView;
}

-(UIView *)genderView{
    if (!_genderView) {
        _genderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 448)];
        _genderView.center = self.center;
        _genderView.backgroundColor = KWhiteColor;
        ViewRadius(_genderView, 10);
        
        [self creatTopButtons:_genderView];
        
        UILabel * label = [[BaseView baseShare] creatLabelFrame:CGRectMake(0, 60, _genderView.width, 60) withtext:@"What do you think of your \nGender?" withrootView:_genderView fontWithName:KMainFONT size:23];
        label.textAlignment = NSTextAlignmentCenter;
        
        UILabel * label2 = [[BaseView baseShare] creatLabelFrame:CGRectMake(0, CGRectGetMaxY(label.frame), _genderView.width, 18) withtext:@"Tap to your choice" withrootView:_genderView fontWithName:@"HelveticaNeue" size:13];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.textColor = RGB(180, 180, 180);
        
         UIButton * leftbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(44, CGRectGetMaxY(label2.frame)+ 31, 96, 96) withimageOrtext:@"iconBoyOff" withrootView:_genderView withtarget:self withaction:@selector(genderleftAction:)];
        leftbutton.tag = 100;
        
        self.manlab = [[BaseView baseShare] creatLabelFrame:CGRectMake(44, CGRectGetMaxY(leftbutton.frame) + 10, leftbutton.width, 27) withtext:@"boy" withrootView:_genderView fontWithName:@"AlegreyaSansSC-Medium" size:16];
        self.manlab.textAlignment = NSTextAlignmentCenter;
        self.manlab.textColor = RGB(49, 27, 146);
        self.manlab.alpha = 0.4;
        
         UIButton * rightbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(CGRectGetMaxX(leftbutton.frame) + 40, CGRectGetMaxY(label2.frame)+ 31, 96, 96) withimageOrtext:@"iconGirlOn" withrootView:_genderView withtarget:self withaction:@selector(genderrightAction:)];
        rightbutton.tag = 101;
        
        self.womanlab = [[BaseView baseShare] creatLabelFrame:CGRectMake(CGRectGetMaxX(leftbutton.frame) + 40, CGRectGetMaxY(leftbutton.frame) + 10, leftbutton.width, 27) withtext:@"Gril" withrootView:_genderView fontWithName:@"AlegreyaSansSC-Medium" size:22];
        self.womanlab.textAlignment = NSTextAlignmentCenter;
        self.womanlab.textColor = RGB(49, 27, 146);
        
        UILabel *deslabel = [[BaseView baseShare] creatLabelFrame:CGRectMake((_horoscopeView.width - 266)/2, _genderView.height - 114, 266, 14) withtext:@"Only to make the prediction more accurate" withrootView:_genderView fontWithName:@"HelveticaNeue" size:12];
        deslabel.textAlignment = NSTextAlignmentCenter;
        deslabel.textColor = RGB(180, 180, 180);
        
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake((_genderView.width - 266)/2, _genderView.height - 98, 266, 50) withimageOrtext:@"OK" withrootView:_genderView withtarget:self withaction:@selector(genderAction:)];
        button.titleLabel.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:20];
        [button setBackgroundImage:[UIImage imageNamed:@"btnPopupOn"] forState:(UIControlStateNormal)];
    }
    
    return _genderView;
}

-(UIView *)marryView{
    if (!_marryView) {
        _marryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 448)];
        _marryView.center = self.center;
        _marryView.backgroundColor = KWhiteColor;
        ViewRadius(_marryView, 10);
        
         [self creatTopButtons:_marryView];
        
        UILabel * label = [[BaseView baseShare] creatLabelFrame:CGRectMake(0, 60, _marryView.width, 60) withtext:@"Still waiting for the\n Destined Person？" withrootView:_marryView fontWithName:KMainFONT size:23];
        label.textAlignment = NSTextAlignmentCenter;
        
        UILabel * label2 = [[BaseView baseShare] creatLabelFrame:CGRectMake(0, CGRectGetMaxY(label.frame), _marryView.width, 18) withtext:@"Tap to your choice" withrootView:_marryView fontWithName:@"HelveticaNeue" size:13];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.textColor = RGB(180, 180, 180);
        
        UIButton * leftbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(44, CGRectGetMaxY(label2.frame)+ 31, 96, 96) withimageOrtext:@"iconYesOff" withrootView:_marryView withtarget:self withaction:@selector(marryleftAction:)];
        leftbutton.tag = 102;
        
        self.yeslab = [[BaseView baseShare] creatLabelFrame:CGRectMake(44, CGRectGetMaxY(leftbutton.frame) + 10, leftbutton.width, 27) withtext:@"yes" withrootView:_marryView fontWithName:@"AlegreyaSansSC-Medium" size:16];
        self.yeslab.textAlignment = NSTextAlignmentCenter;
        self.yeslab.textColor = RGB(49, 27, 146);
        self.yeslab.alpha = 0.4;
        
        UIButton * rightbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake(CGRectGetMaxX(leftbutton.frame) + 40, CGRectGetMaxY(label2.frame)+ 31, 96, 96) withimageOrtext:@"iconMetOn" withrootView:_marryView withtarget:self withaction:@selector(marryrightAction:)];
        rightbutton.tag = 103;
        
        self.metlab = [[BaseView baseShare] creatLabelFrame:CGRectMake(CGRectGetMaxX(leftbutton.frame) + 40, CGRectGetMaxY(leftbutton.frame) + 10, leftbutton.width, 27) withtext:@"I have met" withrootView:_marryView fontWithName:@"AlegreyaSansSC-Medium" size:16];
        self.metlab.textAlignment = NSTextAlignmentCenter;
        self.metlab.textColor = RGB(49, 27, 146);
        
       UILabel * deslabel = [[BaseView baseShare] creatLabelFrame:CGRectMake((_marryView.width - 266)/2, _marryView.height - 114, 266, 14) withtext:@"Only to make the prediction more accurate" withrootView:_marryView fontWithName:@"HelveticaNeue" size:12];
        deslabel.textAlignment = NSTextAlignmentCenter;
        deslabel.textColor = RGB(180, 180, 180);
        
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake((_marryView.width - 266)/2, _marryView.height - 98, 266, 50) withimageOrtext:@"OK" withrootView:_marryView withtarget:self withaction:@selector(marryAction:)];
        button.titleLabel.font = [UIFont fontWithName:KMainFONT size:22];
        [button setBackgroundImage:[UIImage imageNamed:@"btnPopupOn"] forState:(UIControlStateNormal)];
        
        UIButton * dontbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake((_marryView.width - 158)/2, CGRectGetMaxY(button.frame) +8, 158, 18) withimageOrtext:@"I do not Want to tell you" withrootView:_marryView withtarget:self withaction:@selector(marrydontAction:)];
        dontbutton.titleLabel.font = [UIFont fontWithName:KMainFONT size:15];
        [dontbutton setTitleColor:RGB(179, 135, 255) forState:(UIControlStateNormal)];
    }
    
    return _marryView;
}
-(UIView *)nicknameView{
    if (!_nicknameView) {
        _nicknameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 448)];
        _nicknameView.backgroundColor = KWhiteColor;
         ViewRadius(_nicknameView, 10);
        
        [self creatTopButtons:_nicknameView];
        
        UILabel * label = [[BaseView baseShare] creatLabelFrame:CGRectMake(0, 60, _nicknameView.width, 60) withtext:@"May I have your name?" withrootView:_nicknameView fontWithName:KMainFONT size:23];
        label.textAlignment = NSTextAlignmentCenter;
        
        UILabel * label2 = [[BaseView baseShare] creatLabelFrame:CGRectMake(34, CGRectGetMaxY(label.frame) + 24.5, _nicknameView.width - 34, 19) withtext:@"Your Nickname" withrootView:_nicknameView fontWithName:KMainFONT size:16];
        label2.textColor = RGB(180, 180, 180);
        
        self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label2.frame) +24, _nicknameView.width, 24)];
        self.textfield.textAlignment = NSTextAlignmentCenter;
        [_nicknameView addSubview:self.textfield];
        
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake((_nicknameView.width - 250)/2, CGRectGetMaxY(self.textfield.frame) + 8, 250, 1)];
        line.backgroundColor = RGB(244, 231, 113);
        [_nicknameView addSubview:line];
        
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake((_nicknameView.width - 266)/2, _nicknameView.height - 98, 266, 50) withimageOrtext:@"Generate Your Avatar" withrootView:_nicknameView withtarget:self withaction:@selector(nickAction:)];
        button.titleLabel.font = [UIFont fontWithName:KMainFONT size:22];
        [button setBackgroundImage:[UIImage imageNamed:@"btnPopupOn"] forState:(UIControlStateNormal)];
    }
    return _nicknameView;
}
-(UIView *)emojiView{
    if (!_emojiView) {
        _emojiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 448)];
        _emojiView.backgroundColor = KWhiteColor;
         ViewRadius(_emojiView, 10);
        
        [self creatTopButtons:_emojiView];
        
        UILabel * label = [[BaseView baseShare] creatLabelFrame:CGRectMake(27, 60, _bitrhdayView.frame.size.width - 54, 40) withtext:@"Moric, Do you like this?" withrootView:_emojiView fontWithName:KMainFONT size:23];
        label.textColor = KBlackColor;
        label.textAlignment = NSTextAlignmentCenter;

        
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake((_emojiView.width - 266)/2, _emojiView.height - 98, 266, 50) withimageOrtext:@"I Love it" withrootView:_emojiView withtarget:self withaction:@selector(emojiOKAction:)];
        button.titleLabel.font = [UIFont fontWithName:@"Nissan" size:22];
        [button setBackgroundImage:[UIImage imageNamed:@"btnPopupOn"] forState:(UIControlStateNormal)];
        
        UIButton * dontbutton = [[BaseView baseShare] creatButtonFrame:CGRectMake((_emojiView.width - 223)/2, CGRectGetMaxY(button.frame) +8, 223, 18) withimageOrtext:@"Not for me, I want to make it myself" withrootView:_emojiView withtarget:self withaction:@selector(emojiagainAction:)];
        dontbutton.titleLabel.font = [UIFont fontWithName:@"AlegreyaSansSC-Regular" size:17];
        [dontbutton setTitleColor:RGB(179, 135, 255) forState:(UIControlStateNormal)];
    }
    return _emojiView;
}
//顶部技能点的图标
-(void)creatTopButtons:(UIView *)subView{
    CGFloat wh = 24;
    CGFloat by = 10;
    CGFloat bx = 20;
    UILabel * line = [[BaseView baseShare] creatLabelFrame:CGRectMake(15, 20, 145, 2) withtext:@"" withrootView:subView fontWithName:@"" size:23];
    line.backgroundColor = RGB(246, 246, 242);
    for (int i = 0; i < 4; i++) {
        UIButton * button = [[BaseView baseShare] creatButtonFrame:CGRectMake(10 + (wh+bx)*i, by, wh, wh) withimageOrtext:@"bgPrgNewRound" withrootView:subView withtarget:self withaction:@selector(topdianButton)];
        button.tag = 110 + i;
    }
}

//生日
-(void)bitrhdayAction:(UIButton *)sender{
    [self.cardView updateSlidePosition:1];
// 变换用户星座信息
   int ff =  [[HSelectHoroscopeViewModel shareManager] hsItemWithdate:self.userData.Br_Date];
    NSDictionary * dict = [[HSelectHoroscopeViewModel shareManager] heavenlyNameWithItem:ff];
    self.horoscopeicon.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    self.horoscopename.text = [dict objectForKey:@"name"];
//  保存用户信息
    self.userData.horoscopeInt = ff;
    self.userData.horoscope = [dict objectForKey:@"name"];
}

-(void)bitrhdateAction:(UIButton *)sender{
    _datePickerView = [[DateTimePickerView alloc] init];
    _datePickerView.delegate = self;
    _datePickerView.pickerViewMode = DatePickerViewDateMode;
    [self addSubview:_datePickerView];
    [_datePickerView showDateTimePickerView];
}
-(void)dontbitrhdayAction:(UIButton *)sender{
    
    if (sender.selected ==NO) {
        [sender setImage:[UIImage imageNamed:@"btnDonotknowOn"] forState:(UIControlStateNormal)];
    }else{
        [sender setImage:[UIImage imageNamed:@"btnDonotknowOff"] forState:(UIControlStateNormal)];
    }
    sender.selected = !sender.selected;
}
-(void)bitrhapmtimeAction:(UIButton *)sender{
    _timePickerView = [[DateTimePickerView alloc] init];
    _timePickerView.delegate = self;
    _timePickerView.pickerViewMode = DatePickerViewTimeMode;
    [self addSubview:_timePickerView];
    [_timePickerView showDateTimePickerView];
}
//星座
-(void)horoscopeAction:(UIButton *)sender{
    [self.cardView updateSlidePosition:2];
}
//性别
-(void)genderAction:(UIButton *)sender{
 [self.cardView updateSlidePosition:3];
    
//    异步生成 随机表情
    self.FaceImageArr = [[NSMutableArray alloc] init];
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         UIImage * faceemoji = [HEmoteViewModel randomFacewithSex:[self.userData.sex intValue]];
        [self.FaceImageArr addObject:faceemoji];
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage * faceemoji = [HEmoteViewModel randomFacewithSex:[self.userData.sex intValue]];
        [self.FaceImageArr addObject:faceemoji];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        UIScrollView * emojiScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120 , KScreenWidth, 200)];
        [self.emojiView addSubview:emojiScrollView];
        [self.FaceImageArr addObject:[UIImage imageNamed:@"iconFacebg"]];
        for (int i = 0; i < 3; i++) {
            UIButton * useremojiIV =  [[UIButton alloc] initWithFrame:CGRectMake(20 + (200 + 35) * i, 0, 200, 200)];
            [useremojiIV setImage:self.FaceImageArr[i] forState:(UIControlStateNormal)];
            [emojiScrollView addSubview:useremojiIV];
            [useremojiIV addTarget:self action:@selector(SelectorFaceEmoji:) forControlEvents:(UIControlEventTouchUpInside)];
            useremojiIV.tag = 1000 + i;
        }
        emojiScrollView.contentSize = CGSizeMake(20 + (200 + 35) * 3, 200);
    });

}
-(void)genderleftAction:(UIButton *)sender{
    [sender setImage:[UIImage imageNamed:@"iconBoyOffCopy"] forState:(UIControlStateNormal)];
    UIButton * button = [self.genderView viewWithTag:101];
    [button setImage:[UIImage imageNamed:@"iconGirlOff"] forState:(UIControlStateNormal)];
    
    self.manlab.alpha = 1.0;
    self.manlab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:22];
    self.womanlab.alpha = 0.4;
    self.womanlab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:16];
    self.userData.sex = @"1";
}
-(void)genderrightAction:(UIButton *)sender{
    [sender setImage:[UIImage imageNamed:@"iconGirlOn"] forState:(UIControlStateNormal)];
    UIButton * button = [self.genderView viewWithTag:100];
    [button setImage:[UIImage imageNamed:@"iconBoyOff"] forState:(UIControlStateNormal)];
    
    self.manlab.alpha = 0.4;
    self.manlab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:16];
    self.womanlab.alpha = 1.0;
    self.womanlab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:22];
    self.userData.sex = @"2";
}

//是否结婚
-(void)marryAction:(UIButton *)sender{
 [self.cardView updateSlidePosition:4];
    
}
-(void)marrydontAction:(UIButton *)sender{
    [self.cardView updateSlidePosition:4];
    self.userData.marry = NO;
}

-(void)marryleftAction:(UIButton *)sender{
    [sender setImage:[UIImage imageNamed:@"iconYesOn"] forState:(UIControlStateNormal)];
    UIButton * button = [self.marryView viewWithTag:103];
    [button setImage:[UIImage imageNamed:@"iconMetOff"] forState:(UIControlStateNormal)];
    
    self.yeslab.alpha = 1.0;
    self.yeslab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:22];
    self.metlab.alpha = 0.4;
    self.metlab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:16];
    self.userData.marry = YES;
}
-(void)marryrightAction:(UIButton *)sender{
    [sender setImage:[UIImage imageNamed:@"iconMetOn"] forState:(UIControlStateNormal)];
    UIButton * button = [self.marryView viewWithTag:102];
    [button setImage:[UIImage imageNamed:@"iconYesOff"] forState:(UIControlStateNormal)];
    
    self.yeslab.alpha = 0.4;
    self.yeslab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:16];
    self.metlab.alpha = 1.0;
    self.metlab.font = [UIFont fontWithName:@"AlegreyaSansSC-Medium" size:22];
    self.userData.marry = YES;
}
//昵称
-(void)nickAction:(UIButton *)sender{
    [self.cardView updateSlidePosition:5];
    if (self.textfield.text != nil) {
        self.userData.name = self.textfield.text;
    }
}
-(void)emojiOKAction:(UIButton *)sender{
//    u用户信息保存
    
    [[HUserManager shareManager] writeWithUser:self.userData];
    [self.delegate userdataFillIn];
}
-(void)emojiagainAction:(UIButton *)sender{
    UIViewController * vc =  [self parentController];
    [vc presentViewController:[HEmoteViewController new] animated:YES completion:nil];
}



//顶部完成点的方法
-(void)topdianButton{

}
//消除键盘
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.textfield resignFirstResponder];
}

#pragma mark -日期选择器delegate
- (void)didClickFinishDateTimePickerView:(NSString *)date{
    if ([date length] > 5) {
        NSString * yearstr = [[HSelectHoroscopeViewModel shareManager] getyearWithDate:date];
        NSString * monthstr = [[HSelectHoroscopeViewModel shareManager]  getmonthordayWithDate:date];
        [self.yearbutton setTitle:yearstr forState:(UIControlStateNormal)];
        [self.datebutton setTitle:monthstr forState:(UIControlStateNormal)];
//       用户信息保存
        self.userData.Br_Date = date;
    }else{
        NSString * timtstr = date;
        [self.apmbutton setTitle:timtstr forState:(UIControlStateNormal)];
    }
}
#pragma mark -用户选择了表情
-(void)SelectorFaceEmoji:(UIButton *)sender{
    self.userData.avatar = self.FaceImageArr[sender.tag - 1000];
}



@end
