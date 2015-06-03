//
//  Operation.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAX_NUMBER_VALUE 10

@interface Operation : NSObject

@property int firstNumber;
@property int secondNumber;
@property int userAnswer;

- (BOOL) isSameOperation: (Operation *)operation;
- (BOOL) isCorrectUserAnswer;
- (int) correctAnswer;
- (instancetype)initWithRandomNumbers;

@end

@interface NSMutableArray (OperationMutableArray)

- (BOOL) containsOperation:(Operation *) operation;

@end
