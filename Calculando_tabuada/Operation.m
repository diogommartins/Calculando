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
    return [self.userAnswer intValue] == [self correctAnswer];
}

-(BOOL)isCorrectAnswer:(int)answer
{
    return [self correctAnswer] == answer;
}

- (void) setUserAnswer:(NSNumber *)userAnswer timer:(Timer *)timer{
    self.userAnswer = userAnswer;
    self.secondsLeft = [timer seconds];
    self.timestamp = [[NSDate date] timeIntervalSince1970];
}

-(instancetype)initWithRandomNumbers{
    if (self = [super init])
    {
        [self setFirstNumber: arc4random_uniform(MAX_NUMBER_VALUE)];
        [self setSecondNumber: arc4random_uniform(MAX_NUMBER_VALUE)];
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