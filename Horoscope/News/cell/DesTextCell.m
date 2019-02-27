//
//  DesTextCell.m
//  NowTest
//
//  Created by 杰刘 on 2018/4/12.
//  Copyright © 2018年 刘杰. All rights reserved.
//

#import "DesTextCell.h"
#import "UtilsMacros.h"
#define cellScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define cellScreenHeight 400

@implementation DesTextCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self markUI];
    }
    return self;
}

-(void)markUI{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, cellScreenWidth - 40, 30)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont fontWithName:@"zodiac_text-Regular" size:18];
    [self addSubview:self.titleLabel];
    
}
-(void)layoutSubviews{
    
    if ([[self.dict objectForKey:@"blod"] isEqualToString:@"0"]) {
//        标题
        // 计算文本高度
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont fontWithName:@"DIN-Bold" size:18]};
        NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
        
        CGSize size = [[self.dict objectForKey:@"data"] boundingRectWithSize:CGSizeMake(cellScreenWidth - 40, 10000) options:option attributes:attribute context:nil].size;
        [self.titleLabel setFrame:CGRectMake(17, 0, cellScreenWidth - 34, size.height)];
        self.titleLabel.font = [UIFont fontWithName:@"DIN-Bold" size:18];
        self.titleLabel.text = [self.dict objectForKey:@"data"];
        self.titleLabel.textColor = RGBA(0, 0, 0, 0.8);
        
    }else if ([[self.dict objectForKey:@"blod"] isEqualToString:@"1"])
      {
          // 计算文本高度
          NSDictionary *attribute = @{NSFontAttributeName: [UIFont fontWithName:@"DIN-Medium" size:16]};
          NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
          CGSize size = [[self.dict objectForKey:@"data"] boundingRectWithSize:CGSizeMake(cellScreenWidth - 34, 10000) options:option attributes:attribute context:nil].size;
          [self.titleLabel setFrame:CGRectMake(17, 0, cellScreenWidth - 34, size.height + 20)];
          
          self.titleLabel.textColor = [UIColor blackColor];
          self.titleLabel.font = [UIFont fontWithName:@"DIN-Medium" size:16];
          self.titleLabel.text = [self.dict objectForKey:@"data"];
      }else{
          // 计算文本高度
          NSDictionary *attribute = @{NSFontAttributeName: [UIFont fontWithName:@"DIN-Regular" size:16]};
          NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
          CGSize size = [[self.dict objectForKey:@"data"] boundingRectWithSize:CGSizeMake(cellScreenWidth - 34, 10000) options:option attributes:attribute context:nil].size;
          [self.titleLabel setFrame:CGRectMake(17, 0, cellScreenWidth - 34, size.height + 30)];
          
          self.titleLabel.textColor = [UIColor blackColor];
          self.titleLabel.font = [UIFont fontWithName:@"DIN-Regular" size:16];
          self.titleLabel.text = [self.dict objectForKey:@"data"];
         
      }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


// MARK: - 获取展开后的高度
+ (CGFloat)moreHeight:(NSDictionary *)dict{
    
    // 展开后得高度 = 计算出文本内容的高度 + 固定控件的高度
    
    NSDictionary *attribute;
    if ([[dict objectForKey:@"blod"] isEqualToString:@"0"]) {
        attribute = @{NSFontAttributeName:[UIFont fontWithName:@"DIN-Bold" size:18]};
    }else   if ([[dict objectForKey:@"bold"] isEqualToString:@"1"]){
        attribute = @{NSFontAttributeName:[UIFont fontWithName:@"DIN-Medium" size:16]};
    }else{
         attribute = @{NSFontAttributeName:[UIFont fontWithName:@"DIN-Regular" size:16]};
    }
    NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
    CGSize size = [[dict objectForKey:@"data"] boundingRectWithSize:CGSizeMake(cellScreenWidth - 40, 10000) options:option attributes:attribute context:nil].size;
    
    if ([[dict objectForKey:@"bold"] isEqualToString:@"2"]) {
        return size.height;
    }else if ([[dict objectForKey:@"bold"] isEqualToString:@"0"]){
        return size.height + 20;
    }else{
        return size.height + 30;
    }
    
    
}

@end
