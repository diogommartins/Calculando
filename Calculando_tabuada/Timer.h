//
//  Timer.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/6/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol TimerDelegate <NSObject>

@required
- (void) timerDidUpdate;
- (void) timerDidEnd;

@end

@interface Timer : NSObject

@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) int seconds;
@property (nonatomic) float interval;
@property (strong, nonatomic) UIViewController <TimerDelegate> *delegate;

- (instancetype) initWithDuration: (int)seconds
                         interval: (float)interval
                   delegate: (UIViewController <TimerDelegate>*)delegate;
- (void) start;
- (void) stop;
- (void) increaseTime:(int) seconds;

@end
