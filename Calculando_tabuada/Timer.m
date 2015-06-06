//
//  Timer.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/6/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "Timer.h"

@implementation Timer

-(instancetype)initWithLabel:(UILabel *)label{
    if (self = [super init])
    {
        self.label = label;
    }
    return self;
}

- (void)start{
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector: @selector(updateTimerLabel)
                                                userInfo: nil
                                                 repeats: YES];
}

-(void) updateTimerLabel{
    
}

- (void) stop{
    
}

@end
