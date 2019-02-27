//
//  HTPolygonCell.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/15.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HTPolygonCell.h"

@implementation HTPolygonCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.polygonView = [[ZLPolygonView alloc]initWithFrame:CGRectMake(80, 00, KScreenWidth - 160, KScreenWidth - 160)];
        //    self.polygonView.backgroundColor = [UIColor yellowColor];
        self.polygonView.dividerNumber = 5;
        self.polygonView.innerColor = [UIColor redColor];
        self.polygonView.arrayPolygons = @[@(1.0), @(0.8), @(0.5), @(0.7), @(1.0), @(0.5), @(0.2)];
        self.polygonView.arrayLabels = @[@"love", @"Money", @"Career", @"Health", @"Pushing",@"Pushing",@"Pushing"];
        [self addSubview:self.polygonView];
        
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

@end
