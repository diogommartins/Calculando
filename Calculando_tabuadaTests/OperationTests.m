//
//  Calculando_tabuadaTests.m
//  Calculando_tabuadaTests
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Operation.h"

@interface OperationTests : XCTestCase

@property (strong, nonatomic) Operation * operationA;
@property (strong, nonatomic) Operation * operationB;
@property (strong, nonatomic) Operation * randomOperation;

- (void)testIsSameOperationWithEqualOperationsTest;
- (void)testIsSameOperationWithDifferentOperations;
- (void)testContainsOperation;

@end

@implementation OperationTests

- (void)setUp
{
    [super setUp];
    self.operationA = [[Operation alloc] initWithNumbers: arc4random_uniform(MAX_NUMBER_VALUE)
                                            secondNumber: arc4random_uniform(MAX_NUMBER_VALUE)];
    self.operationB = [[Operation alloc] initWithNumbers: arc4random_uniform(MAX_NUMBER_VALUE)
                                            secondNumber: arc4random_uniform(MAX_NUMBER_VALUE)];
    self.randomOperation = [[Operation alloc] initWithRandomNumbers];
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark - Operation

- (void)testIsSameOperationWithDifferentOperations
{
    XCTAssertFalse([self.operationB isSameOperation: self.operationA]);
    XCTAssertFalse([self.operationA isSameOperation: self.operationB]);
    XCTAssertFalse([self.randomOperation isSameOperation: [Operation new]]);
}

- (void)testIsSameOperationWithEqualOperationsTest
{
    XCTAssertTrue([self.randomOperation isSameOperation: self.randomOperation]);
    XCTAssertTrue([self.operationA isSameOperation: self.operationA]);
    XCTAssertTrue([self.operationB isSameOperation: self.operationB]);
}

#pragma mark - NSMutableArray+OperationMutableArray

-(void)testContainsOperation
{
    NSMutableArray * operations = [[NSMutableArray alloc] initWithObjects: self.operationA, nil];
    XCTAssertTrue([operations containsOperation: self.operationA]);
    XCTAssertFalse([operations containsOperation: self.operationB]);
    
    [operations addObject: self.operationB];
    XCTAssertTrue([operations containsOperation: self.operationB]);
}

@end
