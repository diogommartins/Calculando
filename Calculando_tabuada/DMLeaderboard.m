//
//  DMLeaderboard.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/20/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "DMLeaderboard.h"
#import "DMScore.h"
#define kLEADERBOARD_API_URL @"http://127.0.0.1:8000/calculando_backend/leaderboard/api"

@implementation DMLeaderboard


-(instancetype)initWithPositions:(int)positions{
    if (self = [super init])
    {
        self.apiManager = [AFHTTPRequestOperationManager manager];
        self.positions = positions;
        [self updateLeaderboard];
    }
    return self;
}

-(void) updateLeaderboard
{
    [self.apiManager GET: kLEADERBOARD_API_URL
              parameters: nil
                 success: ^(AFHTTPRequestOperation *operation, id responseObject) {
                     NSArray * scores = [responseObject objectForKey:@"leaderboard"];
                     NSMutableArray * leaderboard = [[NSMutableArray alloc] initWithCapacity: self.positions];
                     for (NSDictionary * score in scores)
                         [leaderboard addObject: [[DMScore alloc] initWithAPIResultDictionary: score]];
                     
                     self.topScores = [NSArray arrayWithArray: leaderboard];
                     
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     self.topScores = [NSArray new];
                 }];
    
}
@end
