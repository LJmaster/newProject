//
//  DesimageCell.m
//  horoscope2018
//
//  Created by 杰刘 on 2018/4/12.
//  Copyright © 2018年 Horoscope 2018 Group. All rights reserved.
//

#import "DesimageCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#define cellScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define cellScreenHeight 60

@implementation DesimageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cellScreenWidth, 170)];
        self.headimageView.contentMode = UIViewContentModeScaleAspectFill;
        self.headimageView.layer.masksToBounds = YES;
        self.headimageView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.headimageView];
        
    }
    
    return self;
    
}
-(void)layoutSubviews{
    
    [self.headimageView sd_setImageWithURL:[NSURL URLWithString:[self.dict objectForKey:@"data"]]
                          placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
//    NSString * url = [self.dict objectForKey:@"content"];
//    if ([[url substringFromIndex:url.length - 1] isEqualToString:@"4"]) {
//        //2.匹配字符串
//        NSString *str3 = [url stringByReplacingOccurrencesOfString:@"?fm=mp4" withString:@""];
//        
//        NSLog(@"截取的值为：%@",str3);
//        [self.headimageView sd_setImageWithURL:[NSURL URLWithString:str3]
//                              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
//    }else{
//        
//        [self.headimageView sd_setImageWithURL:[NSURL URLWithString:[self.dict objectForKey:@"content"]]
//                              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
//        
//    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
