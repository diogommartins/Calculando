//
//  MultiplicationGameTests.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/23/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MultiplicationGame.h"

@interface MultiplicationGameTests : XCTestCase <GameDelegate>

@property (strong, nonatomic) MultiplicationGame * game;
@property (strong, nonatomic) MultiplicationGame * gameWithDelegate;
@property (strong, nonatomic) MultiplicationGame * gameWithDelegateAndUsername;

@property BOOL callbackInvoked;
@property NSNumber * points;

// GameDelegate
-(void) testScoreDidChangeDelegation;
-(void) testScoreDidChangeDelegationWithCorrectAnswer;
-(void) testScoreDidChangeDelegationWithWrongAnswer;

@end

@implementation MultiplicationGameTests

- (void)setUp {
    [super setUp];
    
    self.game = [MultiplicationGame new];
    self.gameWithDelegate = [[MultiplicationGame alloc] initWithDelegate:self username:nil];
    self.gameWithDelegateAndUsername = [[MultiplicationGame alloc] initWithDelegate:self username:@"thename"];
    self.callbackInvoked = NO;
}

- (void)tearDown {
    self.points = nil;
    self.callbackInvoked = NO;
    [super tearDown];
}

#pragma mark - GameDelegate

-(void)scoreDidChangeWithPoints:(int)points
{
    self.callbackInvoked = YES;
    if (points)
        self.points = [NSNumber numberWithInt: points];
}

#pragma mark - GameDelegate Tests

-(void)testScoreDidChangeDelegation
{
    [self.gameWithDelegate.currentOperation setUserAnswer: [self.gameWithDelegate.currentOperation correctAnswer]
                                              secondsLeft: 10];
    [self.gameWithDelegate changeCurrentOperation];
    XCTAssertTrue(self.callbackInvoked);
}

-(void)testScoreDidChangeDelegationWithCorrectAnswer
{
    [self.gameWithDelegate.currentOperation setUserAnswer: [self.gameWithDelegate.currentOperation correctAnswer]
                                              secondsLeft: 10];
    [self.gameWithDelegate changeCurrentOperation];
    XCTAssertTrue(self.callbackInvoked);
    XCTAssertNotNil(self.points);
}

-(void)testScoreDidChangeDelegationWithWrongAnswer
{
    [self.gameWithDelegate.currentOperation setUserAnswer: [self.gameWithDelegate.currentOperation correctAnswer] - 1
                                              secondsLeft: 10];
    [self.gameWithDelegate changeCurrentOperation];
    XCTAssertFalse(self.callbackInvoked);
    XCTAssertNil(self.points);
}



@end
