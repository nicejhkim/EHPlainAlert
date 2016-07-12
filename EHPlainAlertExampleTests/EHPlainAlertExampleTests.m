//
//  EHPlainAlertExampleTests.m
//  EHPlainAlertExampleTests
//
//  Created by Danila Gusev on 28/03/2016.
//  Copyright © 2016 josshad. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EHPlainAlert.h"
#import "UIColor+EHColorAdditions.h"

@interface EHPlainAlertExampleTests : XCTestCase

@end

@implementation EHPlainAlertExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testErrorAlert
{
    NSError * testError = [[NSError alloc] initWithDomain:@"My domain"
                                                 code:1337
                                             userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                                        NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The operation timed out.", nil),
                                                        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Have you tried turning it off and on again?", nil)}];
    
    EHPlainAlert * alert = [EHPlainAlert showError:testError];
    
    XCTAssertNotNil(alert);
    XCTAssertTrue([[alert subtitleString] isEqualToString:testError.localizedDescription]);
    
}

- (void)testDomainErrorAlert
{
    NSError * testError = [[NSError alloc] initWithDomain:@"My domain"
                                                     code:1337
                                                 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                                            NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The operation timed out.", nil),
                                                            NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Have you tried turning it off and on again?", nil)}];
    
    EHPlainAlert * alert = [EHPlainAlert showDomainError:testError];
    
    XCTAssertNotNil(alert);
    XCTAssertTrue([[alert titleString] isEqualToString:testError.domain]);
    XCTAssertTrue([[alert subtitleString] isEqualToString:testError.localizedDescription]);
    

    
}

- (void)testAlertShow
{
    EHPlainAlert * alert = [EHPlainAlert showAlertWithTitle:@"123" message:@"123" type:ViewAlertPanic];
    XCTAssertTrue([alert.view superview] != nil);
}


- (void)testThatItInitAlert
{
    EHPlainAlert * alert = [[EHPlainAlert alloc] initWithTitle:@"My title" message:@"My message" type:ViewAlertError];
    XCTAssertNotNil(alert);
    
    alert = [[EHPlainAlert alloc] initWithTitle:@"My title" message:@"My message" type:ViewAlertUnknown];
    XCTAssertNotNil(alert);
    
    alert = [[EHPlainAlert alloc] initWithTitle:@"My title" message:@"My message" type:ViewAlertSuccess];
    XCTAssertNotNil(alert);
    
    alert = [[EHPlainAlert alloc] initWithTitle:@"My title" message:@"My message" type:ViewAlertInfo];
    XCTAssertNotNil(alert);
   
    alert = [[EHPlainAlert alloc] initWithTitle:@"My title" message:@"My message" type:ViewAlertPanic];
    XCTAssertNotNil(alert);
}


- (void)testBehaviourChange
{
    NSInteger hex = arc4random()%0xffffff;
    UIColor * color = [UIColor colorWithHex:hex];
    [EHPlainAlert updateAlertColor:color forType:ViewAlertError];
    UIFont * font = [UIFont systemFontOfSize:20];
    [EHPlainAlert updateTitleFont:font];
    [EHPlainAlert updateSubTitleFont:font];
    [EHPlainAlert updateNumberOfAlerts:1];
    [EHPlainAlert updateHidingDelay:1];
    [EHPlainAlert updateAlertIcon:nil forType:ViewAlertInfo];
    EHPlainAlert * alert = [[EHPlainAlert alloc] initWithTitle:@"My title" message:@"My message" type:ViewAlertError];
    XCTAssertNotNil(alert);
    [alert show];
    XCTAssertEqual(alert.view.backgroundColor,color);
    XCTAssertEqual(alert.titleFont,font);
    XCTAssertEqual(alert.subTitleFont,font);
    
}

- (void)testColor
{
    NSInteger hex = arc4random()%0xffffff;
    UIColor * color = [UIColor colorWithHex:hex];
    XCTAssertEqual(hex, [color getHexColor]);
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        
        for (int i = 0; i < 50; i++)
        {
            [EHPlainAlert showAlertWithTitle:[NSString stringWithFormat:@"%i", i] message:@"Alert" type:ViewAlertInfo];
        }
        // Put the code you want to measure the time of here.
    }];
}

@end
