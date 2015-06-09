//
//  FirstViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "GameViewController.h"

#define GOOD_FEEDBACK @"Acertô mizeravi!"
#define BAD_FEEBACK @"Errou, burrão!"
#define DEFAULT_GAME_DURATION 10
#define TIME_BONUS 2

@interface GameViewController ()

- (void) clearAnswerTextField;
- (void) displayFeedback;

@end

@implementation GameViewController

#pragma mark - GameViewDelegate Methods

-(void)startGame{
    self.game = [MultiplicationGame new];
    self.timer = [[Timer alloc] initWithLabel: self.lblTimer
                                     duration: DEFAULT_GAME_DURATION
                               callbackTarget: self];
    [self.timer start];
    [self updateNumbersLabels];
}

-(void)endGame{
    [self performSegueWithIdentifier:@"showGameResults" sender:self];
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

#pragma mark - IBActions

- (IBAction)changeOperation:(UIButton *)sender {
    [self clearAnswerTextField];
    [self.game changeCurrentOperation];
    [self updateNumbersLabels];
}

- (IBAction)sendAnswer:(UIButton *)sender {
    [self.game.currentOperation setUserAnswer: [NSNumber numberWithInt:[self.fieldAnswer.text intValue]]
                                        timer: self.timer];
    [self clearAnswerTextField];
    [self displayFeedback];
    [self changeOperation: sender];
}

@end
