//
//  HNewsViewModel.m
//  Horoscope
//
//  Created by 刘杰 on 2019/2/19.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HNewsViewModel.h"

@implementation HNewsViewModel

+(instancetype)shareManager{
    static HNewsViewModel * vm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vm = [[self alloc] init];
    });
    return vm;
}


-(void)getnewsListCategortitle:(NSString *)category withPage:(int)page withRcode:(int)code{
    
    NSString * urlStr = [NSString stringWithFormat:@"%@/%@?version=%@&platform=%d&app_id=%@&category=%@&page=%d&count=20",URL_main,URL_newlist,@"1.0",2,@"com.paper.spacewalk",category,page];
    
    [PPNetworkHelper GET:urlStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(requestSuccess:withrcode:)]) {
            [self.delegate requestSuccess:responseObject withrcode:code];
        }
    } failure:^(NSError *error) {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(requestError:withrcode:)]) {
            [self.delegate requestError:error withrcode:code];
        }
    }];
}

-(void)getnewsDetail:(NSString *)category withnews_id:(NSString*)news_id{
    
    NSString * urlStr = [NSString stringWithFormat:@"%@/%@?version=%@&platform=%d&app_id=%@&category=%@&news_id=%@",URL_main,URL_newdetail,@"1.0",2,@"com.paper.spacewalk",category,news_id];
    [PPNetworkHelper GET:urlStr parameters:nil responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(requestSuccess:withrcode:)]) {
            [self.delegate requestSuccess:responseObject withrcode:1];
        }
    } failure:^(NSError *error) {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(requestError:withrcode:)]) {
            [self.delegate requestError:error withrcode:1];
        }
    }];

}

@end
