//
//  HProgressCell.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HProgressCell.h"
#import "LJProgressView.h"
#define cellScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define cellScreenHeight 120

@implementation HProgressCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self markUI];
    }
    return self;
}

-(void)markUI{
    
   
    
    NSArray * array = @[@"Love",@"Money",@"Career",@"Health"];
    for (int i = 0; i < 4; i++) {
        int x = i % 2;
        int y = i / 2;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(16 + KScreenWidth/2*x, 10 + 75 *y, 60, 21)];
        label.text = array[i];
        label.textColor = KWhiteColor;
        label.font = [UIFont fontWithName:@"DIN-Medium" size:17];
        [self addSubview:label];
        //进度条
        _progressView = [[LJProgressView alloc] initWithFrame:CGRectMake(16 + KScreenWidth/2*x, CGRectGetMaxY(label.frame) +8, KScreenWidth/2 - 30, 6)];
        _progressView.colorArr = @[(id)RGBA(249, 236, 0,1).CGColor,(id)RGBA(255, 75, 0,1).CGColor];
        _progressView.progress =  0.8;
        _progressView.tag = 10 + i;
        [self addSubview:_progressView];
        

    }
}

//- (void)layoutSubviews{
//
//    for (int i = 0; i< 5; i ++) {
//        LJProgressView * P = (LJProgressView *)[self viewWithTag:i+10];
//        if (i == 0) {
//            NSString * string = [self.data objectForKey:@"love"];
//            CGFloat ff = [string floatValue]/50;
//            NSLog(@"%f",ff);
//
//            P.progress =ff;
//        }
//        if (i == 1) {
//            NSString * string = [self.data objectForKey:@"career"];
//            P.progress =[string floatValue]/50;
//
//        }
//        if (i == 2) {
//            NSString * string = [self.data objectForKey:@"health"];
//            P.progress =[string floatValue]/50;
//
//        }
//        if (i == 3) {
//            NSString * string = [self.data objectForKey:@"money"];
//            P.progress =[string floatValue]/50;
//
//        }
//        if (i == 4) {
//            NSString * string = [self.data objectForKey:@"overall"];
//            P.progress =[string floatValue]/50;
//
//        }
//    }
//}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
