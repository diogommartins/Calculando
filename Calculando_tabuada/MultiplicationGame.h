//
//  MultiplicationGame.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultiplicationOperation.h"
#import "Game.h"

@interface MultiplicationGame: NSObject <Game>

@property (strong, nonatomic) MultiplicationOperation * currentOperation;
@property (strong, nonatomic) NSMutableArray * operations;
@property (nonatomic) int score;

-(MultiplicationOperation *)getNewUniqueOperation;

@end
