//
//  Timer.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/6/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "GameViewDelegate.h"

@interface Timer : NSObject

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) int seconds;
@property (strong, nonatomic) UIViewController <GameViewDelegate> *target;

- (instancetype) initWithLabel: (UILabel *)label
                      duration: (int)seconds
                callbackTarget: (UIViewController <GameViewDelegate>*)target;
- (void) start;
- (void) stop;
- (void) increaseTime:(int) seconds;

@end
