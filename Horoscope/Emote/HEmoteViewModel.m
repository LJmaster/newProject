//
//  HEmoteViewModel.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/25.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HEmoteViewModel.h"
#import "UIColor+HColor.h"
#import "UIImage+Himage.h"

#define kuserfilename @"emoteusermodel"

@implementation HEmoteViewModel



+(NSArray *)dataofManorWoman:(int)sextype{
    
    NSArray * womanmoji = [[NSArray alloc] initWithObjects:
@[@"face1",@"face2",@"face3",@"face4",@"face5",@"face6",@"face7",@"face8",@"face9",@"face10"],
                           
@[@[@"hair1qian",@"hair1hou"],@[@"hair2"],@[@"hair3qian",@"hair3hou"],@[@"hair4"],@[@"hair5qian",@"hair5hou"],@[@"hair6qian",@"hair6hou"],@[@"hair7qian",@"hair7hou"],@[@"hair8"],@[@"hair9qian",@"hair9hou"],@[@"hair10"],@[@"hair11qian",@"hair11hou"]],
                           
@[@[@"eye1",@"1"],@[@"eye2",@"2"],@[@"eye3",@"3"],@[@"eye4",@"4"],@[@"eye5",@"5"],@[@"eye6",@"6"],@[@"eye7",@"8"],@[@"eye8",@"8"],@[@"eye9",@"9"],@[@"eye10",@"10"]],
                           
@[@"eyebrow1",@"eyebrow2",@"eyebrow3",@"eyebrow4",@"eyebrow5",@"eyebrow6",@"eyebrow7",@"eyebrow8",@"eyebrow9",@"eyebrow10"],
                           
@[@"nose1",@"nose2",@"nose3",@"nose4",@"nose5",@"nose6",@"nose7",@"nose8",@"nose9",@"nose10"],
                           
@[@"mouth1",@"mouth2",@"mouth3",@"mouth4",@"mouth5",@"mouth6",@"mouth7",@"mouth8",@"mouth9",@"mouth10"],
                           
@[@"feature_1",@"feature_2",@"feature_3",@"feature_4",@"feature_5",@"feature_6",@"feature_7",@"feature_8",@"feature_9",@"feature_10",@"feature_11",@"feature_12"],
                           
@[],
                           
@[@"FFF3EE",@"FFEEE3",@"FFE5D2",@"F9D9CA",@"F4CEBD",@"F7CAB2",@"EFBEA3",@"EEA78E",@"D8967C",@"EFBB94",@"B7866D",@"8E614B",@"915A3F",@"704834",@"6C4025",@"513120",@"44261B",@"32B16C",@"32B1B0",@"3432B1"],
                           
@[@"000000",@"3F3F3F",@"E54646",@"622A00",@"E88304",@"FECE29",@"FCE3B5",@"FAD790",@"F2C360",@"D79D4B",@"87BF42",@"CA6633",@"58341A",@"498BCA",@"5D57A4",@"CFCFCF"],
                           
@[@"A8A8A8",@"000000",@"4F4F4F",@"A52222",@"552C06",@"9A4B02",@"31738A",@"A3C2D7",@"3B6392",@"975636",@"2F746F",@"2F3774",@"4C0734",@"710606"],
                           
@[@"white1",@"white2",@"white3",@"white4",@"white5",@"white6",@"white7",@"white8",@"white9",@"white10"],
                           nil];
    
    
    NSArray * manmoji = [[NSArray alloc] initWithObjects:
@[@"manface1",@"manface2",@"manface3",@"manface4",@"manface5",@"manface6",@"manface7",@"manface8",@"manface9",@"manface10"],

@[@[@"manhair3"],@[@"manhair2qian",@"manhair2hou"],@[@"manhair1"],@[@"manhair4"],@[@"manhair5"],@[@"manhair6"],@[@"manhair7qian",@"manhair7hou"],
@[@"manhair8qian",@"manhair8hou"],@[@"manhair9qian",@"manhair9hou"],@[@"manhair10"]],

@[@[@"maneye1",@"m1"],@[@"maneye2",@"m2"],@[@"maneye3",@"m3"],@[@"maneye4",@"m4"],@[@"maneye5",@"m5"],@[@"maneye6",@"m6"],@[@"maneye7",@"m7"],@[@"maneye8",@"m8"],@[@"maneye9",@"m9"],@[@"maneye10",@"m1o"]],
                         
@[@"maneyebrow1",@"maneyebrow2",@"maneyebrow3",@"maneyebrow4",@"maneyebrow5",@"maneyebrow6",@"maneyebrow7",@"maneyebrow8",@"maneyebrow9",@"maneyebrow10"],
                         
@[@"nose1",@"nose2",@"nose3",@"nose4",@"nose5",@"nose6",@"nose7",@"nose8",@"nose9",@"nose10"],
                         
@[@"manmouth1",@"manmouth2",@"manmouth3",@"manmouth4",@"manmouth5",@"manmouth6",@"manmouth7",@"manmouth8",@"manmouth9",@"manmouth10"],
                         
@[@"feature_1",@"feature_2",@"feature_3",@"feature_4",@"feature_5",@"feature_6",@"feature_7",@"feature_8",@"feature_9",@"feature_10",@"feature_11",@"feature_12"],
                         
@[@"huzi-nil",@"huzi1",@"huzi2",@"huzi3",@"huzi4",@"huz5",@"huzi6"],
                         
@[@"FFF3EE",@"FFEEE3",@"FFE5D2",@"F9D9CA",@"F4CEBD",@"F7CAB2",@"EFBEA3",@"EEA78E",@"D8967C",@"EFBB94",@"B7866D",@"8E614B",@"915A3F",@"704834",@"6C4025",@"513120",@"44261B",@"32B16C",@"32B1B0",@"3432B1"],
                         
@[@"000000",@"3F3F3F",@"E54646",@"622A00",@"E88304",@"FECE29",@"FCE3B5",@"FAD790",@"F2C360",@"D79D4B",@"87BF42",@"CA6633",@"58341A",@"498BCA",@"5D57A4",@"CFCFCF"],
                         
@[@"A8A8A8",@"000000",@"4F4F4F",@"A52222",@"552C06",@"9A4B02",@"31738A",@"A3C2D7",@"3B6392",@"975636",@"2F746F",@"2F3774",@"4C0734",@"710606"],
                         
@[@"mwhite1",@"mwhite2",@"mwhite3",@"mwhite4",@"mwhite5",@"mwhite6",@"mwhite7",@"mwhite8",@"mwhite9",@"mwhite10"],
                         nil];
    
    if (sextype == 1) {
        return manmoji;
    }else{
        return womanmoji;
    }
    
}

+(HEmoteModel *)getRandomFaceData:(int)sextype{
    
    NSArray * allemoji = [HEmoteViewModel dataofManorWoman:sextype];
    
    HEmoteModel * userModel = [[HEmoteModel alloc] init];
    
    
    //    头发
    NSArray * hair = allemoji[1];
    NSArray * hairarr = hair[arc4random() % 5];
    
    if (hairarr.count == 1) {
        userModel.emoji_hair1 =  hairarr[0];
        userModel.emoji_hair2 =  @"";
    }else{
        
        userModel.emoji_hair1 = hairarr[0];
        userModel.emoji_hair2 = hairarr[1];
    }
    
    //    眼睛随机次数
    int eyeRandm = arc4random() % 10;
    NSArray * eye = allemoji[2];
    NSArray * eyearr = eye[eyeRandm];
    userModel.emoji_eye = eyearr[0];
    userModel.emoji_eyeball = eyearr[1];
    userModel.emoji_feature = @"";
    userModel.emoji_huzi = @"";
    
    userModel.emoji_face = allemoji[0][arc4random() % 10];
    userModel.emoji_eyebro = allemoji[3][arc4random() % 10];
    userModel.emoji_Nose = allemoji[4][arc4random() % 10];
    userModel.emoji_Mouth = allemoji[5][arc4random() % 10];
    userModel.emoji_white = allemoji[11][eyeRandm];
    userModel.sex_type = sextype;
    userModel.facecolor = [UIColor colorWithHexString:allemoji[8][arc4random() % 10]];
    userModel.emoji_haircolor = [UIColor colorWithHexString:allemoji[9][arc4random() % 10]];
    
    userModel.emoji_Earcolor = [UIColor grayColor];
    
    return userModel;
    
}
+(UIImage *)randomFacewithSex:(int)sextype{
    

    HEmoteModel * userModel = [HEmoteViewModel getRandomFaceData:sextype];
    
    return [HEmoteViewModel creatFacewithmodel:userModel];
    
}
+(UIImage *)creatFacewithmodel:(HEmoteModel *)userModel{
    
    //        头发后
    //        脸，
    //        鼻子，
    //        嘴巴，
    //        眉毛，
    //        眼白，
    //        特征（有些是要被头发遮挡 ，还有一部分是要被眼睛遮挡的，这一步需要），
    //        眼珠，
    //        头发前（头发是分前后层的需要处理，这个可能需要两层，后一层头发需要将试图放到最后），
    //        胡子
    
    UIImage * faceimageqianhou = [[UIImage imageNamed:userModel.emoji_hair2] imageWithBgColor:userModel.emoji_haircolor];
    UIImage * facimage = [[UIImage imageNamed:userModel.emoji_face] imageWithBgColor:userModel.facecolor];
    UIImage * Noseimage = [UIImage imageNamed:userModel.emoji_Nose];
    UIImage * Mouthimage = [UIImage imageNamed:userModel.emoji_Mouth];
    UIImage * eyebroimage = [UIImage imageNamed:userModel.emoji_eyebro];//眉毛
    UIImage * eyewhiteimage = [UIImage imageNamed:userModel.emoji_white];//yanbai
    UIImage * eyeimage = [UIImage imageNamed:userModel.emoji_eye];
    UIImage * eyeballimage = [[UIImage imageNamed:userModel.emoji_eyeball] imageWithBgColor:userModel.emoji_Earcolor];//眼球
    UIImage * feature1image = [UIImage imageNamed:userModel.emoji_feature];
//    UIImage * feature2image = [UIImage imageNamed:userModel.emoji_feature];
    UIImage* faceimageqian = [[UIImage imageNamed:userModel.emoji_hair1] imageWithBgColor:userModel.emoji_haircolor];
    
    // 得到图片绘制上下文，指定绘制区域
    UIGraphicsBeginImageContext(CGSizeMake(250, 250));
    
    [faceimageqianhou drawInRect:CGRectMake(0, 0, 250, 250)];
    [facimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [Noseimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [Mouthimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [eyebroimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [eyewhiteimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [eyeballimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [eyeimage drawInRect:CGRectMake(0, 0, 250, 250)];
    [feature1image drawInRect:CGRectMake(0, 0, 250, 250)];
//    [feature2image drawInRect:CGRectMake(0, 0, 250, 250)];
    [faceimageqian drawInRect:CGRectMake(0, 0, 250, 250)];
    
    // 从当前图片上下文中得到image
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //    self.useremojiIV.image = resultingImage;
    return resultingImage;
}


//写入
- (BOOL)writeWithEmote:(id)data{
    NSString *path = [self userstringByAppendingPathComponent:kuserfilename];
    NSData *temp = [NSKeyedArchiver archivedDataWithRootObject:data];
    return [NSKeyedArchiver archiveRootObject:temp toFile:path];
}

//读取
- (id)readWithEmote{
    
    NSString *path = [self userstringByAppendingPathComponent:kuserfilename];
    NSData *data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!data) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
}

//移除
- (BOOL)removeEmote{
    
    NSString *path = [self userstringByAppendingPathComponent:kuserfilename];
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


//获取documents文件夹下对应的目录
- (NSString *)userstringByAppendingPathComponent:(NSString *)filename{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [documents stringByAppendingPathComponent:filename];
}
@end
