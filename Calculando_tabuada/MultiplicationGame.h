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
@property (strong, nonatomic) NSString * username;
@property (strong, nonatomic) id <GameDelegate> delegate;

-(MultiplicationOperation *)getNewUniqueOperation;

-(instancetype) initWithDelegate: (id <GameDelegate>)delegate username:(NSString *)username;

@end
