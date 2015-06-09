//
//  Timer.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/6/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "Timer.h"

@interface Timer()

- (void) update;

@end

@implementation Timer

-(instancetype)initWithDuration:(int)seconds interval:(float)interval delegate:(UIViewController<TimerDelegate> *)delegate{
    if (self = [super init])
    {
        self.seconds = seconds;
        self.interval = interval;
        self.delegate = delegate;
    }
    return self;
}

- (void)start{
    self.timer = [NSTimer scheduledTimerWithTimeInterval: self.interval
                                                  target: self
                                                selector: @selector(update)
                                                userInfo: nil
                                                 repeats: YES];
}

- (void) update{
    if (self.seconds > 0){
        self.seconds--;
        [self.delegate timerDidUpdate];
    }
    else{
        [self stop];
    }
}

- (void) stop{
    [self.timer invalidate];
    [self.delegate timerDidEnd];
}

- (void)increaseTime:(int)seconds{
    self.seconds += seconds;
    [self.delegate timerDidUpdate];
}

@end
