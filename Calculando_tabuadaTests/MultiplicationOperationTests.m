//
//  MultiplicationOperationTests.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/23/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MultiplicationOperation.h"

#define kOBVIOUS_WRONG_ANSWER 123456

@interface MultiplicationOperationTests : XCTestCase

@property (strong, nonatomic) MultiplicationOperation * operationA;
@property (strong, nonatomic) MultiplicationOperation * operationB;
@property (strong, nonatomic) MultiplicationOperation * randomOperation;
@property (strong, nonatomic) Operation * operationWithoutOperands;

- (void)testIsCorrectAnswerWithRightAnswer;
- (void)testIsCorrectAnswerWithWrongAnswer;

@end

@implementation MultiplicationOperationTests

- (void)setUp {
    [super setUp];
    self.operationA = [[MultiplicationOperation alloc] initWithNumbers: 6 secondNumber: 3];
    self.operationB = [[MultiplicationOperation alloc] initWithNumbers: 7 secondNumber: 9];
    self.randomOperation = [[MultiplicationOperation alloc] initWithRandomNumbers];
    self.operationWithoutOperands = [MultiplicationOperation new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testIsCorrectAnswerWithRightAnswer
{
    XCTAssertTrue([self.operationA isCorrectAnswer: [self.operationA correctAnswer]]);
    XCTAssertTrue([self.operationB isCorrectAnswer: [self.operationB correctAnswer]]);
    XCTAssertTrue([self.randomOperation isCorrectAnswer: [self.randomOperation correctAnswer]]);
}

-(void)testIsCorrectAnswerWithWrongAnswer
{
    XCTAssertFalse([self.operationA isCorrectAnswer: kOBVIOUS_WRONG_ANSWER]);
    XCTAssertFalse([self.operationB isCorrectAnswer: kOBVIOUS_WRONG_ANSWER]);
    XCTAssertFalse([self.randomOperation isCorrectAnswer: kOBVIOUS_WRONG_ANSWER]);
}

@end
