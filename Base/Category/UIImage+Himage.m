//
//  UIImage+Himage.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/25.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "UIImage+Himage.h"

@implementation UIImage (Himage)

-(UIImage *)imageWithBgColor:(UIColor *)color{
    
    UIGraphicsBeginImageContextWithOptions(self.size, false, 1.0);
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:kCGBlendModeMultiply alpha:1];
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1];
    UIImage * reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return reSizeImage;
    
}

@end
