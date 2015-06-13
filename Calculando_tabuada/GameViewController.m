//
//  FirstViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "GameViewController.h"
#import "RelatorioViewController.h"

#define GOOD_FEEDBACK @"Acertô mizeravi!"
#define BAD_FEEBACK @"Errou, burrão!"
#define DEFAULT_GAME_DURATION 5
#define TIME_BONUS 2

@interface GameViewController ()

- (void) clearAnswerTextField;
- (void) displayFeedback;

@end

@implementation GameViewController

-(void)startGame{
    self.game = [[MultiplicationGame alloc] initWithDelegate: self];
    self.timer = [[Timer alloc] initWithDuration:DEFAULT_GAME_DURATION interval:1.0 delegate:self];
    [self.timer start];
    [self updateNumbersLabels];
}

#pragma mark - TimerDelegate Methods

-(void)timerDidUpdate{
    [self.lblTimer setText: [NSString stringWithFormat:@"%i", [self.timer seconds]]];
}

-(void)timerDidEnd{
    [self performSegueWithIdentifier:@"showGameResults" sender:self];
}

#pragma mark - GameViewDelegate Methods

-(void)scoreDidChangeWithPoints: (int)points{
    [self.lblScore setText: [NSString stringWithFormat:@"%i", self.game.score]];
}

#pragma mark - UIViewController Methods

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self startGame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GameViewController

-(void)updateNumbersLabels{
    self.lblFirstNumber.text = [NSString stringWithFormat:@"%i", [self.game.currentOperation firstNumber]];
    self.lblSecondNumber.text = [NSString stringWithFormat:@"%i", [self.game.currentOperation secondNumber]];
}

- (void)clearAnswerTextField{
    self.fieldAnswer.text = nil;
}

- (void)displayFeedback{
    if (self.game.currentOperation.userAnswer && [self.game.currentOperation isCorrectUserAnswer]){
        self.lblFeedback.text = GOOD_FEEDBACK;
        [self.feedbackBackground setBackgroundColor: [UIColor greenColor]];
        [self.timer increaseTime: TIME_BONUS];
    }
    else{
        self.lblFeedback.text = BAD_FEEBACK;
        [self.feedbackBackground setBackgroundColor: [UIColor redColor]];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showGameResults"]){
        RelatorioViewController * destinationViewController = [segue destinationViewController];
        [destinationViewController setGame: self.game];
    }
}

#pragma mark - IBActions

- (IBAction)changeOperation:(UIButton *)sender {
    [self clearAnswerTextField];
    [self.game changeCurrentOperation];
    [self updateNumbersLabels];
}

- (IBAction)sendAnswer:(UIButton *)sender
{
    [self.game.currentOperation setUserAnswer: [NSNumber numberWithInt:[self.fieldAnswer.text intValue]]
                                        timer: self.timer];
    [self clearAnswerTextField];
    [self displayFeedback];
    [self changeOperation: sender];
}



@end
