//
//  Timer.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/6/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Timer : NSObject

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) int seconds;

- (instancetype) initWithLabel: (UILabel *)label duration:(int)seconds;
- (void) start;
- (void) stop;
- (void) increaseTime:(int) seconds;

@end
