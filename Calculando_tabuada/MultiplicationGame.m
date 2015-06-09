//
//  MultiplicationGame.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "MultiplicationGame.h"

@implementation MultiplicationGame


-(instancetype)init{
    if (self = [super init])
    {
        self.score = 0;
        self.operations = [NSMutableArray new];
        [self changeCurrentOperation];
    }
    return self;
}

#pragma mark - Game Protocol methods
/**
 @todo Se não houver mais nenhuma operação única, pode gerar uma recursão infinita e o app travará
 */
- (MultiplicationOperation *)getNewUniqueOperation{
    MultiplicationOperation * operation = [[MultiplicationOperation alloc] initWithRandomNumbers];
    
    if(![self.operations containsOperation:operation]){
        [self.operations addObject:operation];
        return operation;
    }
    return [self getNewUniqueOperation];
}

- (void)changeCurrentOperation{
    self.score += [self getCurrentOperationScore];
    self.currentOperation = [self getNewUniqueOperation];
}

-(int)getCurrentOperationScore{
    MultiplicationOperation * lastOperation = [self.operations lastObject];
    if ([self.currentOperation isCorrectUserAnswer]){
        if (([lastOperation timestamp] - [self.currentOperation timestamp]) <= TIME_DELTA_FOR_BONUS)
            return RIGHT_ANSWER_TIME_BONUS_POINTS + RIGHT_ANSWER_DEFAULT_POINTS;
        return RIGHT_ANSWER_DEFAULT_POINTS;
    }
    return 0;
}

@end
