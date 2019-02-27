//
//  HEmoteViewModel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/25.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HEmoteModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HEmoteViewModel : NSObject


/**
 面部表情数据获取
 */
+(NSArray *)dataofManorWoman:(int)sextype;

/**
 随机面部数据

 */
+(HEmoteModel *)getRandomFaceData:(int)sextype;

/**
 生成随机表情
 */
+(UIImage *)randomFacewithSex:(int)sextype;


/**
 生成表情贴图
 */
+(UIImage *)creatFacewithmodel:(HEmoteModel *)userModel;



//写入
- (BOOL)writeWithEmote:(id)data;
//读取
- (id)readWithEmote;
//移除
- (BOOL)removeEmote;

@end

NS_ASSUME_NONNULL_END
