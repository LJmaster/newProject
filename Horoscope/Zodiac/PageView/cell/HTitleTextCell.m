//
//  HTitleTextCell.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HTitleTextCell.h"
#define cellScreenHeight 210
@implementation HTitleTextCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView * linebcview = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 4, 20)];
        ViewRadius(linebcview, 2);
        linebcview.backgroundColor = RGB(101, 153, 245);
        [self addSubview:linebcview];
        
        self.titleLabel = [[BaseView baseShare] creatLabelFrame:CGRectMake(CGRectGetMaxX(linebcview.frame) + 5, 10, 100, 20)
                                                         withtext:@"Money"
                                                     withrootView:self
                                                     fontWithName:@"DIN-Regular" size:20];
        self.titleLabel.textColor = KWhiteColor;
        
        
        UIView * bcview = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame) + 13, KScreenWidth - 30, 145)];
        ViewRadius(bcview, 6);
        bcview.backgroundColor = RGB(52, 55, 66);
        [self addSubview:bcview];
        
        self.contentLabel = [[BaseView baseShare] creatLabelFrame:CGRectMake(15, 15, bcview.frame.size.width - 30, bcview.frame.size.height - 30)
                                                         withtext:@"Financial matters are under favorable stars at the moment and if you make an effort to do something new on the work Financial matters are under.on the work Financial matters are undern."
                                                     withrootView:bcview
                                                     fontWithName:@"DIN-Regular" size:16];
        self.contentLabel.textColor = RGBA(229, 229, 246, 0.8);
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
// MARK: - 动态计算cell高度
+ (CGFloat)moreHeight:(NSString *)str{
    // 展开后得高度 = 计算出文本内容的高度 + 固定控件的高度
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont fontWithName:@"DIN-Regular" size:16]};
    NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
    CGSize size = [str boundingRectWithSize:CGSizeMake(KScreenWidth - 62, 10000) options:option attributes:attribute context:nil].size;
    return size.height + 65;
}

@end
