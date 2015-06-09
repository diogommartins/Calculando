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
- (void) updateLabel;

@end

@implementation Timer

- (instancetype) initWithLabel: (UILabel *)label duration:(int)seconds callbackTarget:(UIViewController <GameViewDelegate>*)target{
    if (self = [super init])
    {
        self.label = label;
        self.seconds = seconds;
        self.target = target;
    }
    return self;
}

- (void)start{
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector: @selector(update)
                                                userInfo: nil
                                                 repeats: YES];
    
    [self updateLabel];
}

- (void) update{
    if (self.seconds > 0){
        self.seconds--;
        [self updateLabel];
    }
    else{
        [self stop];
    }
}

-(void) updateLabel{
    [self.label setText: [NSString stringWithFormat:@"%i", self.seconds]];
}

- (void) stop{
    [self.timer invalidate];
    [self.target endGame];
}

- (void)increaseTime:(int)seconds{
    self.seconds += seconds;
    [self updateLabel];
}

@end
