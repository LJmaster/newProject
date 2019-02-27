//
//  HSHeavenlyBodyCell.m
//  horoscope2018
//
//  Created by 杰刘  on 2017/12/19.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "HSHeavenlyBodyCell.h"
#import "HSHeavenlyBodyDataModel.h"

@interface HSHeavenlyBodyCell ()
@property (weak, nonatomic) IBOutlet UIButton *heavenlyClick;

///星球动画尺寸,只是用来动态计算尺寸
@property (weak, nonatomic) IBOutlet UIImageView *heavenlyClickSizeImgView;


@end

@implementation HSHeavenlyBodyCell

- (void)setHeavenlyBodyDataModel:(HSHeavenlyBodyDataModel *)heavenlyBodyDataModel{
    _heavenlyBodyNameLab.text = heavenlyBodyDataModel.HeavenlyBodyName;
    [_heavenlyClick setBackgroundImage:[UIImage imageNamed:heavenlyBodyDataModel.Imgicon] forState:UIControlStateNormal];
    [_heavenlyClick setImage:[UIImage imageNamed:heavenlyBodyDataModel.starName] forState:UIControlStateNormal];
}

- (IBAction)heavenlyClick:(UIButton *)sender {
//    //ipad适配
//    NSInteger num = [UIScreen mainScreen].bounds.size.width;
//    if (num == 1024 || num == 834 || num == 768) {
//        return;
//    }
//    for (NSInteger i = 0; i < 3; i++) {
//        // 1.创建一个圈圈view
//        UIView *circleView = [[UIView alloc] init];
//        
////        sender.center = circleView.center;
//        circleView.backgroundColor = [UIColor colorWithRed:187 / 255.0 green:173 / 255.0 blue:211 / 255.0 alpha:1];
//        
//        circleView.frame = _heavenlyClickSizeImgView.frame;
//       
//        [self.contentView insertSubview:circleView belowSubview:sender];
//        // 5.设置圆角半径
//        circleView.layer.cornerRadius = circleView.bounds.size.width * 0.5;
//        //    circleView.layer.masksToBounds = YES; // 超出边界裁剪
//        //    circleView.clipsToBounds = YES;
//        // 6.动画的方式让圈圈view放大
//        [UIView animateWithDuration:1.0 delay:i * .8 options:0 animations:^{
//            
//            circleView.transform = CGAffineTransformMakeScale(1.3, 1.3);
//            // 透明度'默认是1'
//            circleView.alpha = 0;
//            
//        } completion:^(BOOL finished) {
//            // 动画执行完成之后把看不见的圈圈删除
//            [circleView removeFromSuperview];
//        }];
//    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
@end
