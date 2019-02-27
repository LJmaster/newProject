//
//  HMatchModel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/1/23.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HMatchModel : NSObject

/**姓名*/
@property(nonatomic, copy)   NSString  * leftMatchName;
/**是否完成选择*/
@property(nonatomic, assign) BOOL        leftisEndSelect;
/**刚开始选择*/
@property(nonatomic, assign) BOOL        leftisSartSelect;
/**选中的星球tag*/
@property(nonatomic, assign) int         lefthoroscopeTag;




/**姓名*/
@property(nonatomic, copy)   NSString  * rightMatchName;
/**是否完成选择*/
@property(nonatomic, assign) BOOL        rightisEndSelect;
/**刚开始选择*/
@property(nonatomic, assign) BOOL        rightisSartSelect;
/**选中的星球tag*/
@property(nonatomic, assign) int         righthoroscopeTag;

@end

