//
//  DMScore.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/20/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "DMScore.h"

@implementation DMScore

-(instancetype) initWithAPIResultDictionary: (NSDictionary *)result {
    if (self = [super init])
    {
        self.user = [result objectForKey: @"user_id"];
        self.score = [result objectForKey: @"points"];
        self.timestamp = [result objectForKey: @"submit_timestamp"];
    }
    return self;
}

@end
