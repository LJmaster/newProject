
//
//  HEmoteView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//
//面部b拼凑的顺序
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

#import "HEmoteView.h"
#import "HEmoteModel.h"
#import "HEmoteViewModel.h"



@interface HEmoteView ()

@property (nonatomic, strong) UIView         * faceallView;
@property (nonatomic, strong) NSMutableArray * faceViewArray;
@property (nonatomic, assign) int              sextype;
@property (nonatomic, strong) HEmoteModel    * userModel;

@end

@implementation HEmoteView


-(NSMutableArray *)faceViewArray{
    if (_faceViewArray == nil) {
        _faceViewArray = [[NSMutableArray alloc] init];
    }
    return _faceViewArray;
}

- (instancetype)initWithFrame:(CGRect)frame withuserSex:(int)sextype
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sextype = sextype;
        
        self.userModel= [[HEmoteModel alloc] init];
        
        self.faceallView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 250, 250)];
        self.faceallView.centerX = self.centerX;
        [self addSubview:self.faceallView];
        //        脸
        for (int i = 0; i< 11; i++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.faceallView.bounds];
            [self.faceViewArray addObject:imageView];
            [self.faceallView addSubview:imageView];
            imageView.tag = 100 + i;
            //            imageView.backgroundColor = randomColor;
        }
        
        
        self.userModel = [HEmoteViewModel getRandomFaceData:sextype];
        UIImageView * imagev1 =   self.faceViewArray[9];
        imagev1.image = [[UIImage imageNamed:self.userModel.emoji_hair1] imageWithBgColor:self.userModel.emoji_haircolor];
        UIImageView * imagev2 =   self.faceViewArray[0];
        imagev2.image = [[UIImage imageNamed:self.userModel.emoji_hair2] imageWithBgColor:self.userModel.emoji_haircolor];
        UIImageView * facimagev =   self.faceViewArray[1];
        facimagev.image = [[UIImage imageNamed:self.userModel.emoji_face] imageWithBgColor:self.userModel.facecolor];
        UIImageView * Noseimagev =   self.faceViewArray[2];
        Noseimagev.image = [UIImage imageNamed:self.userModel.emoji_Nose];
        UIImageView * Mouthimagev =   self.faceViewArray[3];
        Mouthimagev.image = [UIImage imageNamed:self.userModel.emoji_Mouth];
        UIImageView * eyebroimagev =   self.faceViewArray[4];
        eyebroimagev.image = [UIImage imageNamed:self.userModel.emoji_eyebro];
        UIImageView * whiteimagev =   self.faceViewArray[5];
        whiteimagev.image = [UIImage imageNamed:self.userModel.emoji_white];
        UIImageView * eyeimagev =   self.faceViewArray[8];
        eyeimagev.image = [UIImage imageNamed:self.userModel.emoji_eye];
        UIImageView * eyeballimagev =   self.faceViewArray[6];
        eyeballimagev.image = [[UIImage imageNamed:self.userModel.emoji_eyeball] imageWithBgColor:self.userModel.emoji_Earcolor];
        UIImageView * fea1imagev =   self.faceViewArray[7];
        fea1imagev.image = [UIImage imageNamed:self.userModel.emoji_feature];
        UIImageView * fea2imagev =   self.faceViewArray[10];
        fea2imagev.image = [UIImage imageNamed:self.userModel.emoji_feature];
        
    }
    return self;
}


-(void)changeEmoji:(NSIndexPath *)index {
    
    NSArray * emotearray = [HEmoteViewModel dataofManorWoman:self.sextype];
    
    
    switch (index.section) {
        case 0://脸部
        {
            UIImageView * facimagev =   self.faceViewArray[1];
            UIImage * faceImage = [UIImage imageNamed:emotearray[0][index.row]];
            //            facimagev.image = [faceImage imageWithBgColor:userModel.facecolor];
            facimagev.image = faceImage;
            self.userModel.emoji_face = emotearray[0][index.row];
        }
            break;
        case 1://发型
        {
            NSArray * hairArr  = emotearray[1][index.row];
            if (hairArr.count == 1) {
                UIImageView * hairqianview =   self.faceViewArray[9];
                hairqianview.image = [UIImage imageNamed:hairArr[0]];
                self.userModel.emoji_hair1 = hairArr[0];
            }else{
                UIImageView * hairqianview =   self.faceViewArray[9];
                UIImageView * hairhouview =   self.faceViewArray[0];
                hairqianview.image = [UIImage imageNamed:hairArr[0]];
                hairhouview.image = [UIImage imageNamed:hairArr[1]];
                self.userModel.emoji_hair1 = hairArr[0];
                self.userModel.emoji_hair2 = hairArr[1];
            }
        }
            break;
        case 2://眼睛
        {
            NSArray * eyeArr  = emotearray[2][index.row];
            UIImageView * eyeview =   self.faceViewArray[8];
            UIImageView * eyeballview =   self.faceViewArray[6];
            UIImageView * eyewhiteview =   self.faceViewArray[5];
            
            eyeview.image = [UIImage imageNamed:eyeArr[0]];
            eyeballview.image = [[UIImage imageNamed:eyeArr[1]] imageWithBgColor: [UIColor colorWithHexString:@"6f6f6f"]];
            eyewhiteview.image = [UIImage imageNamed:emotearray[11][index.row]];
            
            self.userModel.emoji_eye = eyeArr[0];
            self.userModel.emoji_eyeball = eyeArr[1];
            self.userModel.emoji_white = emotearray[11][index.row];
        }
            break;
        case 3://眉毛
        {
            UIImageView * eyebroview =   self.faceViewArray[4];
            eyebroview.image = [UIImage imageNamed:emotearray[3][index.row]];
            
            self.userModel.emoji_eyebro = emotearray[3][index.row];
        }
            break;
        case 4:
        {
            UIImageView * Noseview =   self.faceViewArray[2];
            Noseview.image = [UIImage imageNamed:emotearray[4][index.row]];
            
            self.userModel.emoji_Nose = emotearray[4][index.row];
        }
            break;
        case 5:
        {
            UIImageView * Mouthview =   self.faceViewArray[3];
            Mouthview.image = [UIImage imageNamed:emotearray[5][index.row]];
            
            self.userModel.emoji_Mouth = emotearray[5][index.row];
        }
            break;
        case 6://特征
        {
            UIImageView * featureview =   self.faceViewArray[7];
            featureview.image = [UIImage imageNamed:emotearray[6][index.row]];
            
            self.userModel.emoji_feature = emotearray[6][index.row];
        }
            break;
        case 7://胡子
        {
            UIImageView * huziview =   self.faceViewArray[10];
            huziview.image = [UIImage imageNamed:emotearray[7][index.row]];
            
            self.userModel.emoji_huzi = emotearray[7][index.row];
        }
            break;
        case 8://面部颜色
        {
            UIImage * faceimag = [UIImage imageNamed:self.userModel.emoji_face];
            UIImageView * facimagev =   self.faceViewArray[1];
            facimagev.image = [faceimag imageWithBgColor:[UIColor colorWithHexString:emotearray[8][index.row]]];
            
            self.userModel.facecolor = [UIColor colorWithHexString:emotearray[8][index.row]];
        }
            break;
        case 9://发型颜色
        {
            
            UIImageView * hairqianview =   self.faceViewArray[9];
            UIImageView * hairhouview =   self.faceViewArray[0];
            hairqianview.image = [[UIImage imageNamed:self.userModel.emoji_hair1] imageWithBgColor:[UIColor colorWithHexString:emotearray[9][index.row]]];
            hairhouview.image = [[UIImage imageNamed: self.userModel.emoji_hair2] imageWithBgColor:[UIColor colorWithHexString:emotearray[9][index.row]]];
            
            self.userModel.emoji_haircolor = [UIColor colorWithHexString:emotearray[9][index.row]];
        }
            break;
        case 10://眼珠颜色
        {
            
            UIImageView * eyeballview =   self.faceViewArray[6];
            eyeballview.image = [[UIImage imageNamed:self.userModel.emoji_eyeball] imageWithBgColor: [UIColor colorWithHexString:emotearray[9][index.row]]];
            
            self.userModel.emoji_Earcolor = [UIColor colorWithHexString:emotearray[9][index.row]];
        }
            break;
        default:
            break;
    }
    
    
}

-(UIImage *)endEmoj{
    
    UIImage * faceemoji = [HEmoteViewModel creatFacewithmodel:self.userModel];
    
    return faceemoji;
}
@end
