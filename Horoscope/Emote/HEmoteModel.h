//
//  HEmoteModel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/25.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HEmoteModel : NSObject

@property(nonatomic,strong) NSString * emoji_hair1;
@property(nonatomic,strong) NSString * emoji_hair2;

@property(nonatomic,strong) NSString * emoji_eye;
@property(nonatomic,strong) NSString * emoji_eyeball;
@property(nonatomic,strong) NSString * emoji_face;
@property(nonatomic,strong) UIColor  * facecolor;
@property(nonatomic,strong) NSString * emoji_huzi;

@property(nonatomic,strong) NSString * emoji_Nose;
@property(nonatomic,strong) NSString * emoji_Mouth;
@property(nonatomic,strong) NSString * emoji_eyebro;
@property(nonatomic,strong) NSString * emoji_white;

@property(nonatomic,strong) UIColor  * emoji_haircolor;
@property(nonatomic,strong) UIColor  * emoji_Earcolor;
@property(nonatomic,strong) NSString * emoji_feature;

@property(nonatomic,assign) int  sex_type;

@end

NS_ASSUME_NONNULL_END
