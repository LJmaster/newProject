//
//  HoroscopeUITests.m
//  HoroscopeUITests
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HoroscopeUITests : XCTestCase

@end

@implementation HoroscopeUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //  如果发生 测试不通过的情况 ，最好 停止程序的运行
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//    UI 测试必须 等应用 先开启 ，这个方法 可以确保应用的开启 在每个测试方法 测试的时候
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testlogin{
    [[[XCUIApplication alloc] init].tables/*@START_MENU_TOKEN@*/.cells.tables.staticTexts[@"Overall"]/*[[".cells.tables",".cells.staticTexts[@\"Overall\"]",".staticTexts[@\"Overall\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[1,0]]@END_MENU_TOKEN@*/ tap];
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *collectionViewsQuery = app.collectionViews;
    XCUIElement *star02Button = collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"star 02"]/*[[".cells.buttons[@\"star 02\"]",".buttons[@\"star 02\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [star02Button swipeLeft];
    
    XCUIElement *star03Button = collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"star 03"]/*[[".cells.buttons[@\"star 03\"]",".buttons[@\"star 03\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    /*@START_MENU_TOKEN@*/[star03Button swipeRight];/*[["star03Button","["," swipeDown];"," swipeRight];"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/
    [star02Button swipeRight];
    [star03Button swipeLeft];
    
    XCUIElement *star04Button = collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons[@"star 04"]/*[[".cells.buttons[@\"star 04\"]",".buttons[@\"star 04\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    /*@START_MENU_TOKEN@*/[star04Button swipeRight];/*[["star04Button","["," swipeDown];"," swipeRight];"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/
    
    XCUIElement *element = [[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1];
    [element.buttons[@"Next"] tap];
    
    XCUIElement *nextButton = app.buttons[@"Next"];
    [nextButton tap];
    [nextButton tap];
    [app.buttons[@"btnMan"] swipeUp];
    [element swipeUp];
    [app.buttons[@"Start"] tap];
    [app.buttons[@"btnMarried"] tap];
    [app.buttons[@"personal information"] tap];
    [star04Button tap];
    
    XCUIElementQuery *tablesQuery = app.tables;
    [[tablesQuery.otherElements containingType:XCUIElementTypeButton identifier:@"Traits    "].element tap];
    [tablesQuery.buttons[@"7 Days    "] tap];
    [tablesQuery/*@START_MENU_TOKEN@*/.tables.staticTexts[@"Financial matters are under favorable stars at the moment and if you make an effort to do something new on the work Financial matters are under.on the work Financial matters are undern."]/*[[".cells.tables",".cells.staticTexts[@\"Financial matters are under favorable stars at the moment and if you make an effort to do something new on the work Financial matters are under.on the work Financial matters are undern.\"]",".staticTexts[@\"Financial matters are under favorable stars at the moment and if you make an effort to do something new on the work Financial matters are under.on the work Financial matters are undern.\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/ tap];
    
    
}

@end
