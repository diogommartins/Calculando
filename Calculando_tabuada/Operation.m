//
//  Operation.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "Operation.h"

@implementation Operation

-(BOOL)isSameOperation:(Operation *)operation{
    if([operation class] == [self class])
        if(operation.firstNumber == self.firstNumber)
            if(operation.secondNumber == self.secondNumber)
                return true;
    return false;
}

- (BOOL) isCorrectUserAnswer{
    return self.userAnswer == [self correctAnswer];
}

-(BOOL)isCorrectAnswer:(int)answer
{
    return [self correctAnswer] == answer;
}

- (void) setUserAnswer:(int)userAnswer secondsLeft:(int)seconds{
    self.userAnswer = userAnswer;
    self.secondsLeft = seconds;
    self.timestamp = [[NSDate date] timeIntervalSince1970];
}

- (instancetype)initWithNumbers:(int)firstNumber secondNumber:(int)secondNumber{
    if (self = [super init])
    {
        self.firstNumber = firstNumber;
        self.secondNumber = secondNumber;
    }
    return self;
}

-(instancetype)initWithRandomNumbers{
    if (self = [super init])
    {
        self.firstNumber = arc4random_uniform(MAX_NUMBER_VALUE);
        self.secondNumber = arc4random_uniform(MAX_NUMBER_VALUE);
    }
    return self;
}
@end

@implementation NSMutableArray (OperationMutableArray)

-(BOOL)containsOperation:(Operation *)operation{
    for (Operation * o in self)
        if ([o isSameOperation:operation])
            return true;
    return false;
}

@end