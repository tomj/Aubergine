//
//  AubergineTests.m
//  AubergineTests
//
//  Created by Tom Jowett on 03/28/2015.
//  Copyright (c) 2014 Tom Jowett. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Aubergine/Aubergine.h>
#import <AFNetworking/AFNetworking.h>

static const NSTimeInterval kConnectionTimeout = 20.0;

@interface AubergineExampleTests : XCTestCase
@end

@implementation AubergineExampleTests

- (void)setUp {
    [[AUBRequest sharedInstance] setServerToken:@"JynTiihu9Kf-aORf4XVqY28NmgzBm0fXm6dMI9Tp"];
}

- (void)testProductsRequest {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"success"];
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(37.7759792, -122.41823);
    [AUBRequest getProductsForLocation:location success:^(NSArray *result) {
        XCTAssert(result, @"Pass");
        [expectation fulfill];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        XCTAssert(NO, @"Fail");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:kConnectionTimeout handler:^(NSError *error) {
        if (error) XCTAssertFalse(@"failed");
    }];
}

- (void)testPriceEstimatesRequest {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"success"];
    
    CLLocationCoordinate2D startLocation = CLLocationCoordinate2DMake(-33.9461, 151.1772);
    CLLocationCoordinate2D endLocation = CLLocationCoordinate2DMake(-33.8681, 151.2075);
    
    [AUBRequest getPriceEstimatesForStartLocation:startLocation endLocation:endLocation success:^(NSArray *result) {
        XCTAssert(result, @"Pass");
        [expectation fulfill];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        XCTAssert(NO, @"Fail");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:kConnectionTimeout handler:^(NSError *error) {
        if (error) XCTAssertFalse(@"failed");
    }];
}

- (void)testTimeEstimatesRequest {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"success"];
    
    CLLocationCoordinate2D startLocation = CLLocationCoordinate2DMake(-33.9461, 151.1772);
    CLLocationCoordinate2D endLocation = CLLocationCoordinate2DMake(-33.8681, 151.2075);
    
    [AUBRequest getTimeEstimatesForStartLocation:startLocation endLocation:endLocation success:^(NSArray *result) {
        XCTAssert(result, @"Pass");
        [expectation fulfill];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        XCTAssert(NO, @"Fail");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:kConnectionTimeout handler:^(NSError *error) {
        if (error) XCTAssertFalse(@"failed");
    }];
}

- (void)testPromotionsRequest {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"success"];
    
    CLLocationCoordinate2D startLocation = CLLocationCoordinate2DMake(-33.9461, 151.1772);
    CLLocationCoordinate2D endLocation = CLLocationCoordinate2DMake(-33.8681, 151.2075);
    
    [AUBRequest getPromotionsForStartLocation:startLocation endLocation:endLocation success:^(NSArray *result) {
        XCTAssert(result, @"Pass");
        [expectation fulfill];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        XCTAssert(NO, @"Fail");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:kConnectionTimeout handler:^(NSError *error) {
        if (error) XCTAssertFalse(@"failed");
    }];
}

@end

