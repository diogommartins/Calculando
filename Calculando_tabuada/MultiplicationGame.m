//
//  MultiplicationGame.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "MultiplicationGame.h"

@interface MultiplicationGame()

- (MultiplicationOperation *) getNewUniqueOperation;

@end

@implementation MultiplicationGame

- (MultiplicationOperation *)getNewUniqueOperation{
    MultiplicationOperation * operation = [[MultiplicationOperation alloc] initWithRandomNumbers];
    
    if([self.operations containsOperation:operation])
        [self getNewUniqueOperation];
    
    [self.operations addObject:operation];
    return operation;
}

- (void)changeCurrentOperation{
    self.currentOperation = [self getNewUniqueOperation];
}

-(instancetype)init{
    if (self = [super init])
    {
        [self changeCurrentOperation];
    }
    return self;
}

@end
