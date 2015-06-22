//
//  LeaderboardViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/19/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "LeaderboardViewController.h"

@interface LeaderboardViewController ()
@property (weak, nonatomic) IBOutlet UITabBarItem *lblTabBarItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeaderboardViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
    
    self.leaderboard = [[DMLeaderboard alloc] initWithPositions: 10];
    [self.leaderboard setDelegate: self];
    [self.leaderboard update];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leaderboard.positions;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"leaderboardCell" forIndexPath: indexPath];
    DMScore * score = [self.leaderboard.topScores objectAtIndex: indexPath.row];
    [cell.textLabel setText: score.username];
    [cell.detailTextLabel setText: [NSString stringWithFormat: @"%@ pontos", score.points]];
    return cell;
}

#pragma mark - DMLeaderboardDelegate
-(void)leaderboardDidFinishUpdate
{
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
