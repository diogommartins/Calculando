//
//  DMLeaderboard.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/20/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface DMLeaderboard : NSObject

@property int positions;
@property (strong, nonatomic) NSArray * topScores;
@property (strong, nonatomic) AFHTTPRequestOperationManager * apiManager;

-(instancetype)initWithPositions: (int)positions;
-(void) update;

@end
