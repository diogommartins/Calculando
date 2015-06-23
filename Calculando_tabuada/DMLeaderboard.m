//
//  DMLeaderboard.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/20/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "DMLeaderboard.h"
#define kLEADERBOARD_API_URL @"http://192.168.1.106:8000/calculando/leaderboard/api"

@implementation DMScore

-(instancetype) initWithAPIResultDictionary: (NSDictionary *)result {
    if (self = [super init])
    {
        self.username = [result objectForKey: @"username"];
        self.points = [result objectForKey: @"points"];
        self.timestamp = [result objectForKey: @"submit_timestamp"];
    }
    return self;
}

-(instancetype)initWithScore:(NSNumber *)score user:(NSString *)user
{
    if (self = [super init])
    {
        self.points = score;
        self.username = user;
    }
    return self;
}

-(NSDictionary *)toDict
{
    return @{ @"username": self.username, @"points": self.points };
}

@end

@implementation DMLeaderboard

-(instancetype)init{
    if (self = [super init])
    {
        self.apiManager = [AFHTTPRequestOperationManager manager];
        self.positions = 0;
    }
    return self;
}

-(instancetype)initWithPositions:(int)positions{
    if (self = [super init])
    {
        self.apiManager = [AFHTTPRequestOperationManager manager];
        self.positions = positions;
        [self update];
    }
    return self;
}

-(void) update
{
    [self.apiManager GET: kLEADERBOARD_API_URL
              parameters: nil
                 success: ^(AFHTTPRequestOperation *operation, id responseObject) {
                     NSArray * scores = [responseObject objectForKey:@"leaderboard"];
                     NSMutableArray * leaderboard = [[NSMutableArray alloc] initWithCapacity: self.positions];
                     for (NSDictionary * score in scores)
                         [leaderboard addObject: [[DMScore alloc] initWithAPIResultDictionary: score]];
                     
                     self.topScores = [NSArray arrayWithArray: leaderboard];
                     if (self.delegate)
                         [self.delegate leaderboardDidFinishUpdate];
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     self.topScores = [NSArray new];
                 }];
}

-(void)saveScore:(DMScore *)score
{
    [self.apiManager POST: kLEADERBOARD_API_URL
               parameters: [score toDict]
                  success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
                      int position = [responseObject[@"position"] intValue];
                      if (position <= self.positions)
                          [self update];    // Só vale a pena atualizar quando a posição fizer diferença na leaderboard
                      if (self.delegate)
                          [self.delegate leaderboardDidFinishUpdate];
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      NSLog(@"Erro ao salvar score... Você deveria ter tratado esse caso :(");
                  }];
}

@end
