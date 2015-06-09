//
//  Game.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/9/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"

#define TIME_DELTA_FOR_BONUS            2      // segundos
#define RIGHT_ANSWER_DEFAULT_POINTS     10
#define RIGHT_ANSWER_TIME_BONUS_POINTS  10

@protocol Game <NSObject>

@required

@property (strong, nonatomic) Operation * currentOperation;
@property (strong, nonatomic) NSMutableArray * operations;
@property (nonatomic) int score;

- (Operation *)getNewUniqueOperation;
- (void)changeCurrentOperation;
- (int)getCurrentOperationScore;

@end