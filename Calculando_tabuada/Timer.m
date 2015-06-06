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

-(instancetype)initWithLabel:(UILabel *)label duration:(int)seconds{
    if (self = [super init])
    {
        self.label = label;
        self.seconds = seconds;
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
    self.seconds--;
    [self updateLabel];
}

-(void) updateLabel{
    [self.label setText: [NSString stringWithFormat:@"%i", self.seconds]];
}

/**!
 @todo Acho que tinha que fazer mais alguma cois aqui...
 */
- (void) stop{
    [self.timer invalidate];
}

- (void)increaseTime:(int)seconds{
    self.seconds += seconds;
}

@end
