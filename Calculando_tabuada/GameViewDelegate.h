//
//  GameViewDelegate.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/8/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameViewDelegate <NSObject>

@required
- (void) startGame;
- (void) endGame;

@end
