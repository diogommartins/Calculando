//
//  DMScore.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/20/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMScore : NSObject

@property (strong, nonatomic) NSNumber * score;
@property (strong, nonatomic) NSString * user;
@property (strong, nonatomic) NSString * timestamp;

-(instancetype) initWithAPIResultDictionary: (NSDictionary *)result;

@end
