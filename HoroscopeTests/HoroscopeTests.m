//
//  HoroscopeTests.m
//  HoroscopeTests
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//  所有需要测试的方法名以 test 开头 。 刚添加进去的方法可能左上角的 菱形按钮 不会立即显示 ，你可以 Comand + U  Build 这个测试文件一下 就可以了

#import <XCTest/XCTest.h>
#import <PPNetworkHelper.h>

/**生产服务器*/
#define URL_main @"http://wallpaper-proxy.mafiagameglobal.com"

#pragma mark - ——————— 详细接口地址 ————————
/**生产服务器*/
#define URL_newcategory @"artics/index/"
/**生产服务器*/
#define URL_newlist @"artics/lists/"
/**生产服务器*/
#define URL_newdetail @"artics/detail/"


@interface HoroscopeTests : XCTestCase

@end

@implementation HoroscopeTests

- (void)setUp {
    // 每个类中 测试方法调用前  先调用这个方法  以方便 开发者 做些 测试前的准备
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    // 当这个 类中的 所有的 测试 方法  测试完后  会调用这个方法
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"自定义测试testExample");
    
    int a = 3;
    
    XCTAssertTrue(a,"a 不能 等于 0");
}

- (void)testPerformanceExample {
//    性能测试
    // This is an example of a performance test case.
    [self measureBlock:^{
        

        // Put the code you want to measure the time of here.
    }];
}

/**
 测试接口
 */
-(void)testRequest{
    NSString * urlStr = [NSString stringWithFormat:@"%@/%@?version=%@&platform=%d&app_id=%@",URL_main,URL_newcategory,@"1.0",2,@"com.paper.spacewalk"];
    [PPNetworkHelper GET:urlStr parameters:nil success:^(id responseObject) {
        NSLog(@"正确的输出了数据");
    } failure:^(NSError *error) {
        
    }];
}

/**
 测试
 */
- (void)testAssertSyntax
{
    // 生成一个失败的测试
        XCTFail(@"this is a fail test");
    // XCTAssertNil(a1, format...) 为nil判断， a1 为空时通过，反之不通过；
        XCTAssertNil(@"not a nil string",@"string must be nil");
    //     XCTAssertNil(@"",@"string must be nil");  // 注意@"" 一样无法通过
    XCTAssertNil(nil,@"object must be nil");
    
    // XCTAssertNotNil(a1, format…) 不为nil判断，a1不为  nil 时通过，反之不通过；
    // 注意空  和 nil 还是有区别的
    XCTAssertNotNil(@"not nil string", @"string can not be nil");
    
    //    XCTAssert(expression, format...) 当expression求值为TRUE时通过； expression 为一个表达式
    //    XCTAssert((2 > 2), @"expression must be true");
    XCTAssert((3>2),@"expression is true");
    
    // XCTAssertTrue(expression, format...) 当expression求值为TRUE时通过；>0 的都视为 true
    XCTAssertTrue(1, @"Can not be zero");
    
    // XCTAssertFalse(expression, format...) 当expression求值为False时通过；
    XCTAssertFalse((2 < 2), @"expression must be false");
    
    
    // XCTAssertEqualObjects(a1, a2, format...) 判断相等， [a1 isEqual:a2] 值为TRUE时通过，其中一个不为空时，不通过；
    XCTAssertEqualObjects(@"1", @"1", @"[a1 isEqual:a2] should return YES");
    //    XCTAssertEqualObjects(@"1", @"2", @"[a1 isEqual:a2] should return YES");
    
    
    //     XCTAssertNotEqualObjects(a1, a2, format...) 判断不等， [a1 isEqual:a2] 值为False时通过，
    //        XCTAssertNotEqualObjects(@"1", @"1", @"[a1 isEqual:a2] should return NO");
    XCTAssertNotEqualObjects(@"1", @"2", @"[a1 isEqual:a2] should return NO");
    
    
    // XCTAssertEqual(a1, a2, format...) 判断相等（当a1和a2是 C语言标量、结构体或联合体时使用,实际测试发现NSString也可以）；
    // 1.比较基本数据类型变量
    //    XCTAssertEqual(1, 2, @"a1 = a2 shoud be true"); // 无法通过测试
    XCTAssertEqual(1, 1, @"a1 = a2 shoud be true"); // 通过测试
    
    // 2.比较NSString对象
    NSString *str1 = @"1";
    NSString *str2 = @"1";
    //    NSString *str3 = str1;
    XCTAssertEqual(str1, str2, @"a1 and a2 should point to the same object"); // 通过测试
    //    XCTAssertEqual(str1, str3, @"a1 and a2 should point to the same object"); // 通过测试
    
    // 3.比较NSArray对象
    NSArray *array1 = @[@1];
    NSArray *array2 = @[@1];
    NSArray *array3 = array1;
    //     XCTAssertEqual(array1, array2, @"a1 and a2 should point to the same object"); // 无法通过测试
    XCTAssertEqual(array1, array3, @"a1 and a2 should point to the same object"); // 通过测试
    
    
    // XCTAssertNotEqual(a1, a2, format...) 判断不等（当a1和a2是 C语言标量、结构体或联合体时使用）；
    
    
    // XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...) 判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/- accuracy ）以内相等时通过测试；
    //    XCTAssertEqualWithAccuracy(1.0f, 1.5f, 0.25f, @"a1 = a2 in accuracy should return NO");   // 测试没法通过
    
    
    // XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...) 判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
    XCTAssertNotEqualWithAccuracy(1.0f, 1.5f, 0.25f, @"a1 = a2 in accuracy should return NO");  // 测试通过
    
    
    // XCTAssertThrows(expression, format...) 异常测试，当expression发生异常时通过；反之不通过；（很变态）
    
    
    // XCTAssertThrowsSpecific(expression, specificException, format...) 异常测试，当expression发生 specificException 异常时通过；反之发生其他异常或不发生异常均不通过；
    
    // XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...) 异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
    
    
    // XCTAssertNoThrow(expression, format…) 异常测试，当expression没有发生异常时通过测试；
    
    
    // XCTAssertNoThrowSpecific(expression, specificException, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
    
    
    // XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...) 异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过
}

@end
