//
//  LeaderboardViewController.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/19/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMLeaderboard.h"

@interface LeaderboardViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DMLeaderboardDelegate>

@property (strong, nonatomic) DMLeaderboard *leaderboard;

@end
