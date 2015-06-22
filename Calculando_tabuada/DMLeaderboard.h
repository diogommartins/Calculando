//
//  DMLeaderboard.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/20/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@protocol DMLeaderboardDelegate <NSObject>

@optional
-(void)leaderboardDidFinishSaveScore;
-(void)leaderboardDidFinishUpdate;

@end

@interface DMScore : NSObject

@property (strong, nonatomic) NSNumber * points;
@property (strong, nonatomic) NSString * username;
@property (strong, nonatomic) NSString * timestamp;

-(instancetype) initWithScore: (NSNumber *)score user:(NSString *)user;
-(instancetype) initWithAPIResultDictionary: (NSDictionary *)result;
-(NSDictionary *)toDict;

@end

@interface DMLeaderboard : NSObject

@property int positions;
@property (strong, nonatomic) NSArray * topScores;
@property (strong, nonatomic) AFHTTPRequestOperationManager * apiManager;
@property (strong, nonatomic) id <DMLeaderboardDelegate> delegate;

-(instancetype)initWithPositions: (int)positions;
-(void) update ;
-(void) saveScore: (DMScore *)score;

@end
