//
//  MultiplicationGame.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultiplicationOperation.h"

@interface MultiplicationGame : NSObject

@property (strong, nonatomic) MultiplicationOperation * currentOperation;
@property (strong, nonatomic) NSMutableArray * operations;

-(void) changeCurrentOperation;

@end
