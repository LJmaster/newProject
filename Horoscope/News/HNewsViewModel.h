//
//  HNewsViewModel.h
//  Horoscope
//
//  Created by 刘杰 on 2019/2/19.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsViewModelDelegate <NSObject>

/**
 请求数据成功返回代理

 @param responseObject 请求完成返回的数据
 @param code 请求参数，区分请求
 */
-(void)requestSuccess:(id)responseObject withrcode:(NSInteger)code;

/**
  请求数据失败返回代理

 @param error 错误信息
 @param code 请求参数，区分请求
 */
-(void)requestError:(NSError *)error withrcode:(NSInteger)code;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HNewsViewModel : NSObject

@property(nonatomic,weak) id<NewsViewModelDelegate> delegate;

+(instancetype)shareManager;
/**
 请求分类新闻列表数据

 @param category 分类名称
 @param page 第几页
 @param code code
 */
-(void)getnewsListCategortitle:(NSString *)category withPage:(int)page withRcode:(int)code;

-(void)getnewsDetail:(NSString *)category withnews_id:(NSString*)news_id;

@end

NS_ASSUME_NONNULL_END
