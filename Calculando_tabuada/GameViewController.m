//
//  FirstViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "GameViewController.h"

#define GOOD_FEEDBACK @"Que foda!"
#define BAD_FEEBACK @"Errou, burrão!"
#define DEFAULT_GAME_DURATION 10
#define TIME_BONUS 2

@interface GameViewController ()

- (void) clearAnswerTextField;
- (void) displayFeedback;
- (void) updateTimerLabel;

@end

@implementation GameViewController

- (void)endGame{
    NSLog(@"Fim de jogo");
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.game = [MultiplicationGame new];
    self.timer = [[Timer alloc] initWithLabel: self.lblTimer
                                     duration: DEFAULT_GAME_DURATION
                                  endCallback: @selector(endGame)];
    [self.timer start];
    [self updateNumbersLabels];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateNumbersLabels{
    self.lblFirstNumber.text = [NSString stringWithFormat:@"%i", [self.game.currentOperation firstNumber]];
    self.lblSecondNumber.text = [NSString stringWithFormat:@"%i", [self.game.currentOperation secondNumber]];
}

- (IBAction)changeOperation:(UIButton *)sender {
    [self clearAnswerTextField];
    [self.game changeCurrentOperation];
    [self updateNumbersLabels];
}

- (void)clearAnswerTextField{
    self.fieldAnswer.text = nil;
}

- (void)displayFeedback{
    if ([self.game.currentOperation correctAnswer] == 0)
        NSLog(@"Resultado esperado %i", [self.game.currentOperation correctAnswer]);
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

- (IBAction)sendAnswer:(UIButton *)sender {
    [self.game.currentOperation setUserAnswer: [NSNumber numberWithInt:[self.fieldAnswer.text intValue]]
                                        timer: self.timer];
    [self clearAnswerTextField];
    [self displayFeedback];
    [self changeOperation: sender];
}

@end
