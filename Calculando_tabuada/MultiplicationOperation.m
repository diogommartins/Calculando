//
//  MultiplicationOperation.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "MultiplicationOperation.h"

@implementation MultiplicationOperation

-(int)correctAnswer{
    return self.firstNumber * self.secondNumber;
}

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%i x %i", self.firstNumber, self.secondNumber];
}
@end
