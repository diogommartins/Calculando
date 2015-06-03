//
//  MultiplicationGame.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "MultiplicationGame.h"

@interface MultiplicationGame()

/**
 @todo Se não houver mais nenhuma operação única, pode gerar uma recursão infinita e o app travará
 */
- (MultiplicationOperation *) getNewUniqueOperation;

@end

@implementation MultiplicationGame

- (MultiplicationOperation *)getNewUniqueOperation{
    MultiplicationOperation * operation = [[MultiplicationOperation alloc] initWithRandomNumbers];
    
    if(![self.operations containsOperation:operation]){
        [self.operations addObject:operation];
        return operation;
    }
    return [self getNewUniqueOperation];
}

- (void)changeCurrentOperation{
    self.currentOperation = [self getNewUniqueOperation];
}

-(instancetype)init{
    if (self = [super init])
    {
        self.operations = [NSMutableArray new];
        [self changeCurrentOperation];
    }
    return self;
}

@end
