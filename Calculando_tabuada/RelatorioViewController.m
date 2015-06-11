//
//  RelatorioViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "RelatorioViewController.h"

@interface RelatorioViewController () 

-(void)setCellLabelForOperation: (Operation *)operation withLabel:(UILabel *)label;
-(void)updateRightAndWrongsLabels;
-(void)updateScoreLabel;
-(void)updateCountLabel:(UILabel *)label withCount:(int)count;

@end

@implementation RelatorioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateRightAndWrongsLabels];
    [self updateScoreLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UILabels related private methods
-(void)updateCountLabel:(UILabel *)label withCount:(int)count
{
    [label setText:[NSString stringWithFormat:@"%i", count]];
}

-(void)updateRightAndWrongsLabels
{
    int rights = 0, wrongs = 0;
    for (Operation * op in self.game.operations)
        if ([op isCorrectUserAnswer])
            rights++;
        else
            wrongs++;
    
    [self updateCountLabel:self.lblRightsCount withCount:rights];
    [self updateCountLabel:self.lblWrongsCount withCount:wrongs];
}

-(void)updateScoreLabel{
    [self.lblScore setText:[NSString stringWithFormat:@"%i pontos !", self.game.score]];
}

#pragma mark - Table view data source

-(void)setCellLabelForOperation:(Operation *)operation withLabel:(UILabel *)label
{
    if ([operation isCorrectUserAnswer]){
        [label setText: [NSString stringWithFormat:@"%d é a resposta correta !", [operation correctAnswer]]];
        [label setTextColor: [UIColor greenColor]];
    }
    else{
        [label setText: [NSString stringWithFormat:@"Você errou. %d é a resposta correta !", [operation correctAnswer]]];
        [label setTextColor: [UIColor redColor]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.game.operations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"operationCell" forIndexPath:indexPath];
    Operation * operation = [self.game.operations objectAtIndex: indexPath.row];
    
    [cell.textLabel setText: [operation toString]];
    [self setCellLabelForOperation: operation withLabel: cell.detailTextLabel];
    
    return cell;
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
