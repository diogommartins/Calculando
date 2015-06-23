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
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    self.game = [[MultiplicationGame alloc] initWithDelegate: self
                                                    username: [defaults objectForKey: @"username"]];
    self.timer = [[Timer alloc] initWithDuration:DEFAULT_GAME_DURATION interval:1.0 delegate:self];
    [self.timer start];
    [self updateNumbersLabels];
}

#pragma mark - TimerDelegate Methods

-(void)timerDidUpdate{
    [self.lblTimer setText: [NSString stringWithFormat:@"%i", [self.timer seconds]]];
}

-(void)timerDidEnd{
    DMLeaderboard * leaderboard = [[DMLeaderboard alloc] init];
    [leaderboard saveScore: [[DMScore alloc] initWithScore: [NSNumber numberWithInt: self.game.score]
                                                      user: self.game.username]];
    
    [self performSegueWithIdentifier:@"showGameResults" sender:self];
}

#pragma mark - GameViewDelegate Methods

-(void)scoreDidChangeWithPoints: (int)points{
    [self.lblScore setText: [NSString stringWithFormat:@"%i", self.game.score]];
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(UITextFieldTextDidChange:)
                                                 name: UITextFieldTextDidChangeNotification
                                               object: textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UITextFieldTextDidChangeNotification
                                                  object: textField];
}

- (void) UITextFieldTextDidChange:(NSNotification*)notification
{
    UITextField * textfield = (UITextField*)notification.object;
    int currentNumber = [textfield.text intValue];
    if ([self.game.currentOperation isCorrectAnswer: currentNumber])
        [self sendAnswer];
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

- (void)sendAnswer
{
    [self.game.currentOperation setUserAnswer: [NSNumber numberWithInt:[self.fieldAnswer.text intValue]]
                                  secondsLeft: self.timer.seconds];
    [self clearAnswerTextField];
    [self displayFeedback];
    [self changeOperation: nil];
}



@end
