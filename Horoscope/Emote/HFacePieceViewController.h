//
//  HFacePieceViewController.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/18.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "RootViewController.h"

@protocol SelectFaceDelegate <NSObject>
-(void)selectFaceComponentIndexPath:(NSIndexPath *)selectIndexPath;
@end

NS_ASSUME_NONNULL_BEGIN

@interface HFacePieceViewController : RootViewController
@property(nonatomic,weak) id<SelectFaceDelegate>  delegate;
@property(nonatomic,strong)NSArray * facearray;
@property(nonatomic,assign)int       facetype;

@end

NS_ASSUME_NONNULL_END
