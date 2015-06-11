//
//  Operation.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"
#define MAX_NUMBER_VALUE 10

@interface Operation : NSObject

@property int firstNumber;
@property int secondNumber;
@property (strong, nonatomic) NSNumber *userAnswer;
@property NSTimeInterval timestamp;
@property int secondsLeft;

- (BOOL) isSameOperation: (Operation *)operation;
- (BOOL) isCorrectUserAnswer;
- (int) correctAnswer;
- (void) setUserAnswer:(NSNumber *)userAnswer timer:(Timer *)timer;
- (instancetype)initWithRandomNumbers;
- (NSString *) toString;

@end

@interface NSMutableArray (OperationMutableArray)

- (BOOL) containsOperation:(Operation *) operation;

@end
