//
//  PersonalCenterChildBaseVC.m
//  SGPageViewExample
//
//  Created by 杰刘 on 2017/12/14.
//  Copyright © 2017年 Horoscope 2018 Group. All rights reserved.
//

#import "PersonalCenterChildBaseVC.h"

@interface PersonalCenterChildBaseVC ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation PersonalCenterChildBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageTitleViewToTop) name:@"pageTitleViewToTop" object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)pageTitleViewToTop {
    _scrollView.contentOffset = CGPointZero;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
 [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollerrestoreUI" object:nil];
    if (!_scrollView) {
        _scrollView = scrollView;
    }
    if (self.delegatePersonalCenterChildBaseVC && [self.delegatePersonalCenterChildBaseVC respondsToSelector:@selector(personalCenterChildBaseVCScrollViewDidScroll:)]) {
        [self.delegatePersonalCenterChildBaseVC personalCenterChildBaseVCScrollViewDidScroll:scrollView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
